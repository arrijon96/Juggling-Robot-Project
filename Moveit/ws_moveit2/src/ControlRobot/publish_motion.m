function publish_motion(goal1, goal2, goal3)
    %tic
    
    %% Elbow (Special)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    RefPub3 = rospublisher('reference3','std_msgs/Float64');
    RefMsg3 = rosmessage('std_msgs/Float64');
    RefMsg3.Data = goal3;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% Trajectory splitter setup
    N = 10;
    t = 0.015;
    
    %% ROS setup
    
    %Publisher
    RefPub = rospublisher('reference','geometry_msgs/Vector3');
    RefMsg = rosmessage('geometry_msgs/Vector3');
    
    
    %Subscriber
    sub = rossubscriber('/encoder','geometry_msgs/Vector3');
    start = receive(sub);
    

    %% Motion spliter
    
    % Define trajectories
    ref1 = linspace(start.X, goal1, N);
    ref2 = linspace(start.Y, goal2, N);
    RefMsg.Z = 0;
    
    %Publish trajectories
    send(RefPub3,RefMsg3); %%%%%%%%%%%%%%%%%% Elbow (Special)
    for i = 1:N
        RefMsg.X = ref1(i);
        RefMsg.Y = ref2(i);
        send(RefPub,RefMsg);
        pause(t); 
    end
    
    %%
    %toc
end
