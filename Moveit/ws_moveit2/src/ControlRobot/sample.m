function [ball_pos, t_samples] = sample(n_sample, low_lim)

vicon_pos = rossubscriber('/object_update');

curr_sample = 1;
ball_pos =zeros(n_sample,3);
t_samples = zeros(n_sample,1);

object_index = 1;

tic;

while true

    coords = receive(vicon_pos,1);         % Receiving Vicon coordinates
    t = toc;
    tic;
    x_vic = coords.Objects(object_index).X/1000;
    y_vic = coords.Objects(object_index).Y/1000;
    z_vic = coords.Objects(object_index).Z/1000;
    
    if z_vic > low_lim                                      % Height of ball higher than certain limit? --> throw is taking place
        if curr_sample <= n_sample
            ball_pos(curr_sample,1:3) = [x_vic y_vic z_vic];
            t_samples(curr_sample) = t;
            curr_sample = curr_sample + 1;
        end
        if curr_sample>n_sample
            break
        end
    end
end

end