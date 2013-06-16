package com.emix.dubai.quartz.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springside.modules.utils.DateProvider;

/**
 * @author niko
 */
@Component
public class TestJob implements Job {
    private Logger logger = LoggerFactory.getLogger(TestJob.class);

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        DateProvider dateProvider = DateProvider.DEFAULT;
        logger.info(String.format("******** Current Time: %s ******** ", dateProvider.getDate()));
    }
}
