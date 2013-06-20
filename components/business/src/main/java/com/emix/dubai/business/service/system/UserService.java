package com.emix.dubai.business.service.system;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.repository.system.UserRepository;
import com.emix.dubai.business.service.BaseService;
import com.emix.dubai.business.status.UserStatus;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.utils.DateProvider;

import java.util.Calendar;

/**
 * @author niko
 */
@Component
@Transactional(readOnly = true)
public class UserService extends BaseService {
    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = false)
    public void activeUser(String key) {
        User user = userRepository.findByActKey(key);
        if (user == null) {
            throw new ServiceException("不存在");
        }
        if (DateUtils.truncatedCompareTo(dateProvider.getDate(), user.getActKeyGenDate(), Calendar.HOUR) > 24) {
            throw new ServiceException("激活码已失效");
        }
        user.setStatusCode(UserStatus.Active.code());
        userRepository.save(user);
    }
}
