function create_lookuptable()
%% Define IK
% [gik, posTgt, jointConst, robot, joint_limits , prohib]=setupIK();

%% Define limits
vicon_pos = rossubscriber('/object_update');



object_index = 2;

cont = 0;
while true
    cont = cont+1;
    coords = receive(vicon_pos,1);         % Receiving Vicon coordinates
    ball_pos(cont,1) = coords.Objects(object_index).X/1000;
    ball_pos(cont,2) = coords.Objects(object_index).Y/1000;
    ball_pos(cont,3) = coords.Objects(object_index).Z/1000;

    if ball_pos(cont,3)>1.1
        break
    end
    pause(0.1)
end
figure
plot3(ball_pos(:,1), ball_pos(:,2), ball_pos(:,3)); grid on;
save ball_pos;
end

