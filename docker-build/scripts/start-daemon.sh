#!/bin/bash

mkdir -p $FLINK_HOME/logs

if [ "$DEPLOY_TYPE" == "master" ]; then
    bash -x $FLINK_HOME/mate/scripts/start-flink-master.sh
elif [  "$DEPLOY_TYPE" == "worker" ]; then
    bash -x $FLINK_HOME/mate/scripts/start-flink-worker.sh
else
    bash -x $FLINK_HOME/mate/scripts/start-flink-standalone.sh
fi

java -Xmx128M -Xms128M -XX:MaxDirectMemorySize=256M -jar $FLINK_HOME/mate/flink-mate.jar >>$FLINK_HOME/logs/flink_mate.stdout.log 2>>$FLINK_HOME/logs/flink_mate.stderr.log
