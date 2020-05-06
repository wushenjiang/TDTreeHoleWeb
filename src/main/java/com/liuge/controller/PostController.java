package com.liuge.controller;

import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.pojo.User;
import com.liuge.service.PostService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName: PostController
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:08
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;
    /**
     * 显示所有帖子
     * @return
     */
    @RequestMapping("/showPost")
    public String showPost(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:/index";
        }
        List<Post> postList = postService.findAllPost();
        if(postList!=null){
            model.addAttribute("postList",postList);
        }
        return "post/postlist";
    }
    @RequestMapping("/updatePost")
    public String updatePost(Post post, @RequestParam("postid") Integer postid){
        update(post, postid);
        return "redirect:/post/showPost";
    }
    @RequestMapping("/updatePostForUser")
    public String updatePostForUser(Post post,Integer postid,Integer userid){
        update(post, postid);
        return "redirect:/main/showUserDetails?userid="+userid;
    }
    @RequestMapping("/updatePostForPost")
    public String updatePostForPost(Post post,Integer postid){
        update(post,postid);
        return "redirect:/post/showPostDetails?postid="+postid;
    }
    private void update(Post post, @RequestParam("postid") Integer postid) {
        System.out.println(postid);
        Post posttemp = postService.findPostById(postid);
        post.setPostid(posttemp.getPostid());
        post.setModifytime(posttemp.getModifytime());
        post.setPosttime(posttemp.getPosttime());
        post.setPosttype(posttemp.getPosttype());
        post.setUserid(posttemp.getUserid());
        postService.updatePost(post);
    }
    @RequestMapping("/deletePost")
    public String deletePost(@RequestParam("postid") Integer postid){
        postService.deletePost(postid);
        return "redirect:/post/showPost";
    }
    @RequestMapping("/deletePostForUser")
    public String deletePostForUser(Integer postid,Integer userid){
        postService.deletePost(postid);
        return "redirect:/main/showUserDetails?userid="+userid;
    }
    @RequestMapping("/findPostByName")
    public ModelAndView findPostByName(String title, ModelAndView modelAndView,HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            modelAndView.setViewName("redirect:/index");
            return modelAndView;
        }
        List<Post> posts = postService.findPostByName(title);
        modelAndView.addObject("postList",posts);
        modelAndView.setViewName("post/postlist");
        return modelAndView;
    }
    @RequestMapping("/showPostDetails")
    public String showPostDetails(Integer postid, Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:/index";
        }
        Post post = postService.findPostById(postid);
        List<Repost> reposts = postService.findRepostByPostid(postid);
        model.addAttribute("post",post);
        model.addAttribute("repostList",reposts);
        return "post/postlistdetails";
    }
}
