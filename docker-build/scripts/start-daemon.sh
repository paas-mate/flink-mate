#!/bin/bash

mkdir -p $FLINK_HOME/logs

java -Xmx128M -Xms128M -XX:MaxDirectMemorySize=256M -jar $FLINK_HOME/mate/flink-mate.jar >>$FLINK_HOME/logs/flink_mate.stdout.log 2>>$FLINK_HOME/logs/flink_mate.stderr.log
