function [JointStates,flags] = ik_solve(pos)
%% Define IK
[gik, posTgt, jointConst, robot, joint_limits , prohib]=setupIK();

%% MAIN
posTgt.TargetPosition = pos;

[q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
JointStates(1) = -q(1).JointPosition; JointStates(2) =  -q(2).JointPosition; JointStates(3) = -q(3).JointPosition;

%Checking
flags = overall_check(pos, prohib, -JointStates, joint_limits);


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