package com.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("views")
public class JspController {

    //登录界面
    @RequestMapping("login")
    public String login(){
        return "login/login";
    }

    //注册界面
    @RequestMapping("register")
    public String register(){
        return "login/register";
    }

    //修改密码界面
    @RequestMapping("changePassword")
    public String changePassword(){
        return "login/changePassword";
    }

    //头部
    @RequestMapping("head")
    public String head(){
        return "fixed/head";
    }

    //底部
    @RequestMapping("footer")
    public String footer(){
        return "fixed/footer";
    }

    //静态资源文件
    @RequestMapping("resources")
    public String resources(){
        return "fixed/resources";
    }

    //jsp学习笔记
    @RequestMapping("jsp")
    public String jsp(){
        return "main/studyNotes/jsp";
    }


    //首页
    @RequestMapping("home")
    public String home(){
        return "main/home";
    }

}
