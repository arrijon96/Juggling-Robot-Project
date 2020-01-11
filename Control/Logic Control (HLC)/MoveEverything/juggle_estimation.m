function juggle_estimation(catch_height, jointstates)
    %% ROS setup
    %Publisher
    RefPub = rospublisher('reference','geometry_msgs/Vector3');
    RefMsg = rosmessage('geometry_msgs/Vector3');


    %Subscriber
    ball_pos = rossubscriber('/object_update');
    sub = rossubscriber('/encoder','geometry_msgs/Vector3');

    %% Setup IK
    [gik, posTgt, jointConst, robot, ~ ,  ~]=setupIK();
    
    %% TOSS
    RefMsg.X = jointstates(1); RefMsg.Y =  jointstates(2); RefMsg.Z = jointstates(3);
    send(RefPub,RefMsg);
    
    
    %% Setup parameters
        n_samples = 40;
        N_estim = 1;
   
    
    %% Sample
    sample_th = 1;
    [samples, time_sampling] = sample(n_samples, sample_th);
    sum(time_sampling)
    
    %% Estimate
    tic
    %estimations = estimation(samples, N_estim, catch_height, time_sampling);
    estimations = estimation2(samples,catch_height, time_sampling);
    pos = [estimations(1,1) estimations(1,2) estimations(1,3)]; % end = 1
    toc
    
    %% Ik
    tic
    posTgt.TargetPosition = pos;
    [q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
    RefMsg.X = -q(1).JointPosition; RefMsg.Y =  -q(2).JointPosition; RefMsg.Z = -q(3).JointPosition;
    toc
    %% Publish motion
    tic
    send(RefPub,RefMsg);
    toc
end