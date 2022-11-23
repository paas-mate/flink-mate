#!/bin/bash

echo "" >> $FLINK_HOME/conf/flink-conf.yaml

echo "jobmanager.rpc.address: flink-job-manager" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.port: 8081" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.address: 0.0.0.0" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.bind-port: 8081" >> $FLINK_HOME/conf/flink-conf.yaml

echo "rest.bind-address: 0.0.0.0" >> $FLINK_HOME/conf/flink-conf.yaml

if [ "$HA_ENABLE" == "true" ]; then
    if [ "$HIGH_AVAILABILITY" ]; then
        echo "high-availability: $HIGH_AVAILABILITY" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "high-availability: org.apache.flink.kubernetes.highavailability.KubernetesHaServicesFactory" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$HIGH_AVAILABILITY_STORAGEDIR" ]; then
        echo "high-availability.storageDir: $HIGH_AVAILABILITY_STORAGEDIR" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "high-availability.storageDir: s3://flink/ha" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    # shared file system config
    if [ "$S3_ENDPOINT" ]; then
        echo "s3.endpoint: $S3_ENDPOINT" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "s3.endpoint: http://localhost:9000" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$S3_ACCESS_KEY" ]; then
        echo "s3.access-key: $S3_ACCESS_KEY" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "s3.access-key: minioadmin" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$S3_SECRET_KEY" ]; then
        echo "s3.secret-key: $S3_SECRET_KEY" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "s3.secret-key: minioadmin" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    # state backend config
    if [ "$STATE_BACKEND" ]; then
        echo "state.backend: $STATE_BACKEND" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "state.backend: filesystem" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$STATE_CHECKPOINTS_DIR" ]; then
        echo "state.checkpoints.dir: $STATE_CHECKPOINTS_DIR" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "state.checkpoints.dir: s3://flink/checkpoints" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$STATE_SAVEPOINTS_DIR" ]; then
        echo "state.savepoints.dir: $STATE_SAVEPOINTS_DIR" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "state.savepoints.dir: s3://flink/savepoints" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    # checkpoint config
    if [ "$EXECUTION_CHECKPOINTING_INTERVAL" ]; then
        echo "execution.checkpointing.interval: $EXECUTION_CHECKPOINTING_INTERVAL" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "execution.checkpointing.interval: 5000" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$EXECUTION_CHECKPOINTING_MODE" ]; then
        echo "execution.checkpointing.mode: $EXECUTION_CHECKPOINTING_MODE" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "execution.checkpointing.mode: EXACTLY_ONCE" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$EXECUTION_CHECKPOINTING_MIN_PAUSE" ]; then
        echo "execution.checkpointing.min-pause: $EXECUTION_CHECKPOINTING_MIN_PAUSE" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "execution.checkpointing.min-pause: 1000" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$EXECUTION_CHECKPOINTING_MAX_CONCURRENT_CHECKPOINTS" ]; then
        echo "execution.checkpointing.max-concurrent-checkpoints: $EXECUTION_CHECKPOINTING_MAX_CONCURRENT_CHECKPOINTS" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "execution.checkpointing.max-concurrent-checkpoints: 1" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
    if [ "$EXECUTION_CHECKPOINTING_EXTERNALIZED_CHECKPOINT_RETENTION" ]; then
        echo "execution.checkpointing.externalized-checkpoint-retention: $EXECUTION_CHECKPOINTING_EXTERNALIZED_CHECKPOINT_RETENTION" >> $FLINK_HOME/conf/flink-conf.yaml
    else
        echo "execution.checkpointing.externalized-checkpoint-retention: RETAIN_ON_CANCELLATION" >> $FLINK_HOME/conf/flink-conf.yaml
    fi
fi

bash $FLINK_HOME/bin/jobmanager.sh start flink-job-manager 8081
