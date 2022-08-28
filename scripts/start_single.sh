#!/bin/bash
export METASLAM=$(pwd)

screen -Sdm start_simulator sh $METASLAM/scripts/bin/enable_simulator.sh
echo $METASLAM
echo "Enable Simulator"
sleep 1

screen -Sdm start_mr_explorer sh $METASLAM/scripts/bin/enable_explorer.sh
echo "Enable Mr Explorer"
sleep 1
