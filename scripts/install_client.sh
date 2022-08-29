#!/bin/bash

METASLAM=$(pwd)

# Install Necessay packages
sudo apt-get install libusb-dev python-pip screen tmux python-rosdep
sudo pip install catkin-tools

# Install Simulation
git clone https://github.com/MetaSLAM/Multi-Agent-Simulation.git   $METASLAM/stack/src/simulation
git clone https://github.com/fkie/multimaster_fkie.git             $METASLAM/stack/src/multimaster
git clone https://github.com/MetaSLAM/MrExplorer.git               $METASLAM/stack/src/mrexplorer
git clone https://github.com/MetaSLAM/fakemerge.git                $METASLAM/stack/src/fakemerge

MM_PACK=$METASLAM/stack/multimaster/
rosdep install -i --as-root pip:false --reinstall --from-paths $MM_PACK

cd $METASLAM/stack/src/simulation/src/vehicle_simulator/mesh/
sh download_environments.sh

cd $METASLAM/stack
catkin build -j 8

echo "source $METASLAM/stack/devel/setup.bash" >> ~/.bashrc

# Need to modify based on multi-agent
echo "export ROS_IP='172.26.169.231'" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://172.26.169.231:11311" >> ~/.bashrc

echo "METASLAM=$METASLAM" >> ~/.bashrc
echo "alias cdw='cd $METASLAM'" >> ~/.bashrc
echo "alias enclient='sh $METASLAM/scripts/start_client.sh'" >> ~/.bashrc
echo "alias killmeta='pkill screen'" >> ~/.bashrc