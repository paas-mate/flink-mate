#!/bin/bash

echo "" > $FLINK_HOME/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-job-manager" >> $FLINK_HOME/conf/flink-conf.yaml

echo "taskmanager.bind-host: 0.0.0.0" >> $FLINK_HOME/conf/flink-conf.yaml
echo "taskmanager.memory.process.size: 4096mb" >> $FLINK_HOME/conf/flink-conf.yaml

bash $FLINK_HOME/bin/taskmanager.sh start
