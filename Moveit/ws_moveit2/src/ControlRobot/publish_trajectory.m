function publish_trajectory(goal1, goal2, goal3)
    %tic
    
    %% Elbow (Special)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    RefPub3 = rospublisher('reference3','std_msgs/Float64');
    RefMsg3 = rosmessage('std_msgs/Float64');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% Trajectory splitter setup
    N = 20;
    t = 0.015;
    
    %% ROS setup
    
    %Publisher
    RefPub = rospublisher('reference','geometry_msgs/Vector3');
    RefMsg = rosmessage('geometry_msgs/Vector3');
    
    
    %Subscriber
    sub = rossubscriber('/encoder','geometry_msgs/Vector3');
    start = receive(sub);
    

    %% Concatenate checkpoints
    for j = 1:length(goal1)
        
        % Define trajectories
        if j == 1
            begin1 = start.X;
            begin2 = start.Y;
        else
            begin1 = goal1(j-1);
            begin2 = goal2(j-1);
        end
        ref1 = linspace(begin1, goal1(j), N);
        ref2 = linspace(begin2, goal2(j), N);
        RefMsg.Z = 0;  RefMsg3.Data = goal3(j); %%%%%%%%%%%%%%%%%% Elbow (Special)

        %Publish trajectories
        send(RefPub3,RefMsg3); %%%%%%%%%%%%%%%%%% Elbow (Special)
        for i = 1:N
            RefMsg.X = ref1(i);
            RefMsg.Y = ref2(i);
            send(RefPub,RefMsg);
            pause(t); 
        end
    end
    %%
    %toc
end
