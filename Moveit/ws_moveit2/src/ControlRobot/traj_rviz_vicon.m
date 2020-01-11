clf;
close all;
clc;
clear;
rosshutdown;rosinit;

vicon_pos = rossubscriber('/object_update');

% Import robot
robot = importrobot('jurp19_V4.urdf');
robot.DataFormat = 'struct';

% Define IK
gik = generalizedInverseKinematics;
gik.RigidBodyTree = robot;
gik.ConstraintInputs = {'position'};
posTgt = constraintPositionTarget('Hand_Link');
jointConst = constraintJointBounds(robot);
jointConst.Bounds = [-pi/2 pi/2;-pi/2 pi/2;-pi/4 pi*5/6];

JointPub = rospublisher('/joint_states','sensor_msgs/JointState');
JointMsg = rosmessage('sensor_msgs/JointState');

% platf_h = 1.24;
toss = false;                   % When ball is in cup and under low_lim, sampling will not happen
n_sample = 20;                  % How many samples are used
n_estim = 4;                    % Number of estimations
low_lim = 1.2;                  % Above this limit the ball will be considered to be in a toss
ball_samples = [];              % Sampling of the whole trajectory so that it can be plotted
estimate = 1;
curr_sample = 1;
object_index = 1;
z_catch = 0.95;            % Height where ee should catch ball
t_samples= zeros(n_sample,1);
ball_pos = zeros(n_sample,3);

MarkerPub = rospublisher('target_position','geometry_msgs/Point');
MarkerMsg = rosmessage('geometry_msgs/Point');

% Setting arm in "home" position
JointMsg.Position(1) = 0; 
JointMsg.Name(1) = {'Shoulder_Joint'};
JointMsg.Position(2) = 0; 
JointMsg.Name(2) = {'Transverse_Joint'};
JointMsg.Position(3) = 0; 
JointMsg.Name(3) = {'Elbow_Joint'};

send(JointPub,JointMsg)

pause(2)

tic

while true

    coords = receive(vicon_pos,10);         % Receiving Vicon coordinates
    t = toc;                                % Getting time value for surrent position of ball
    tic
    x_vic = coords.Objects(object_index).X/1000;
    y_vic = coords.Objects(object_index).Y/1000;
    z_vic = coords.Objects(object_index).Z/1000;
    
    
    % Updating position of ball marker in RViz
    MarkerMsg.X = x_vic;
    MarkerMsg.Y = y_vic; 
    MarkerMsg.Z = z_vic;
    send(MarkerPub,MarkerMsg);
    
    
    if z_vic > low_lim                                      % Height of ball higher than certain limit? --> throw is taking place
            
        toss = true;
        ball_samples = [ball_samples;x_vic y_vic z_vic];    % Sampling whole trajectory, for plotting
        if curr_sample <= n_sample
            ball_pos(curr_sample,1:3) = [x_vic y_vic z_vic];
            t_samples(curr_sample) = t;
            curr_sample = curr_sample + 1;
        end
        
        if curr_sample>n_sample
            if estimate == 1
                [Intersect,~] = ball_trajectory_calculater_tres(ball_pos,n_sample,n_estim,low_lim,t_samples);
                
                x_catch = interp1(Intersect(:,3),Intersect(:,1),z_catch,'linear','extrap');
                y_catch = interp1(Intersect(:,3),Intersect(:,2),z_catch,'linear','extrap');
                catch_point = [x_catch y_catch z_catch];
%                 posTgt.TargetPosition = Intersect(1,:);
%                 posTgt.TargetPosition = catch_point;
                [q,solutionInfo] = gik(robot.homeConfiguration,posTgt);
                
                JointMsg.Position(1) = q(1).JointPosition; 
                JointMsg.Name(1) = {'Shoulder_Joint'};
                JointMsg.Position(2) = q(2).JointPosition; 
                JointMsg.Name(2) = {'Transverse_Joint'};
                JointMsg.Position(3) = q(3).JointPosition; 
                JointMsg.Name(3) = {'Elbow_Joint'};
                
                send(JointPub,JointMsg)
                
                estimate = estimate + 1;
            end
        end
    end
    
    if z_vic < low_lim
        if toss == true
            break
        end
        
    end

    pause(0.001)
end


figure()
hold on
plot3(ball_samples(:,1),ball_samples(:,2),ball_samples(:,3),'go-')
plot3(ball_pos(:,1),ball_pos(:,2),ball_pos(:,3),'r*')
plot3(Intersect(:,1), Intersect(:,2), Intersect(:,3),'bo-')
hold off
xlabel('x [m]'); ylabel('y [m]'); zlabel('z [m]'); 
grid on
