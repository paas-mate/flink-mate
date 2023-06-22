#!/bin/bash

FLINK_CONF_FILE=$FLINK_HOME/conf/flink-conf.yaml

echo "" > $FLINK_CONF_FILE

echo "jobmanager.rpc.address: flink-job-manager" >> $FLINK_CONF_FILE

echo "jobmanager.bind-host: 0.0.0.0" >> $FLINK_CONF_FILE

echo "rest.port: 8081" >> $FLINK_CONF_FILE

echo "rest.address: 0.0.0.0" >> $FLINK_CONF_FILE

echo "rest.bind-port: 8081" >> $FLINK_CONF_FILE

echo "rest.bind-address: 0.0.0.0" >> $FLINK_CONF_FILE

echo "jobmanager.memory.process.size: 4096mb" >> $FLINK_CONF_FILE

if [ "$HA_ENABLE" == "true" ]; then
    # load s3 plugins
    echo "fs.allowed-fallback-filesystems: s3" >> $FLINK_CONF_FILE
    mkdir $FLINK_HOME/plugins/flink-s3-fs-presto
    cp $FLINK_HOME/opt/flink-s3-fs-presto-*.jar $FLINK_HOME/plugins/flink-s3-fs-presto
    mkdir $FLINK_HOME/plugins/flink-s3-fs-hadoop
    cp $FLINK_HOME/opt/flink-s3-fs-hadoop-*.jar $FLINK_HOME/plugins/flink-s3-fs-hadoop
    # high availability config
    if [ "$HIGH_AVAILABILITY" ]; then
        echo "high-availability: $HIGH_AVAILABILITY" >> $FLINK_CONF_FILE
    fi
    if [ "$HIGH_AVAILABILITY_STORAGEDIR" ]; then
        echo "high-availability.storageDir: $HIGH_AVAILABILITY_STORAGEDIR" >> $FLINK_CONF_FILE
    else
        echo "high-availability.storageDir: s3://flink/ha" >> $FLINK_CONF_FILE
    fi
    # shared file system config
    if [ "$S3_ENDPOINT" ]; then
        echo "s3.endpoint: $S3_ENDPOINT" >> $FLINK_CONF_FILE
    else
        echo "s3.endpoint: http://localhost:9000" >> $FLINK_CONF_FILE
    fi
    echo "s3.path.style.access: true" >> $FLINK_CONF_FILE
    if [ "$S3_ACCESS_KEY" ]; then
        echo "s3.access-key: $S3_ACCESS_KEY" >> $FLINK_CONF_FILE
    else
        echo "s3.access-key: minioadmin" >> $FLINK_CONF_FILE
    fi
    if [ "$S3_SECRET_KEY" ]; then
        echo "s3.secret-key: $S3_SECRET_KEY" >> $FLINK_CONF_FILE
    else
        echo "s3.secret-key: minioadmin" >> $FLINK_CONF_FILE
    fi
    # state backend config
    if [ "$STATE_BACKEND" ]; then
        echo "state.backend: $STATE_BACKEND" >> $FLINK_CONF_FILE
    else
        echo "state.backend: filesystem" >> $FLINK_CONF_FILE
    fi
    if [ "$STATE_CHECKPOINTS_DIR" ]; then
        echo "state.checkpoints.dir: $STATE_CHECKPOINTS_DIR" >> $FLINK_CONF_FILE
    else
        echo "state.checkpoints.dir: s3://flink/checkpoints" >> $FLINK_CONF_FILE
    fi
    if [ "$STATE_SAVEPOINTS_DIR" ]; then
        echo "state.savepoints.dir: $STATE_SAVEPOINTS_DIR" >> $FLINK_CONF_FILE
    else
        echo "state.savepoints.dir: s3://flink/savepoints" >> $FLINK_CONF_FILE
    fi
    # checkpoint config
    if [ "$EXECUTION_CHECKPOINTING_INTERVAL" ]; then
        echo "execution.checkpointing.interval: $EXECUTION_CHECKPOINTING_INTERVAL" >> $FLINK_CONF_FILE
    else
        echo "execution.checkpointing.interval: 5000" >> $FLINK_CONF_FILE
    fi
    if [ "$EXECUTION_CHECKPOINTING_MODE" ]; then
        echo "execution.checkpointing.mode: $EXECUTION_CHECKPOINTING_MODE" >> $FLINK_CONF_FILE
    else
        echo "execution.checkpointing.mode: EXACTLY_ONCE" >> $FLINK_CONF_FILE
    fi
    if [ "$EXECUTION_CHECKPOINTING_MIN_PAUSE" ]; then
        echo "execution.checkpointing.min-pause: $EXECUTION_CHECKPOINTING_MIN_PAUSE" >> $FLINK_CONF_FILE
    else
        echo "execution.checkpointing.min-pause: 1000" >> $FLINK_CONF_FILE
    fi
    if [ "$EXECUTION_CHECKPOINTING_MAX_CONCURRENT_CHECKPOINTS" ]; then
        echo "execution.checkpointing.max-concurrent-checkpoints: $EXECUTION_CHECKPOINTING_MAX_CONCURRENT_CHECKPOINTS" >> $FLINK_CONF_FILE
    else
        echo "execution.checkpointing.max-concurrent-checkpoints: 1" >> $FLINK_CONF_FILE
    fi
    if [ "$EXECUTION_CHECKPOINTING_EXTERNALIZED_CHECKPOINT_RETENTION" ]; then
        echo "execution.checkpointing.externalized-checkpoint-retention: $EXECUTION_CHECKPOINTING_EXTERNALIZED_CHECKPOINT_RETENTION" >> $FLINK_CONF_FILE
    else
        echo "execution.checkpointing.externalized-checkpoint-retention: RETAIN_ON_CANCELLATION" >> $FLINK_CONF_FILE
    fi
fi

# metrics
echo "metrics.reporter.prom.class: org.apache.flink.metrics.prometheus.PrometheusReporter" >> $FLINK_CONF_FILE
