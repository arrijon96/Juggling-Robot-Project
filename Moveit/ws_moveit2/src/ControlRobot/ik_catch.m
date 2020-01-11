function [JointStates,flags] = ik_fast(pos)

%% Publish desired position
RefPub = rospublisher('desired_position','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');
RefMsg.X = pos(1);
RefMsg.Y = pos(2);
RefMsg.Z = pos(3);
send(RefPub,RefMsg);

%% Subscribe final joint states
vicon_pos = rossubscriber('/reference_final');

end