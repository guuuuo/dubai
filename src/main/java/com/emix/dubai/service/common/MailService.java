package com.emix.dubai.service.common;

import com.emix.dubai.entity.User;
import com.emix.dubai.utils.TemplateContentProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author nikog
 */
@Component
@Transactional(readOnly = true)
public class MailService {
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendRegisterNotification(User user) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            message.setSentDate(new Date());

            Address address = new InternetAddress(user.getEmail());
            message.addRecipient(Message.RecipientType.TO, address);

            message.setSubject("Please active your account");

            Map<String, Object> root = new HashMap<String, Object>();
            root.put("baseURL", "http://localhost:8080");
            root.put("user", user);
            message.setContent(TemplateContentProcessor.processTemplateWithFile("register-notification.ftl", root), "text/html; charset=utf-8");

            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();  // TODO
        }
    }
}
