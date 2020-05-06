package com.liuge.service;

import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.pojo.User;

import java.util.List;

/**
 * @ClassName: UserService
 * @Description: User的业务层接口
 * @author: LiuGe
 * @date: 2020/5/5  15:31
 */
public interface UserService {
    /**
     * 获取所有的用户信息
     * @return
     */
    List<User> findAllUser();

    /**
     * 通过id获取用户信息
     * @param userid
     * @return
     */
    User findUserById(Integer userid);

    /**
     * 根据用户名查找用户(模糊查询)
     * @param username
     * @return
     */
    List<User> findUserByName(String username);

    /**
     * 通过用户id找到发的帖子
     * @param userid
     * @return
     */
    List<Post> findPostByUserid(Integer userid);

    /**
     * 通过用户id查找回帖
     * @param userid
     * @return
     */
    List<Repost> findRepostByUserid(Integer userid);
    /**
     * 更新User的数据
     * @param user
     */
    void updateUser(User user);

    /**
     * 删除User
     * @param userid
     */
    void deleteUser(Integer userid);


}
