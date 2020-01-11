clear all; clc; clf;
%% Import robot
robot = importrobot('jurp1.urdf');
robot.DataFormat = 'struct';
showdetails(robot);

%% %% Define geometry
%Points
config = homeConfiguration(robot);
pt = get_pt(robot, config);

%Lengths
l.l1 = pt.A(3)-pt.O(3);
l.l2 = sqrt((pt.A(1)-pt.B(1))^2+(pt.A(2)-pt.B(2))^2+(pt.A(3)-pt.B(3))^2);
l.l3 = sqrt((pt.B(1)-pt.C(1))^2+(pt.B(2)-pt.C(2))^2+(pt.B(3)-pt.C(3))^2);
l.l4 = sqrt((pt.C(1)-pt.D(1))^2+(pt.C(2)-pt.D(2))^2+(pt.C(3)-pt.D(3))^2);

%% Define IK
gik = generalizedInverseKinematics;
gik.RigidBodyTree = robot;
gik.ConstraintInputs = {'position'};
posTgt = constraintPositionTarget('Hand_Link');
jointConst = constraintJointBounds(robot);
jointConst.Bounds = [-pi/2 pi/2;-pi/2 pi/2;-pi/2 pi/2];


%% Define trajectory
n_pt = 10;
yC = pt.B(1); %it is y in real
zC = pt.C(3)+0.2;
r = l.l4;

pos =zeros(3,n_pt);
[pos(1,:),pos(3,:)] = circle(yC,zC,r,n_pt);
pos (2,:) = pt.D(2);

%% Simulation
%Move to initial position and get the points
q(1,:) = homeConfiguration(robot);

%Visualize the robot and the goal
show(robot, q(1,:), 'Frames', 'off');
hold on
plot3(pos(1,:),pos(2,:),pos(3,:),'r*')


%Simulate
for i = 2:size(pos,2)
    %Trajectory
    posTgt.TargetPosition =pos(:,i);
    plot3(posTgt.TargetPosition(1),posTgt.TargetPosition(2),posTgt.TargetPosition(3),'bo')
    
    %IK
    tic
    [q,solutionInfo] = gik(robot.homeConfiguration,posTgt); %Inverse Kinematics
    toc
    
    %FK
    pt = get_pt(robot,q); %Update points
    %pt.D-pos(:,i)' %error
    
    %Plot
    show(robot,q,'PreservePlot',false, 'Frames', 'off'); %Display
    drawnow;
end

%% Functions
function [x,y] = circle(xC,zC,r,n_pt)
    th = linspace(0,2*pi,n_pt);
    x = (r * cos(th) + xC)';
    y = (r * sin(th) + zC)';
end


function pt = get_pt(robot,config)
    pt.O = tform2trvec(getTransform(robot,config,'base_link'));
    pt.A = tform2trvec(getTransform(robot,config,'Shoulder_Link'));
    pt.B = tform2trvec(getTransform(robot,config,'Transverse_Link'));
    pt.C = tform2trvec(getTransform(robot,config,'Elbow_Link'));
    pt.D = tform2trvec(getTransform(robot,config,'Hand_Link'));
end

