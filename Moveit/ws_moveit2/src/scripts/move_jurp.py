#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64

import sys
import copy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from geometry_msgs.msg import Vector3
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list


class MoveGroupPythonIntefaceTutorial(object):
    def __init__(self):
        super(MoveGroupPythonIntefaceTutorial, self).__init__()


        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node('matlab2rviz', anonymous=True)

        robot = moveit_commander.RobotCommander()

        scene = moveit_commander.PlanningSceneInterface()

        group_name = "jurp_all"
        move_group = moveit_commander.MoveGroupCommander(group_name)


        display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                       moveit_msgs.msg.DisplayTrajectory,
                                                       queue_size=20)

        planning_frame = move_group.get_planning_frame()
        print "============ Planning frame: %s" % planning_frame

        eef_link = move_group.get_end_effector_link()
        print "============ End effector link: %s" % eef_link

        group_names = robot.get_group_names()
        print "============ Available Planning Groups:", robot.get_group_names()

        print "============ Printing robot state"
        print robot.get_current_state()
        print ""

        # Misc variables
        self.box_name = ''
        self.robot = robot
        self.scene = scene
        self.move_group = move_group
        self.display_trajectory_publisher = display_trajectory_publisher
        self.planning_frame = planning_frame
        self.eef_link = eef_link
        self.group_names = group_names

    def go_to_joint_state(self, start):
        move_group = self.move_group
        joint_goal = move_group.get_current_joint_values()

        joint_goal[0] = start[0]
        joint_goal[1] = start[1]
        joint_goal[2] = start[2]

        move_group.go(joint_goal, wait=True)

        move_group.stop()

    '''
    def go_to_pose_goal(self):
        move_group = self.move_group
        pose_goal = move_group.get_current_pose().pose
        move_group.set_pose_target(pose_goal)
        pose_goal.position.x = data.x
        pose.position.y = data.y
        pose.position.z = data.z
        plan = move_group.go(wait=True)
        '''

    def plan_cartesian_path(self, data):

        move_group = self.move_group

        waypoints = []

        pose = move_group.get_current_pose().pose

        pose.position.x = data.x
        pose.position.y = data.y
        pose.position.z = data.z
        waypoints.append(copy.deepcopy(pose))

        (plan, fraction) = move_group.compute_cartesian_path(
                                           waypoints,   # waypoints to follow
                                           0.1,        # eef_step
                                           0.0)         # jump_threshold
        print "Last value of plan: %s" % plan[-1]

        return plan, fraction

    def execute_plan(self, plan):
        move_group = self.move_group
        move_group.execute(plan, wait=True)


def callback_pos(data, jurp):
    cartesian_plan, fraction = jurp.plan_cartesian_path(data)
    jurp.execute_plan(cartesian_plan)

def callback_joints(data, jurp):
    jurp.go_to_joint_state([data.x, data.y, data.z])


def main():
    try:
        jurp = MoveGroupPythonIntefaceTutorial()
        rospy.Subscriber("desired_position", Vector3, callback_pos, jurp)
        rospy.Subscriber("desired_joints", Vector3, callback_joints, jurp)
        rospy.spin()
    except rospy.ROSInterruptException:
        return
    except KeyboardInterrupt:
        return

if __name__ == '__main__':
    main()
    