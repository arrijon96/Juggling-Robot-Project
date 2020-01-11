function JointStates = catch_ball(sample_th, catch_height)

    %setup parameters
    n_samples = 5;
    N_estim = 4;
    
    %sample
    
    [samples, time_sampling] = sample(n_samples, sample_th);
    sum(time_sampling)
    
    %estimate
    tic
    estimations = estimation(samples, N_estim, catch_height, time_sampling);
    %estimations = estimation2(samples,catch_height, time_sampling);
    pos = [estimations(1,1) estimations(1,2) estimations(1,3)]; % end = 1
    toc
%     %interpolate
%     x_catch = interp1(estimations(:,3),estimations(:,1),catch_height,'linear','extrap');
%     y_catch = interp1(estimations(:,3),estimations(:,2),catch_height,'linear','extrap');
%     pos = [x_catch y_catch catch_height];

    
    %ik
    tic
    JointStates = ik_fast(pos);
    toc
    
    %motion
    tic 
    publish_motion(JointStates(1), JointStates(2), JointStates(3));
    toc 
    
    %Analyze
%     save samples
%     save estimations
%     figure
%     plot3(samples(:,1),samples(:,2),samples(:,3),'r');
%     grid on; hold on;
%     plot3(estimations(:,1),estimations(:,2),estimations(:,3),'b');
%     plot3(pos(1),pos(2),pos(3), '*g');
end