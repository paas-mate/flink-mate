package com.github.paas.mate.flink.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class WatchDogService {

    /**
     * schedule for one minute
     */
    @Scheduled(cron = "0 * * * * ?")
    public void watchDog() {

    }

}
