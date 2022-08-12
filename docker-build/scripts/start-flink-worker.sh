#!/bin/bash

echo "" >> /opt/sh/flink/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-master" >> /opt/sh/flink/conf/flink-conf.yaml

bash /opt/sh/flink/bin/taskmanager.sh start