package com.edu.eduSocialPractice.eduUser.service;

import com.ToJson;
import com.edu.eduSocialPractice.eduUser.dao.UserMapper;
import com.edu.eduSocialPractice.eduUser.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public ToJson getLike(User user) {
        ToJson json = new ToJson(1,"查询失败");
        try {
            List<User> users = userMapper.selectLike(user);
            json.setFlag(0);
            json.setMsg("查询成功");
            json.setObj(users);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
}
