package com.emix.dubai.business.repository.quartz;

import com.emix.dubai.business.entity.quartz.JobDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * @author niko
 */
public interface JobDetailRepository extends PagingAndSortingRepository<JobDetail, Long>, JpaSpecificationExecutor<JobDetail> {
}
