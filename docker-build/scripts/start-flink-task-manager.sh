#!/bin/bash

echo "" >> $FLINK_HOME/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-job-manager" >> $FLINK_HOME/conf/flink-conf.yaml

bash $FLINK_HOME/bin/taskmanager.sh start
