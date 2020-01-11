function create_lookuptable()
%% Previous stuff
plot(round(x*100)+30,round(y*100),'*r');
%% For getting data from graph

% h = findobj(gca,'Type','line')
% x=get(h,'Xdata')
% y=get(h,'Ydata')

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

%% Scan-line
hold on
scanline = zeros (70,100);
for i=1:size(scanline,2)
    index = find(Y == Y(i));
    maximum = max(X(index));
    minimum = min(X(index));
    scanline(Y(i), minimum:maximum) = (minimum:maximum);
end
for i = 1:size(scanline,1)
    for j = 1:size(scanline,2)
        if scanline(i,j) ~= 0
            plot(j,i, '*b');
            endleg
    end
end

%% Save from cloud point
X_all=[]; Y_all =[];
for i=1:1862
    X_all= [X_all dataObjs(i).XData];
    Y_all =[Y_all dataObjs(i).YData];
end
%% Do a one hot representation

points = zeros(100,70);
for i = 1:length(X_all)
    points(X_all(i),Y_all(i)) = 1;
end

%% IK lookup creator
%Check ik_look_creator.m

%% Verify lookup table
end

