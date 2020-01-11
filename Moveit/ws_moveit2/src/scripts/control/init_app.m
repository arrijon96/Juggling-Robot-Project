clear all; clc;
rosshutdown; rosinit;


PosPub = rospublisher('desired_position','geometry_msgs/Vector3');
PosMsg = rosmessage('geometry_msgs/Vector3');

JointPub = rospublisher('desired_joints','geometry_msgs/Vector3');
JointMsg = rosmessage('geometry_msgs/Vector3');