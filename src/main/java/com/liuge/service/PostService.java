package com.liuge.service;

import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;

import java.util.List;

/**
 * @ClassName: PostService
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:08
 */

public interface PostService {
    /**
     * 显示所有的帖子
     * @return
     */
    List<Post> findAllPost();

    /**
     * 通过id查找帖子
     * @param postid
     * @return
     */
    Post findPostById(Integer postid);

    /**
     * 通过标题查找帖子(模糊查询)
     * @param title
     * @return
     */
    List<Post> findPostByName(String title);

    /**
     * 通过帖子id查找回帖
     * @param postid
     * @return
     */
    List<Repost> findRepostByPostid(Integer postid);
    /**
     * 更新帖子内容
     * @param post
     */
    void updatePost(Post post);

    /**
     * 删除帖子
     * @param postid
     */
    void deletePost(Integer postid);
}
