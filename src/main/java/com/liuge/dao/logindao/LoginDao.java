package com.liuge.dao.logindao;

import com.liuge.pojo.User;
import org.springframework.stereotype.Repository;

/**
 * @ClassName: LoginDao
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  19:46
 */
@Repository
public interface LoginDao {
    /**
     * 检测用户是否存在
     * @param user
     * @return
     */
    User isUserExist(User user);
}
