#!/bin/bash

echo "" >> /opt/sh/flink/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-master" >> /opt/sh/flink/conf/flink-conf.yaml

echo "rest.port: 8081" >> /opt/sh/flink/conf/flink-conf.yaml

echo "rest.address: 0.0.0.0" >> /opt/sh/flink/conf/flink-conf.yaml

echo "rest.bind-port: 8081" >> /opt/sh/flink/conf/flink-conf.yaml

echo "rest.bind-address: 0.0.0.0" >> /opt/sh/flink/conf/flink-conf.yaml

bash /opt/sh/flink/bin/jobmanager.sh start flink-master 8081