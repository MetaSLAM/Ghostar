#!/bin/bash

METASLAM=$(pwd)

# Install Necessay packages
sudo apt-get install libusb-dev python-pip
sudo pip install catkin-tools
sudo rosdep init
rosdep update

# Install Simulation
git clone https://github.com/MetaSLAM/Multi-Agent-Simulation.git   $METASLAM/stack/src/simulation
git clone https://github.com/fkie/multimaster_fkie.git             $METASLAM/stack/src/multimaster
git clone https://github.com/MetaSLAM/MrExplorer.git               $METASLAM/stack/src/mrexplorer
git clone https://github.com/MetaSLAM/fakemerge.git                $METASLAM/stack/src/fakemerge

MM_PACK=$METASLAM/stack/multimaster/
rosdep install -i --as-root pip:false --reinstall --from-paths $MM_PACK

cd $METASLAM/stack
catkin build -j 8
echo "source $METASLAM/stack/devel/setup.bash" >> ~/.bashrc

# roslaunch vehicle_simulator system_campus.launch
# roslaunch fkie_multimaster_discovery master_discovery.launch
# roslaunch fkie_multimaster_sync master_sync.launch
# roslaunch tare_planner explore_campus.launch
# roslaunch fakemerge transformPose.launch