package com.emix.dubai.web.controller.quartz;

import com.emix.core.web.BaseController;
import com.emix.dubai.business.entity.quartz.JobDetail;
import com.emix.dubai.business.service.quartz.JobDetailService;
import com.emix.dubai.constants.GlobalConstants;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author niko
 */
@Controller
@RequestMapping(value = "/quartz/job-details")
public class JobDetailController extends BaseController {

    private final Logger logger = LoggerFactory.getLogger(JobDetailController.class);

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

    @RequestMapping(value = "pause")
    public String pause(@RequestParam(value="jobName")String jobName, @RequestParam(value="jobGroup")String jobGroup, RedirectAttributes redirectAttributes) {
        jobDetailsService.pauseJob(jobName, jobGroup);
        redirectAttributes.addFlashAttribute("message", String.format("Job [JobGroup:%s, JobName:%s] paused.", jobGroup, jobName));
        return redirect("/quartz/job-details");
    }

    @RequestMapping(value = "resume")
    public String resume(@RequestParam(value="jobName")String jobName, @RequestParam(value="jobGroup")String jobGroup, RedirectAttributes redirectAttributes) {
        jobDetailsService.resumeJob(jobName, jobGroup);
        redirectAttributes.addFlashAttribute("message", String.format("Job [JobGroup:%s, JobName:%s] resumed.", jobGroup, jobName));
        return redirect("/quartz/job-details");
    }


    @RequestMapping(value = "pause-all")
    public String pauseAll(RedirectAttributes redirectAttributes) {
        jobDetailsService.pauseAll();
        redirectAttributes.addFlashAttribute("message", "All jobs paused.");
        return redirect("/quartz/job-details");
    }

    @RequestMapping(value = "resume-all")
    public String resumeAll(RedirectAttributes redirectAttributes) {
        jobDetailsService.resumeAll();
        redirectAttributes.addFlashAttribute("message", "All jobs resumed.");
        return redirect("/quartz/job-details");
    }

    @RequestMapping(value = "unschedule")
    public String unschedule(@RequestParam(value="jobName")String jobName, @RequestParam(value="jobGroup")String jobGroup, RedirectAttributes redirectAttributes) {
        jobDetailsService.unscheduleJob(jobName, jobGroup);
        redirectAttributes.addFlashAttribute("message", String.format("Job [JobGroup:%s, JobName:%s] unscheduled.", jobGroup, jobName));
        return redirect("/quartz/job-details");
    }

    @RequestMapping(value = "start-scheduler")
    public String startScheduler(RedirectAttributes redirectAttributes) {
        jobDetailsService.start();
        redirectAttributes.addFlashAttribute("message", "Scheduler started.");
        return redirect("/quartz/job-details");
    }

    @RequestMapping(value = "standby-scheduler")
    public String standbyScheduler(RedirectAttributes redirectAttributes) {
        jobDetailsService.standby();
        redirectAttributes.addFlashAttribute("message", "Scheduler standby.");
        return redirect("/quartz/job-details");
    }
}
