package com.liuge.test;

import com.liuge.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @ClassName: SpringTest
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  15:27
 */
public class SpringTest {
    @Test
    public void testSpring(){
        //获取配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("springConfig.xml");
        //得到Service
        UserServiceImpl userService = (UserServiceImpl) ac.getBean("userService");
        //执行方法
        userService.findAllUser();

    }
}
