function juggle_cont(toss_joints, begin_joints, catch_height)
while true
    publish_motion(toss_joints(1),toss_joints(2), toss_joints(3))
    pause(0.1)
    juggle(catch_height, begin_joints)
end
end