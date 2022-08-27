#!/bin/bash

METASLAM=$(pwd)

# Install MrExplorer
git clone https://github.com/MetaSLAM/Multi-Agent-Simulation.git $METASLAM/stack/simulation
git clone https://github.com/fkie/multimaster_fkie.git $METASLAM/stack/multimaster 
git clone https://github.com/MetaSLAM/MrExplorer.git $METASLAM/stack/mrexplorer
git clone https://github.com/MetaSLAM/fakemerge.git $METASLAM/stack/fakemerge