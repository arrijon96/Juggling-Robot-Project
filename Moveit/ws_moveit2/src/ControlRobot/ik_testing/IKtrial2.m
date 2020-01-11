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

%Cylinder
    % %Lower part
    % prohib.r1 = 0.090;
    % [prohib.x1, prohib.y1, prohib.z1] = cylinder(prohib.r1);
    % prohib.z1(2, :) = 1.2457;
    % surf(prohib.x1, prohib.y1, prohib.z1, 'FaceColor', [1,0,0], 'FaceAlpha', 0.25,'EdgeColor', 'none');
    % 
    % %Upper part
    % prohib.r2 = 0.2;
    % [prohib.x2, prohib.y2, prohib.z2] = cylinder(prohib.r2);
    % prohib.z2(1, :) = 1.2457;
    % prohib.z2(2, :) = 1.5;
    % surf(prohib.x2, prohib.y2, prohib.z2, 'FaceColor', [1,0,0], 'FaceAlpha', 0.25,'EdgeColor', 'none');

%Triangle (check --> https://se.mathworks.com/matlabcentral/answers/308729-how-to-plot-a-triangular-prism)
prohib.A = [0.2362 0 0]; prohib.B = [0.2362 0 1.5]; prohib. E = [0 0.75 0]; prohib.F = [0 0.75 1.5]; prohib.D = [0.5 0.75 0]; prohib.C = [0.5 0.75 1.5];
v = [prohib.A; prohib.B; prohib.E ; prohib.F; prohib.D; prohib.C]; % Points A, B, E, F, D and C respectively
f = [1 2 4 3; 3 4 6 5; 1 2 6 5]; % For ABFE, EFCD and ABCD respectively 
view(3); % For a 3D view of your graph
patch('Faces',f,'Vertices',v,'FaceAlpha',0.25, 'FaceColor', [1,0,0]); % plotting the prism with face and vertex data

%% ROS communication
ball_pos = rossubscriber('/object_update');


%% SETUP MARKER
marker_plot = plot3(0,0,0,'r*');
obj_index = 1;

%% MAIN

%%while true    
    %Find ball
    coords = receive(ball_pos,10);
    pos = [coords.Objects(obj_index).X/1000; coords.Objects(obj_index).Y/1000; coords.Objects(obj_index).Z/1000];
    
    delete(marker_plot)
    marker_plot = plot3(pos(1), pos(2), pos(3),'r*');
    
    %Check prohibited area
    %flag = reachable_area(pos,prohib);
    if flag == 1
        %break;
    end
    
    %Check constraints
    
    %Go to ball
    posTgt.TargetPosition =pos;
    [q,solutionInfo] = gik(robot.homeConfiguration,posTgt); %Inverse Kinematics
    show(robot,q,'PreservePlot',false, 'Frames', 'off'); %Display
    
    
    pause(0.5)
%%end
%% FUNCTIONS
function flag = reachable_area(pos,prohib)
    
%Cylinder
%     flag = 0;
%     %Volume 1
%     if (pos(3) <= prohib.z1(2,end)) && (((pos(1))^2 + (pos(2))^2) < prohib.r1^2)
%             disp('Aborted. Object in prohibited volume 1');
%             flag = 1;
%     end
%     
%     %Volume 2
%     if (pos(3) > prohib.z1(2,end)) && (((pos(1))^2 + (pos(2))^2) < prohib.r2^2)
%             disp('Aborted. Object in prohibited volume 2');
%             flag = 1;
%     end
    
%Triangle

%First equation
if pos(1) >= prohib.A(1)
    coefficients1 = polyfit([prohib.A(1), prohib.D(1)], [prohib.A(2), prohib.D(2)], 1);
    equation1 = @(x1) coefficients1(1)*x1+coefficients1(2);
    if equation1(pos(1)) > pos(2)
        flag = 1;
    end
end

%Second equation
if pos(1) < prohib.A(1)
    coefficients2 = polyfit([prohib.A(1), prohib.E(1)], [prohib.A(2), prohib.E(2)], 1);
    equation2 = @(x2) coefficients2(1)*x2+coefficients2(2);
    if equation2(pos(2)) > pos(2)
        flag = 1;
    end    
end

%Y limit
if pos(2)> prohib.D(2)
    flag = 1;
end
end