package com.liuge.service.impl;

import com.liuge.dao.postdao.PostDao;
import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: PostServiceImpl
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:10
 */
@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostDao postDao;
    @Override
    public List<Post> findAllPost() {
        List<Post> posts = postDao.findAllPost();
        return posts;
    }

    @Override
    public Post findPostById(Integer postid) {
        Post post = postDao.findPostById(postid);
        return post;
    }

    @Override
    public List<Post> findPostByName(String title) {
        List<Post> posts = postDao.findPostByName(title);
        return posts;
    }

    @Override
    public List<Repost> findRepostByPostid(Integer postid) {
        List<Repost> reposts = postDao.findRepostByPostid(postid);
        return reposts;
    }

    @Override
    public void updatePost(Post post) {
        postDao.updatePost(post);
    }

    @Override
    public void deletePost(Integer postid) {
        postDao.deletePost(postid);
    }
}
