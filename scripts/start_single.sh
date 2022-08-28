#!/bin/bash
export METASLAM=$(pwd)

screen -Sdm start_simulator sh $METASLAM/scripts/bin/enable_simulator.sh
echo "Enable Simulator"
sleep 10

screen -Sdm start_mr_explorer sh $METASLAM/scripts/bin/enable_explorer.sh
echo "Enable Mr Explorer"
sleep 1
