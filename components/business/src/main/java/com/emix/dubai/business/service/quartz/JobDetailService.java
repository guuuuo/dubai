package com.emix.dubai.business.service.quartz;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.quartz.JobDetail;
import com.emix.dubai.business.repository.quartz.JobDetailRepository;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.Map;

/**
 * @author niko
 */
@Component
@Transactional(readOnly = true)
public class JobDetailService {
    private final Logger logger = LoggerFactory.getLogger(JobDetailService.class);

    @Autowired
    private JobDetailRepository jobDetailRepository;
    @Autowired
    private Scheduler localQuartzScheduler;

    public Page<JobDetail> loadJobDetails(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<JobDetail> spec = buildSpecification(searchParams);

        return jobDetailRepository.findAll(spec, pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("jobName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "jobDetailPK.jobName");
        } else if ("jobGroup".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "jobDetailPK.jobGroup");
        } else if ("jobClassName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "jobClassName");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<JobDetail> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<JobDetail> spec = DynamicSpecifications.bySearchFilter(filters.values(), JobDetail.class);
        return spec;
    }

    public void pauseJob(String jobName, String jobGroup) {
        logger.debug(String.format("Pause Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));

        try {
            localQuartzScheduler.pauseJob(jobName, jobGroup);
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException(String.format("Failed to pause Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));
        }
    }

    public void resumeJob(String jobName, String jobGroup) {
        logger.debug(String.format("Resume Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));

        try {
            localQuartzScheduler.resumeJob(jobName, jobGroup);
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException(String.format("Failed to resume Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));
        }
    }

    public void pauseAll() {
        logger.debug("Pause all jobs.");

        try {
            localQuartzScheduler.pauseAll();
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException("Failed to pause all jobs");
        }
    }

    public void resumeAll() {
        logger.debug("Resume all jobs.");

        try {
            localQuartzScheduler.resumeAll();
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException("Failed to resume all jobs");
        }
    }

    public void unscheduleJob(String jobName, String jobGroup) {
        logger.debug(String.format("Unschedule Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));

        try {
            localQuartzScheduler.unscheduleJob(jobName, jobGroup);
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException(String.format("Failed to unschedule Job [JobGroup:%s, JobName:%s]", jobGroup, jobName));
        }
    }

    public void start() {
        logger.debug("Start scheduler.");

        try {
            localQuartzScheduler.start();
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException("Failed to start scheduler.");
        }
    }

    public void standby() {
        logger.debug("Standby scheduler.");

        try {
            localQuartzScheduler.standby();
        } catch (SchedulerException e) {
            logger.error(e.getMessage(), e);
            throw new ServiceException("Failed to standby scheduler.");
        }
    }
}
