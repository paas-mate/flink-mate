#!/bin/bash

echo "" >> $FLINK_HOME/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-master" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.port: 8081" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.address: 0.0.0.0" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.bind-port: 8081" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.bind-address: 0.0.0.0" >> $FLINK_HOME/conf/flink-conf.yaml

bash $FLINK_HOME/bin/jobmanager.sh start flink-master 8081
