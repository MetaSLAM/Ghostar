#!/bin/bash

METASLAM=$(pwd)

# Install Necessay packages
sudo apt-get install libusb-dev python-pip screen tmux
sudo pip install catkin-tools

# Get All
git clone https://github.com/MetaSLAM/Multi-Agent-Simulation.git   $METASLAM/stack/src/simulation
git clone https://github.com/fkie/multimaster_fkie.git             $METASLAM/stack/src/multimaster
git clone https://github.com/MetaSLAM/MrExplorer.git               $METASLAM/stack/src/mrexplorer
git clone https://github.com/MetaSLAM/fakemerge.git                $METASLAM/stack/src/fakemerge
git clone https://github.com/MetaSLAM/AutoMerge.git                $METASLAM/stack/src/automerge

# Install python env for multimaster
MM_PACK=$METASLAM/stack/multimaster/
rosdep install -i --as-root pip:false --reinstall --from-paths $MM_PACK

# Download sim environments
cd $METASLAM/stack/src/simulation/src/vehicle_simulator/mesh/
sh download_environments.sh

# Install AutoMerge
AUTOMERGE_PATH=$METASLAM/stack/src/automerge
cd $AUTOMERGE_PATH
# pip install -r requirements

# Install BioSLAM

# Compile ROS Env
cd $METASLAM/stack
catkin build -j 8

#Setup Environment Parameters
echo "source $METASLAM/stack/devel/setup.bash" >> ~/.bashrc
echo "METASLAM=$METASLAM" >> ~/.bashrc
echo "alias cdw='cd $METASLAM'" >> ~/.bashrc
echo "alias enclient='sh $METASLAM/scripts/start_client.sh'" >> ~/.bashrc
echo "alias killmeta='pkill screen'" >> ~/.bashrc