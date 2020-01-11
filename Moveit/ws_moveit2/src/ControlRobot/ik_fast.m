function JointStates = ik_fast(pos)
%% Subscribe final joint states
subi = rossubscriber('/reference_final', 'geometry_msgs/Vector3');


%% Publish desired position
RefPub = rospublisher('desired_position','geometry_msgs/Vector3');
RefMsg = rosmessage('geometry_msgs/Vector3');
RefMsg.X = pos(1);
RefMsg.Y = pos(2);
RefMsg.Z = pos(3);
send(RefPub,RefMsg);

%% Output
jointstates = receive(subi,10);
JointStates(1) = jointstates.X; JointStates(2) = jointstates.Y; JointStates(3) = jointstates.Z;

end