package com.emix.dubai.business.service.common;

import com.emix.dubai.business.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nikog
 */
@Component
@Transactional(readOnly = true)
public class NotificationService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private TaskExecutor taskExecutor;

    public void sendRegisterNotification(final User user) {
        taskExecutor.execute(new SendRegisterNotificationTask(javaMailSender, user));
    }
}
