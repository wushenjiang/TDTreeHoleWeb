package com.liuge.controller;

import com.liuge.pojo.Repost;
import com.liuge.pojo.User;
import com.liuge.service.RepostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName: RePostController
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:27
 */
@Controller
@RequestMapping("/repost")
public class RePostController {
    @Autowired
    private RepostService repostService;
    /**
     * 显示所有回帖
     * @return
     */
    @RequestMapping("/showRepost")
    public String showRepost(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:/index";
        }
        List<Repost> reposts = repostService.findAllRepost();
        model.addAttribute("repostList",reposts);
        return "/repost/repostList";
    }
    @RequestMapping("/updateRepost")
    public String updateRepost(Repost repost, @RequestParam("repostid") Integer repostid){
        update(repost, repostid);
        return "redirect:/repost/showRepost";
    }

    private void update(Repost repost, @RequestParam("repostid") Integer repostid) {
        Repost reposttemp = repostService.findRepostById(repostid);
        repost.setRepostid(reposttemp.getRepostid());
        repost.setModifytime(reposttemp.getModifytime());
        repost.setPublishtime(reposttemp.getPublishtime());
        repost.setPostid(reposttemp.getPostid());
        repost.setUserid(reposttemp.getUserid());
        repostService.updateRepost(repost);
    }

    @RequestMapping("/updateRepostForUser")
    public String updateRepostForUser(Repost repost,Integer repostid,Integer userid){
        update(repost, repostid);
        return "redirect:/main/showUserDetails?userid="+userid;
    }
    @RequestMapping("/updateRepostForPost")
    public String updateRepostForPost(Repost repost,Integer repostid,Integer postid){
        update(repost,repostid);
        return "redirect:/post/showPostDetails?postid="+postid;
    }
    @RequestMapping("/deleteRepost")
    public String deleteRepost( Integer repostid){
        System.out.println(repostid);
        repostService.deleteRepost(repostid);
        return "redirect:/repost/showRepost";
    }
    @RequestMapping("/deleteRepostForUser")
    public String deleteRepostForUser(Integer repostid,Integer userid){
        repostService.deleteRepost(repostid);
        return "redirect:/main/showUserDetails?userid="+userid;
    }
    @RequestMapping("/deleteRepostForPost")
    public String deleteRepostForPost(Integer repostid,Integer postid){
        repostService.deleteRepost(repostid);
        return "redirect:/post/showPostDetails?postid="+postid;
    }
}
