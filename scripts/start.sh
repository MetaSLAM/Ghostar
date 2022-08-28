#!/bin/bash

screen -Sdm start_simulator sh $METASLAM/scripts/bin/enable_simulator.sh
echo "Enable Simulator"
sleep 1

screen -Sdm start_ms_discover sh $METASLAM/scripts/bin/enable_master_discovery.sh
echo "Enable Master Discovery"
sleep 1

screen -Sdm start_ms_sync sh $METASLAM/scripts/bin/enable_master_sync.sh
echo "Enable Master Sync"
sleep 1

screen -Sdm start_mr_explorer sh $METASLAM/scripts/bin/enable_explorer.sh
echo "Enable Mr Explorer"
sleep 1

screen -Sdm start_fakemerge sh $METASLAM/scripts/bin/enable_fakemerge.sh
echo "Enable Fake Merging"
sleep 1
