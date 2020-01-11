#!/usr/bin/env python
import ingenialink as il
from ingenialink import const
import matplotlib.pyplot as plt 
import rospy
from std_msgs.msg import Float64
from geometry_msgs.msg import Vector3
import math


def callback(data, servo):
	servo.position = -data.data*360/(2*math.pi)*70/4
	servo.wait_reached(timeout=1.)
	del servo
	


if __name__ == '__main__':

	

	net = il.Network(il.NET_PROT.EUSB, '/dev/ttyACM1')

	servo_ids = net.servos()
	first_id = servo_ids[0]

	servo = il.Servo(net, first_id)

	servo.units_pos = il.SERVO_UNITS_POS.DEG


	servo.mode = il.SERVO_MODE.HOMING
	servo.enable()
	servo.homing_start()
	servo.homing_wait(timeout=10.)
	servo.disable()
	print("Home position reached. Elbow ready to juggle.")

	servo.mode = il.SERVO_MODE.PP
	servo.enable()
	print("Elbow activated.")

	try:
		rospy.init_node('inginia_motor', anonymous=True)

		rospy.Subscriber("reference3", Float64, callback, servo)

		'''
		pub = rospy.Publisher('encoder', Vector3, queue_size=100)

		rate = rospy.Rate(100) # 100hz

		while not rospy.is_shutdown():
			encoder = Vector3()
			encoder.z = servo.position/(360/(2*math.pi)*70/4)
			pub.publish(encoder)
			#rate.sleep()
		'''
		rospy.spin()

	except rospy.ROSInterruptException:
		pass
	
