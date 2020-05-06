package com.liuge.service.impl;

import com.liuge.dao.userdao.UserDao;
import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.pojo.User;
import com.liuge.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: UserServiceImpl
 * @Description: User的业务层实现类
 * @author: LiuGe
 * @date: 2020/5/5  15:33
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> findAllUser() {
        List<User> users = userDao.findAllUser();
        if(users==null){
            System.out.println("查询失败!");
        }
        return users;
    }

    @Override
    public User findUserById(Integer userid) {
        User user = userDao.findUserById(userid);
        return user;
    }

    @Override
    public List<User> findUserByName(String username) {
        List<User> users = userDao.findUserByName(username);
        return users;
    }

    @Override
    public List<Post> findPostByUserid(Integer userid) {
        List<Post> posts = userDao.findPostByUserid(userid);
        return posts;
    }

    @Override
    public List<Repost> findRepostByUserid(Integer userid) {
        List<Repost> reposts = userDao.findRepostByUserid(userid);
        return reposts;
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUser(Integer userid) {
        userDao.deleteUser(userid);
    }
}
