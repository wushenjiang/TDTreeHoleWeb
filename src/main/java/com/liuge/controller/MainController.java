package com.liuge.controller;

import com.liuge.pojo.Post;
import com.liuge.pojo.Repost;
import com.liuge.pojo.User;
import com.liuge.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @ClassName: MainController
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  20:08
 */
@Controller
@RequestMapping("/main")
public class MainController {
    @Autowired
    private UserService userService;
    @RequestMapping("/showMain")
    public String showMain(HttpSession session){
        //权限控制
        User user = (User) session.getAttribute("user");
        if(user ==null){
            return "redirect:/index";
        }
        return "main";
    }

    /**
     * 显示所有用户
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/showUser")
    public String showUser(HttpSession session, Model model){
        //权限控制
        User user = (User) session.getAttribute("user");
        if(user ==null){
            return "redirect:/index";
        }
        List<User> users = userService.findAllUser();
        model.addAttribute("userList",users);
        return "user/userlist";
    }
    @RequestMapping( "/updateUser")
    public String updateUser(User user, @RequestParam("userid") Integer userid){
        System.out.println(userid);
        User usertemp = userService.findUserById(userid);
        user.setUserid(usertemp.getUserid());
        user.setUsername(usertemp.getUsername());
        userService.updateUser(user);
        return "redirect:/main/showUser";
    }
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam("userid") Integer userid){
        System.out.println(userid);
        userService.deleteUser(userid);
        return "redirect:/main/showUser";
    }
    @RequestMapping("/findUserByName")
    public ModelAndView findUserByName(String username, ModelAndView modelAndView){
        List<User> users = userService.findUserByName(username);
        modelAndView.addObject("userList",users);
        modelAndView.setViewName("user/userlist");
        return modelAndView;
    }
    @RequestMapping("/showUserDetails")
    public String showUserDetails(Integer userid,Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:/index";
        }
        List<Post> posts = userService.findPostByUserid(userid);
        List<Repost> reposts = userService.findRepostByUserid(userid);
        model.addAttribute("postList",posts);
        model.addAttribute("repostList",reposts);
        model.addAttribute("userid",userid);
        return "user/userlistdetails";
    }
}
