package com.liuge.service;

import com.liuge.pojo.User;

/**
 * @ClassName: LoginService
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  19:44
 */
public interface LoginService {
    /**
     * 检查用户名密码是否正确
     * @param user
     * @return
     */
    User isUserExist(User user);
}
