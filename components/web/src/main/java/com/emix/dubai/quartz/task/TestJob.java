package com.emix.dubai.quartz.task;

import com.emix.dubai.business.entity.sys.User;
import com.emix.dubai.business.repository.UserDao;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springside.modules.utils.DateProvider;

/**
 * @author niko
 */
@Component
public class TestJob implements Job {
    @Autowired
    private UserDao userDao;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        User user = userDao.findByLoginName("admin");

        DateProvider dateProvider = DateProvider.DEFAULT;
        System.out.println("******************************* Current Time: " + dateProvider.getDate() + ", ******** User Nice Name: " + user.getNiceName());
    }
}
