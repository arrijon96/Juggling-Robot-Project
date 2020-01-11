function pos = track_ball()
%% ROS communication
ball_pos = rossubscriber('/object_update');


%% MAIN
obj_index = 1;

%Find ball
coords = receive(ball_pos,1);
pos = [coords.Objects(obj_index).X/1000; coords.Objects(obj_index).Y/1000; coords.Objects(obj_index).Z/1000];
pos(3) = pos(3)+0.05;
end