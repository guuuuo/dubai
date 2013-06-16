package com.emix.core.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * @author niko
 */
public class CommonJobBean extends QuartzJobBean {
    private static Logger logger = LoggerFactory.getLogger(CommonJobBean.class);

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ApplicationContext applicationContext = getApplicationContext(jobExecutionContext);
        String realJobBeanName = getRealJobBeanName(jobExecutionContext);

        Job realJob = (Job) applicationContext.getBean(realJobBeanName);

        try {
            realJob.execute(jobExecutionContext);
        } catch (Exception e) {
            logger.error(String.format("Error happened when execute job, realJobBeanName: %s, jobDataMap:[%s]", realJobBeanName, buildJobDataMap(jobExecutionContext)), e);
        }
    }

    private ApplicationContext getApplicationContext(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ApplicationContext applicationContext = null;
        try {
            applicationContext = (ApplicationContext) jobExecutionContext.getScheduler().getContext().get(QuartzConstant.APPLICATION_CONTEXT_KEY);
        } catch (SchedulerException e) {
            throw new JobExecutionException(e);
        }
        return applicationContext;
    }

    private String getRealJobBeanName(JobExecutionContext jobExecutionContext) {
        return (String) jobExecutionContext.getJobDetail().getJobDataMap().get(QuartzConstant.REAL_JOB_BEAN_NAME);
    }

    private String buildJobDataMap(JobExecutionContext jobExecutionContext) {
        StringBuilder result = new StringBuilder();
        for (String key : jobExecutionContext.getJobDetail().getJobDataMap().getKeys()) {
            result.append(String.format("%s=%s;", key, jobExecutionContext.getJobDetail().getJobDataMap().get(key)));
        }
        return result.toString();
    }
}
