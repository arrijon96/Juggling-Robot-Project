function catch_follow(limX, limY, catch_height, time)

%% ROS setup
%Publisher
RefPub = rospublisher('reference','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');


%Subscriber
ball_pos = rossubscriber('/object_update');
sub = rossubscriber('/encoder','geometry_msgs/Vector3');


%% SETUP IK
[gik, posTgt, jointConst, robot, ~ ,  ~]=setupIK();

%% CATCH
obj_index = 1;
start=tic;
pos(3) = catch_height;
disp('Catching')
while true
    %Find ball
    coords = receive(ball_pos,1);
    coords.Objects(obj_index).Y/1000;
    
    %Check x
    if (limX(2)<= coords.Objects(obj_index).X/1000)
        pos(1) = limX(2);
    elseif (limX(1)>= coords.Objects(obj_index).X/1000)
        pos(1) = limX(1);
    else
        pos(1) = coords.Objects(obj_index).X/1000;
    end
    
    %Check y
    if (limY(2)<= coords.Objects(obj_index).Y/1000)
        pos(2) = limY(2);
    elseif (limY(1)>= coords.Objects(obj_index).Y/1000)
        pos(2) = limY(1);
    else
        pos(2) = coords.Objects(obj_index).Y/1000;
    end
    
    %ik
    posTgt.TargetPosition = pos;
    tic
    [q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
    toc
    RefMsg.X = -q(1).JointPosition; RefMsg.Y =  -q(2).JointPosition; RefMsg.Z = -q(3).JointPosition;

    %publish motion
    send(RefPub,RefMsg);
    
    %check time
    if toc(start)>time
        break
    end
end
disp('Out of catch')
end
