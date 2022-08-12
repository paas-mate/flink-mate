package com.github.paas.mate.flink.service;

import com.github.paas.mate.flink.config.FlinkConfig;
import com.github.paas.mate.flink.constant.PathConst;
import com.github.shoothzj.javatool.util.ShellUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Slf4j
@Service
public class LifecycleService {

    @Autowired
    private FlinkConfig flinkConfig;

    @PostConstruct
    public void init() throws Exception {
        // change config
        genConfig();
        // start flink
        startFlink();
    }

    /**
     *
     */
    public void genConfig() throws Exception {

    }

    public void startFlink() throws Exception {
        switch (flinkConfig.deployType) {
            case WORKER:
                ShellUtil.executeCmd("bash -x " + PathConst.FLINK_START_WORKER_SCRIPT);
                break;
            case MASTER:
                ShellUtil.executeCmd("bash -x " + PathConst.FLINK_START_MASTER_SCRIPT);
                break;
            case STANDALONE:
                ShellUtil.executeCmd("bash -x " + PathConst.FLINK_START_STAND_ALONE_SCRIPT);
                break;
            default:
                break;
        }
    }

}
