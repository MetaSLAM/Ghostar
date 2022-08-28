#!/bin/bash

METASLAM=$(pwd)
SIM_PATH=$METASLAM/stack/simulation
MM_PATH=$METASLAM/stack/multimaster
EXPLORER_PATH=$METASLAM/stack/mrexplorer
FM_PATH=$METASLAM/stack/fakemerge

source /opt/ros/melodic/setup.bash
source $SIM_PATH/devel/setup.bash
source $MM_PATH/devel/setup.bash
source $EXPLORER_PATH/devel/setup.bash
source $FM_PATH/devel/setup.bash