package com.emix.dubai.business.service.quartz;

import com.emix.dubai.business.entity.quartz.JobDetail;
import com.emix.dubai.business.repository.quartz.JobDetailRepository;
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

    @Autowired
    private JobDetailRepository jobDetailRepository;

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
}
