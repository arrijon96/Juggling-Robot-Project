rosshutdown; rosinit;
clear all;

PosPub = rospublisher('desired_position','geometry_msgs/Vector3');
PosMsg = rosmessage('geometry_msgs/Vector3');

JointPub = rospublisher('desired_joints','geometry_msgs/Vector3');
JointMsg = rosmessage('geometry_msgs/Vector3');

%% Publish desired EE position
toss = [0.2; 0.33; 1.4];
home = [0.2; 0.33; 1];
other = [0.2; 0.33; 1.3];

goal = home;
PosMsg.X = goal(1);
PosMsg.Y = goal(2);
PosMsg.Z = goal(3);
send(PosPub,PosMsg)

%% Publish desired joint states
start = [0; 0; -pi/2];
home = [0; 0; 0];

goal = start;
JointMsg.X = goal(1);
JointMsg.Y = goal(2);
JointMsg.Z = goal(3);
send(JointPub,JointMsg)