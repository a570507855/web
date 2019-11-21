package com.edu.eduSocialPractice.eduUser.controller;

import com.ToJson;
import com.edu.eduSocialPractice.eduUser.model.User;
import com.edu.eduSocialPractice.eduUser.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/selectLike")
    @ResponseBody
    public ToJson selectLike(User user){
        return userService.getLike(user);
    }
}
