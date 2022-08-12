package com.github.paas.mate.flink.constant;

import lombok.extern.slf4j.Slf4j;

import java.io.File;

@Slf4j
public class PathConst {

    public static final String FLINK_HOME = System.getenv("FLINK_HOME");

    public static final String FLINK_CONFIG_DIR = FLINK_HOME + File.separator + "conf";

    public static final String FLINK_MATE = FLINK_HOME + File.separator + "mate";

    public static final String FLINK_SCRIPTS = FLINK_MATE + File.separator + "scripts";

    public static final String FLINK_START_MASTER_SCRIPT = FLINK_SCRIPTS + File.separator + "start-flink-master.sh";

    public static final String FLINK_START_WORKER_SCRIPT = FLINK_SCRIPTS + File.separator + "start-flink-worker.sh";

    public static final String FLINK_START_STAND_ALONE_SCRIPT = FLINK_SCRIPTS + File.separator + "start-flink-stand-alone.sh";


}
