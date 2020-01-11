rosshutdown; rosinit;
RefPub1 = rospublisher('reference1','std_msgs/Float64');
RefMsg1 = rosmessage('std_msgs/Float64');
RefPub2 = rospublisher('reference2','std_msgs/Float64');
RefMsg2 = rosmessage('std_msgs/Float64');
RefPub3 = rospublisher('reference3','std_msgs/Float64');
RefMsg3 = rosmessage('std_msgs/Float64');
%%
RefMsg1.Data = 0;
send(RefPub1,RefMsg1)

RefMsg2.Data = 0;
send(RefPub2,RefMsg2)

RefMsg3.Data = 0;
send(RefPub3,RefMsg3)