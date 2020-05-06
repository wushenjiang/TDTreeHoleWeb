package com.liuge.dao.userdao;

import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName: UserDao
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  15:32
 */
@Repository
public interface UserDao {
    /**
     * 查找所有的用户
     * @return
     */
    List<User> findAllUser();

    /**
     * 通过id查找用户
     * @param userid
     * @return
     */
    User findUserById(Integer userid);

    /**
     * 通过用户名查找用户(模糊查询)
     * @param username
     * @return
     */
    List<User> findUserByName(String username);

    /**
     * 通过用户id查找发的帖子
     * @param userid
     * @return
     */
    List<Post>  findPostByUserid(Integer userid);

    /**
     * 通过用户id查找他的回帖
     * @param userid
     * @return
     */
    List<Repost> findRepostByUserid(Integer userid);
    /**
     * 更新用户
     * @param user
     */
    void updateUser(User user);

    /**
     * 删除用户
     * @param userid
     */
    void deleteUser(Integer userid);
}
