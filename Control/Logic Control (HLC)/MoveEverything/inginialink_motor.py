#!/usr/bin/env python
import ingenialink as il
from ingenialink import const
import matplotlib.pyplot as plt 
import rospy
from std_msgs.msg import Float64


def callback(data):
   



	#Position control
	servo.mode = il.SERVO_MODE.PP
	phi = data.data*70
	print('Starting position is: {:.2f} deg'.format(servo.position))

	servo.enable()
	servo.position = phi
	servo.wait_reached(timeout=60)

	print('Finishing position is: {:.2f} deg'.format(servo.position/70))

    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('inginia_motor', anonymous=True)

    rospy.Subscriber("reference3", Float64, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
	#Setup the network and connection to the motor
	#print(il.devices(il.NET_PROT.EUSB))
	net = il.Network(il.NET_PROT.EUSB, '/dev/ttyACM1') #to find lsusb(1) and dmesg(2)

	servo_ids = net.servos()
	first_id = servo_ids[0]

	#print('Will use servo with id: {}'.format(first_id))

	servo = il.Servo(net, first_id)
	#print(servo.info)

	# we want to work in degrees and RPM
	servo.units_pos = il.SERVO_UNITS_POS.DEG
	#servo.units_vel = il.SERVO_UNITS_VEL.RPM

	#Homing
	servo.mode = il.SERVO_MODE.HOMING
	servo.enable()
	servo.homing_start()
	servo.homing_wait(timeout=10.)

	listener()

	servo.disable()