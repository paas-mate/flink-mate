package com.github.paas.mate.flink.config;

import com.github.paas.mate.flink.module.DeployType;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

@Configuration
@Service
public class FlinkConfig {

    @Value("${DEPLOY_TYPE:STANDALONE}")
    public DeployType deployType;

}
