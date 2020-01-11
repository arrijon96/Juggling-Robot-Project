function [JointStates,flags] = ik_secure()
%% Import robot
robot = importrobot('jurp1.urdf');
robot.DataFormat = 'struct';

%% Define IK
gik = generalizedInverseKinematics;
gik.RigidBodyTree = robot;
gik.ConstraintInputs = {'position','joint'};
posTgt = constraintPositionTarget('Hand_Link');
% aimTgt = constraintAiming('Hand_Link');
% aimTgt.TargetPoint = [0,0,100];

jointConst = constraintJointBounds(robot);
joint_limits = [-pi/2.25 pi/12;-0.8 0.8;-2.35 0];
jointConst.Bounds = joint_limits;

%% Define prohibited area

%Triangle (check --> https://se.mathworks.com/matlabcentral/answers/308729-how-to-plot-a-triangular-prism)
prohib.A = [0.2362 0 0.5]; 
prohib.B = [0.2362 0 1.3]; 
prohib. E = [-0.2638 0.75 0.5]; 
prohib.F = [-0.2638 0.75 1.3]; 
prohib.D = [0.7362 0.75 0.5]; 
prohib.C = [0.7362 0.75 1.3];

%% ROS communication
ball_pos = rossubscriber('/object_update');


%% MAIN
obj_index = 1;

%Find ball
coords = receive(ball_pos,1);
pos = [coords.Objects(obj_index).X/1000; coords.Objects(obj_index).Y/1000; coords.Objects(obj_index).Z/1000]; pos(3) = pos(3)+0.05;
posTgt.TargetPosition = pos;
[q,~] = gik(robot.homeConfiguration,posTgt, jointConst); %Inverse Kinematics
JointStates(1) = -q(1).JointPosition; JointStates(2) =  -q(2).JointPosition; JointStates(3) = -q(3).JointPosition;

%Checking
flags = overall_check(pos, prohib, -JointStates, joint_limits);
if (flags(1) == 0) && (flags(2) == 0)
    publish_motion(0,0,pi/2);
elseif (flags(1) == 0) && (flags(3) == 0)
    disp('Incorrect solution. Going into the loop.')
    while (flags(1) ~= 1) && (flags(3) ~= 1)
        [q,~] = gik(robot.homeConfiguration,posTgt); 
        JointStates(1) = -q(1).JointPosition; JointStates(2) =  -q(2).JointPosition; JointStates(3) = -q(3).JointPosition;
        flags = overall_check(pos, prohib, -JointStates, joint_limits);
    end
    disp('Out of the loop. Solution found.')
    publish_motion(JointStates(1), JointStates(2), JointStates(3));
else
     publish_motion(JointStates(1), JointStates(2), JointStates(3));
end
%% FUNCTIONS
function flag = reachable_area(pos,prohib)

    flag = 1;

    %Triangle

    %First equation
    if pos(1) >= prohib.A(1)
        coefficients1 = polyfit([prohib.A(1), prohib.D(1)], [prohib.A(2), prohib.D(2)], 1);
        equation1 = @(x1) coefficients1(1)*x1+coefficients1(2);
        if equation1(pos(1)) > pos(2)
            flag = 0;
        end
    end

    %Second equation
    if pos(1) < prohib.A(1)
        coefficients2 = polyfit([prohib.A(1), prohib.E(1)], [prohib.A(2), prohib.E(2)], 1);
        equation2 = @(x2) coefficients2(1)*x2+coefficients2(2);
        if equation2(pos(1)) > pos(2)
            flag = 0;
        end    
    end

    %Y limit
    if pos(2)> prohib.D(2) || pos(2) < 0 || pos(3) < prohib.E(3)
        flag = 0;
    end
end

function flag = jointstates_check(jointstates, joint_limits)
    if (joint_limits(1,1) <= jointstates(1)) && (joint_limits(1,2) >= jointstates(1)) && (joint_limits(2,1) <= jointstates(2)) && (joint_limits(2,2) >= jointstates(2)) && (joint_limits(3,1) <= jointstates(3)) && (joint_limits(3,2) >= jointstates(3))
        flag = 1;
    else 
        flag = 0;
    end
end

function flags = overall_check(pos, prohib, jointstates, joint_limits)
    %Check prohibited area
    flag_reachable = reachable_area(pos,prohib);

    %Check joint states
    flag_joints = jointstates_check(jointstates, joint_limits);
    
    if flag_reachable == 0 || flag_joints == 0
        flag = 0;
    else
        flag = 1;
    end
    flags = [flag, flag_reachable, flag_joints];
end
end