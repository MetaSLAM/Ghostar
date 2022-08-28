#!/bin/bash
source /opt/ros/melodic/setup.bash
source $METASLAM/stack/devel/setup.bash
export ROS_IP='172.26.169.231'
export ROS_MASTER_URI=http://172.26.169.231:11311
roslaunch fkie_master_discovery master_discovery.launch