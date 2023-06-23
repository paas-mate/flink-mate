#!/bin/bash


FLINK_CONF_FILE=$FLINK_HOME/conf/flink-conf.yaml

echo "" > $FLINK_CONF_FILE

echo "taskmanager.bind-host: 0.0.0.0" >> $FLINK_CONF_FILE
echo "taskmanager.memory.process.size: 4096mb" >> $FLINK_CONF_FILE

bash $FLINK_HOME/bin/taskmanager.sh start
