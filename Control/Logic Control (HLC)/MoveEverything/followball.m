function followball()

%% ROS setup
%Publisher
RefPub = rospublisher('reference','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');


%Subscriber
ball_pos = rossubscriber('/object_update');
sub = rossubscriber('/encoder','geometry_msgs/Vector3');


%% SETUP IK
[gik, posTgt, jointConst, robot, ~ ,  ~]=setupIK();

%% MAIN
obj_index = 1;

while true
    %Find ball
    coords = receive(ball_pos,1);
    posTgt.TargetPosition = [coords.Objects(obj_index).X/1000; coords.Objects(obj_index).Y/1000; coords.Objects(obj_index).Z/1000];
    
    %ik
    [q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
    jointstates(1) = -q(1).JointPosition; jointstates(2) =  -q(2).JointPosition; jointstates(3) = -q(3).JointPosition;
    
    %publish motion
    RefMsg.X = jointstates(1);
    RefMsg.Y = jointstates(2);
    RefMsg.Z = jointstates(3);
    send(RefPub,RefMsg);
end
end