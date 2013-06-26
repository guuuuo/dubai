package com.emix.dubai.business.service.common;

import com.emix.core.utils.TemplateContentProcessor;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.pojo.ApplicationProperties;
import org.apache.commons.lang3.Validate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author niko
 */
public class SendResetPasswordNotificationTask implements Runnable {

    private JavaMailSender javaMailSender;
    private User user;
    private ApplicationProperties properties;

    SendResetPasswordNotificationTask(JavaMailSender javaMailSender, User user, ApplicationProperties properties) {
        this.javaMailSender = javaMailSender;
        this.user = user;
        this.properties = properties;
    }

    @Override
    public void run() {
        javaMailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                Validate.notEmpty(user.getEmail());
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageHelper.setTo(user.getEmail());
                messageHelper.setSentDate(new Date());
                messageHelper.setSubject("Please reset your password");
                Map<String, Object> root = new HashMap<String, Object>();
                root.put("properties", properties);
                root.put("user", user);
                messageHelper.setText(TemplateContentProcessor.processTemplateWithFile("reset-password-notification.ftl", root), true);
            }
        });

    }
}
