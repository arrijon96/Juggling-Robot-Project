pub1 = rospublisher('reference1','std_msgs/Float64');
pub2 = rospublisher('reference2','std_msgs/Float64');
pub3 = rospublisher('reference3','std_msgs/Float64');

sub = rossubscriber('/move_group/display_planned_path','moveit_msgs/DisplayTrajectory');

RefMsg1 = rosmessage('std_msgs/Float64');
RefMsg2 = rosmessage('std_msgs/Float64');
RefMsg3 = rosmessage('std_msgs/Float64');
%% Go home
RefMsg1.Data = 0; RefMsg2.Data = 0; RefMsg3.Data = 0;
send(pub1,RefMsg1); send(pub2,RefMsg2); send(pub2,RefMsg3);
%% Motion planning
msg = receive(sub);
for i = 1:length(msg.Trajectory.JointTrajectory.Points)
    RefMsg1.Data = msg.Trajectory.JointTrajectory.Points(i).Positions(1); ref1(i) =  msg.Trajectory.JointTrajectory.Points(i).Positions(1);
    RefMsg2.Data = msg.Trajectory.JointTrajectory.Points(i).Positions(2); ref2(i) =  msg.Trajectory.JointTrajectory.Points(i).Positions(2);
    RefMsg3.Data = msg.Trajectory.JointTrajectory.Points(i).Positions(3); ref3(i) =  msg.Trajectory.JointTrajectory.Points(i).Positions(3);
    send(pub1,RefMsg1);
    send(pub2,RefMsg2);
    send(pub2,RefMsg3);
end
clf; plot(ref1); hold on; plot(ref2); plot(ref3);





