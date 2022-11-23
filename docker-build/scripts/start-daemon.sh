#!/bin/bash

mkdir -p $FLINK_HOME/logs

if [ "$CLUSTER_ROLE" == "JOB_MANAGER" ]; then
    bash -x $FLINK_HOME/mate/scripts/start-flink-job-manager.sh
elif [  "$CLUSTER_ROLE" == "TASK_MANAGER" ]; then
    bash -x $FLINK_HOME/mate/scripts/start-flink-task-manager.sh
else
    bash -x $FLINK_HOME/mate/scripts/start-flink-standalone.sh
fi
