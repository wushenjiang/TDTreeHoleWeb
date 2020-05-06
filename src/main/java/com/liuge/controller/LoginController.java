package com.liuge.controller;

import com.liuge.pojo.User;
import com.liuge.service.LoginService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @ClassName: LoginController
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  19:42
 */
@Controller
public class LoginController {
    /**
     * 登录的Controller
     * @param user
     * @return
     */
    @Autowired
    private LoginService loginService;
    @RequestMapping("/index")
    public String showLogin(){
        return "index";
    }
    @RequestMapping("/")
    public String showIndex(){
        return "index";
    }
    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session){
        User usertemp = loginService.isUserExist(user);
        if(usertemp!=null){
            session.setAttribute("user",usertemp);
            return "redirect:main/showMain";
        }
        else{
            model.addAttribute("error","账户名和密码不匹配！");
            return "index";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //注销,销毁session
        session.invalidate();
        return "index";
    }
}
