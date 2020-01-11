clear all; clc; clf;
rosshutdown; rosinit;

%% Import robot
robot = importrobot('jurp1.urdf');
robot.DataFormat = 'struct';
showdetails(robot);

%% Define geometry
%Points
robot_image = show(robot, robot.homeConfiguration, 'Frames', 'off');
xlim([-1.5 1.5]); ylim([-1.5 1.5]); zlim([0 1.5]);
hold on;

%% Define IK
gik = generalizedInverseKinematics;
gik.RigidBodyTree = robot;
gik.ConstraintInputs = {'position'};
posTgt = constraintPositionTarget('Hand_Link');
jointConst = constraintJointBounds(robot);
jointConst.Bounds = [-pi/2.25 pi/12;-0.8 0.8;-2.35 0];

%% Define prohibited area

%Triangle (check --> https://se.mathworks.com/matlabcentral/answers/308729-how-to-plot-a-triangular-prism)
prohib.A = [0.2362 0 0.5]; 
prohib.B = [0.2362 0 1.3]; 
prohib. E = [-0.2638 0.75 0.5]; 
prohib.F = [-0.2638 0.75 1.3]; 
prohib.D = [0.7362 0.75 0.5]; 
prohib.C = [0.7362 0.75 1.3];

v = [prohib.A; prohib.B; prohib.E ; prohib.F; prohib.D; prohib.C]; % Points A, B, E, F, D and C respectively
f = [1 2 4 3; 3 4 6 5; 1 2 6 5]; % For ABFE, EFCD and ABCD respectively 
view(3); % For a 3D view of your graph
patch('Faces',f,'Vertices',v,'FaceAlpha',0.25, 'FaceColor', [1,0,0]); % plotting the prism with face and vertex data

%% ROS communication
ball_pos = rossubscriber('/object_update');


%% SETUP MARKER
marker_plot = plot3(0,0,0,'r*');
obj_index = 2;

%% MAIN

while true    
    %Find ball
    coords = receive(ball_pos,10);
    pos = [coords.Objects(obj_index).X/1000; coords.Objects(obj_index).Y/1000; coords.Objects(obj_index).Z/1000];
    
    delete(marker_plot)
    marker_plot = plot3(pos(1), pos(2), pos(3),'r*');
    
    %Check prohibited area
    flag = reachable_area(pos,prohib);
    if flag == 0
        % Don't move
%         disp('DENIED')
    else
        %Go to ball
%         disp('ARRIBA!!')
        posTgt.TargetPosition = pos;
        [q,solutionInfo] = gik(robot.homeConfiguration,posTgt); %Inverse Kinematics
        show(robot,q,'PreservePlot',false, 'Frames', 'off'); %Display
    end
    
    %Check constraints
    

    
    
    pause(0.1)
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