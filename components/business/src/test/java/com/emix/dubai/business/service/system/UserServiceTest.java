package com.emix.dubai.business.service.system;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.repository.system.UserRepository;
import com.emix.dubai.business.service.system.ShiroDbRealm.ShiroUser;
import com.emix.dubai.data.UserData;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springside.modules.test.security.shiro.ShiroTestUtils;
import org.springside.modules.utils.DateProvider.ConfigurableDateProvider;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * AccountService的测试用例, 测试Service层的业务逻辑.
 * 
 * @author calvin
 */
public class UserServiceTest {

	@InjectMocks
	private UserService userService;

	@Mock
	private UserRepository mockUserDao;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		ShiroTestUtils.mockSubject(new ShiroUser(3L, "foo", "Foo"));
	}

	@Test
	public void registerUser() {
		User user = UserData.randomNewUser();
		Date currentTime = new Date();
		userService.setDateProvider(new ConfigurableDateProvider(currentTime));

		userService.registerUser(user);

		// 验证user的角色，注册日期和加密后的密码都被自动更新了。
		assertEquals("user", user.getRoles());
		assertEquals(currentTime, user.getRegisterDate());
		assertNotNull(user.getPassword());
		assertNotNull(user.getSalt());
	}

	@Test
	public void updateUser() {
		// 如果明文密码不为空，加密密码会被更新.
		User user = UserData.randomNewUser();
		userService.updateUser(user);
		assertNotNull(user.getSalt());

		// 如果明文密码为空，加密密码无变化。
		User user2 = UserData.randomNewUser();
		user2.setPlainPassword(null);
		userService.updateUser(user2);
		assertNull(user2.getSalt());
	}

	@Test
	public void deleteUser() {
		// 正常删除用户.
		userService.deleteUser(2L);
		Mockito.verify(mockUserDao).delete(2L);

		// 删除超级管理用户抛出异常, userDao没有被执行
		try {
			userService.deleteUser(1L);
			fail("expected ServicExcepton not be thrown");
		} catch (ServiceException e) {
			// expected exception
		}
		Mockito.verify(mockUserDao, Mockito.never()).delete(1L);
	}

    @Test
    public void entryptPassword() {
        User user = UserData.randomNewUser();
        user.setPlainPassword("admin");
        userService.entryptPassword(user);
        System.out.println(user.getLoginName());
        System.out.println(user.getPlainPassword());
        System.out.println("salt: " + user.getSalt());
        System.out.println("entrypt password: " + user.getPassword());
    }
}
