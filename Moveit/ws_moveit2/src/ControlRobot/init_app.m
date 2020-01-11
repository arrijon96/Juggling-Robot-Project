clear all; clc;
rosshutdown; rosinit;

RefPub = rospublisher('reference','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');

RefMsg.X = 0;
RefMsg.Y = 0;
RefMsg.Z = 0;

send(RefPub,RefMsg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RefPub3 = rospublisher('reference3','std_msgs/Float64');
RefMsg3 = rosmessage('std_msgs/Float64');
RefMsg3.Data = 0;
send(RefPub3,RefMsg3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
RefPub = rospublisher('desired_position','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');