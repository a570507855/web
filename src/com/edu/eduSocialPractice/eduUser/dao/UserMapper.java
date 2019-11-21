package com.edu.eduSocialPractice.eduUser.dao;

import com.edu.eduSocialPractice.eduUser.model.User;

import java.util.List;

public interface UserMapper {


    List<User> selectLike(User user);
}