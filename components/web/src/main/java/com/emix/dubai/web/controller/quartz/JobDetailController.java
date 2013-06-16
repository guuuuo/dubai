package com.emix.dubai.web.controller.quartz;

import com.emix.core.web.BaseController;
import com.emix.dubai.business.entity.quartz.JobDetail;
import com.emix.dubai.business.service.quartz.JobDetailService;
import com.emix.dubai.constants.GlobalConstants;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author niko
 */
@Controller
@RequestMapping(value = "/quartz/job-details")
public class JobDetailController extends BaseController {

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

    static {
        sortTypes.put("jobName", "Job Name");
        sortTypes.put("jobGroup", "Group Name");
        sortTypes.put("jobClassName", "Job Class Name");
    }

    @Autowired
    private JobDetailService jobDetailsService;

    @RequestMapping(value = "")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<JobDetail> jobDetails = jobDetailsService.loadJobDetails(searchParams, pageNumber, GlobalConstants.PAGE_SIZE, sortType);

        model.addAttribute("jobDetails", jobDetails);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "quartz/jobDetailList";
    }
}
