#!/usr/bin/env python
import ingenialink as il
from ingenialink import const
import matplotlib.pyplot as plt 
import rospy
from std_msgs.msg import Float64
import math



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
	servo.disable()
	print("Elbow disabled.")
	
