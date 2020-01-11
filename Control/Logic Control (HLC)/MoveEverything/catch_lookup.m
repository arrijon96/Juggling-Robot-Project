function catch_lookup(sample_th, catch_height,ik_lookup)

    %% setup parameters
    n_samples = 10;
    N_estim = 1;
    
    %% sample
    
    [samples, time_sampling] = sample(n_samples, sample_th);
%     sum(time_sampling)
    
    %% estimate
    tic
    %estimations = estimation(samples, N_estim, catch_height, time_sampling);
    estimations = estimation2(samples,catch_height, time_sampling);
    pos = [estimations(1,1) estimations(1,2) estimations(1,3)]; % end = 1
    toc
%     %interpolate
%     x_catch = interp1(estimations(:,3),estimations(:,1),catch_height,'linear','extrap');
%     y_catch = interp1(estimations(:,3),estimations(:,2),catch_height,'linear','extrap');
%     pos = [x_catch y_catch catch_height];

    
    %% ik
    tic
    jointstates(1) = ik_lookup{round(pos(1)*100+30),round(pos(2)*100),1}; 
    jointstates(2) = ik_lookup{round(pos(1)*100+30),round(pos(2)*100),2};
    jointstates(3) = ik_lookup{round(pos(1)*100+30),round(pos(2)*100),3};
    toc
    
    %% motion
    tic 
    publish_motion(jointstates(1), jointstates(2), jointstates(3));
    toc 
    
end