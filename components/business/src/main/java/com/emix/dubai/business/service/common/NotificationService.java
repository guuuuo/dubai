package com.emix.dubai.business.service.common;

import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.pojo.ApplicationProperties;
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

    public void sendRegisterNotification(final User user, final ApplicationProperties properties) {
        taskExecutor.execute(new SendRegisterNotificationTask(javaMailSender, user, properties));
    }

    public void sendResetPasswordNotification(final User user, final ApplicationProperties properties) {
        taskExecutor.execute(new SendResetPasswordNotificationTask(javaMailSender, user, properties));
    }

    public void sendResetPwdNotification(User user, final ApplicationProperties properties) {
        //To change body of created methods use File | Settings | File Templates.
    }
}
