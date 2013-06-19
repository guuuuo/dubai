package com.emix.dubai.business.service.common;

import com.emix.dubai.business.entity.system.User;
import com.emix.core.utils.TemplateContentProcessor;
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
public class SendRegisterNotificationTask implements Runnable {

    private JavaMailSender javaMailSender;
    private User user;

    SendRegisterNotificationTask(JavaMailSender javaMailSender, User user) {
        this.javaMailSender = javaMailSender;
        this.user = user;
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
                messageHelper.setSubject("Please active your account");
                Map<String, Object> root = new HashMap<String, Object>();
                root.put("baseURL", "http://localhost:8080");
                root.put("user", user);
                messageHelper.setText(TemplateContentProcessor.processTemplateWithFile("register-notification.ftl", root), true);
            }
        });

    }
}
