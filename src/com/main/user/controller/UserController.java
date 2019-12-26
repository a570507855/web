package com.main.user.controller;

import com.ToJson;
import com.main.user.model.UserWithBLOBs;
import com.main.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("user")
    public String user(){
        return "main/user/user";
    }

    @ResponseBody
    @RequestMapping("selectList")
    public ToJson selectList(Integer page, Integer limit, UserWithBLOBs user){
        return userService.selectList(page, limit, user);
    }

    @ResponseBody
    @RequestMapping("insert")
    public ToJson insert(UserWithBLOBs user){
        return userService.insert(user);
    }

    @ResponseBody
    @RequestMapping("update")
    public ToJson update(UserWithBLOBs user){
        return userService.update(user);
    }

    @ResponseBody
    @RequestMapping("delete")
    public ToJson delete(String id){
        return userService.delete(id);
    }

    @ResponseBody
    @RequestMapping("login")
    public void login(HttpServletRequest request, HttpServletResponse response){
        userService.login(request, response);
    }

    @ResponseBody
    @RequestMapping("isRegister")
    public boolean isRegister(String accountNumber){
        return userService.isRegister(accountNumber);
    }

    @ResponseBody
    @RequestMapping("isPass")
    public boolean isPass(String accountNumber, String password){
        return userService.isPass(accountNumber, password);
    }
}
