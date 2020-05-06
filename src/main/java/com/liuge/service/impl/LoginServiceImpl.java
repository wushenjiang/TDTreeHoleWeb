package com.liuge.service.impl;

import com.liuge.dao.logindao.LoginDao;
import com.liuge.pojo.User;
import com.liuge.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName: LoginServiceImpl
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  19:46
 */
@Service
public class LoginServiceImpl implements LoginService {
    /**
     * 去数据库中查询用户名密码
     * @param user
     * @return
     */
    @Autowired
    private LoginDao loginDao;
    @Override
    public User isUserExist(User user) {
        User usertemp = loginDao.isUserExist(user);
        return usertemp;
    }
}
