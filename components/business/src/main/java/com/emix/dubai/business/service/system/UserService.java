package com.emix.dubai.business.service.system;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.repository.system.UserRepository;
import com.emix.dubai.business.service.system.ShiroDbRealm.ShiroUser;
import com.emix.dubai.business.status.UserStatus;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.DateProvider;
import org.springside.modules.utils.Encodes;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * 用户管理类.
 *
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional(readOnly = true)
public class UserService {

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;

    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserRepository userRepository;
    private DateProvider dateProvider = DateProvider.DEFAULT;

    public User getUser(Long id) {
        return userRepository.findOne(id);
    }

    public User findUserByLoginName(String loginName) {
        return userRepository.findByLoginName(loginName);
    }

    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Transactional(readOnly = false)
    public void registerUser(User user) {
        entryptPassword(user);
        generateActivationKey(user);
        user.setRoles("user");
        user.setRegisterDate(dateProvider.getDate());
        user.setNiceName(user.getLoginName());
        user.setStatusCode(UserStatus.Pending.code());
        user.setCreatedBy(user.getLoginName());
        user.setCreatedWhen(dateProvider.getDate());

        userRepository.save(user);
    }

    @Transactional(readOnly = false)
    public void createUser(User user) {
        entryptPassword(user);
        generateActivationKey(user);
        user.setRegisterDate(dateProvider.getDate());
        user.setCreatedBy("niko");
        user.setCreatedWhen(dateProvider.getDate());

        userRepository.save(user);
    }

    @Transactional(readOnly = false)
    public void updateUser(User user) {
        if (StringUtils.isNotBlank(user.getPlainPassword())) {
            entryptPassword(user);
        }
        userRepository.save(user);
    }

    @Transactional(readOnly = false)
    public void updatePassword(User user) {
        User dbUser = userRepository.findOne(user.getId());
        dbUser.setPlainPassword(user.getPlainPassword());
        entryptPassword(dbUser);
        userRepository.save(dbUser);
    }

    @Transactional(readOnly = false)
    public void deleteUser(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
            throw new ServiceException("不能删除超级管理员用户");
        }
        userRepository.delete(id);
    }

    @Transactional(readOnly = false)
    public void activeUser(Long id) {
        User user = userRepository.findOne(id);
        user.setStatusCode(UserStatus.Active.code());
        userRepository.save(user);
    }

    @Transactional(readOnly = false)
    public void deactiveUser(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试取消激活超级管理员用户", getCurrentUserName());
            throw new ServiceException("不能取消激活超级管理员用户");
        }
        User user = userRepository.findOne(id);
        user.setStatusCode(UserStatus.Inactive.code());
        userRepository.save(user);
    }

    public Page<User> getUsers(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<User> spec = buildSpecification(searchParams);

        return userRepository.findAll(spec, pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("loginName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "loginName");
        } else if ("niceName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "name");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<User> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<User> spec = DynamicSpecifications.bySearchFilter(filters.values(), User.class);
        return spec;
    }

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(Long id) {
        return id == 1;
    }

    /**
     * 取出Shiro中的当前用户LoginName.
     */
    private String getCurrentUserName() {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user.loginName;
    }

    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     */
    void entryptPassword(User user) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        user.setSalt(Encodes.encodeHex(salt));

        byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
        user.setPassword(Encodes.encodeHex(hashPassword));
    }

    void generateActivationKey(User user) {
        user.setActKey(Encodes.encodeHex(Digests.sha1((user.getLoginName() + System.currentTimeMillis()).getBytes())));
        user.setActKeyGenDate(dateProvider.getDate());
    }

    public void setDateProvider(DateProvider dateProvider) {
        this.dateProvider = dateProvider;
    }

    @Transactional(readOnly = false)
    public void activeUser(String key) {
        User user = userRepository.findByActKey(key);
        if (user == null
                || DateUtils.truncatedCompareTo(dateProvider.getDate(), user.getActKeyGenDate(), Calendar.HOUR) > 24
                || user.getActDate() != null) {
            throw new ServiceException("激活码错误或者已失效。");
        }
        user.setStatusCode(UserStatus.Active.code());
        user.setActDate(new Date());
        userRepository.save(user);
    }
}
