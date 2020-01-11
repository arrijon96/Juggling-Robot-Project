function juggle(catch_height, jointstates) %% elbow 1.2 and 1.8
%% ROS setup
%Publisher
RefPub = rospublisher('reference','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');


%Subscriber
ball_pos = rossubscriber('/object_update');
sub = rossubscriber('/encoder','geometry_msgs/Vector3');


%% SETUP IK
[gik, posTgt, jointConst, robot, ~ ,  ~]=setupIK();

%% TOSS

RefMsg.X = jointstates(1); RefMsg.Y =  jointstates(2); RefMsg.Z = jointstates(3);
send(RefPub,RefMsg);

%% CATCH
obj_index = 1;
start=tic;
while true
    %Find ball
    coords = receive(ball_pos,1);
    %ik
    posTgt.TargetPosition = [coords.Objects(obj_index).X/1000 coords.Objects(obj_index).Y/1000 catch_height];
    tic
    [q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
    toc
    RefMsg.X = -q(1).JointPosition; RefMsg.Y =  -q(2).JointPosition; RefMsg.Z = -q(3).JointPosition;

    %publish motion
    send(RefPub,RefMsg);
    if toc(start)>1
        break
    end
end
disp('Out of catch')
end

