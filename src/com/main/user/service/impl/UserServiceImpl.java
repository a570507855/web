package com.main.user.service.impl;

import com.ToJson;
import com.main.user.dao.UserMapper;
import com.main.user.model.UserWithBLOBs;
import com.main.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public ToJson selectList(Integer page, Integer limit, UserWithBLOBs user) {
        ToJson json = new ToJson("查询失败");
        try {
            long count = userMapper.count(user);
            List<UserWithBLOBs> list = userMapper.selectList(page, limit, user);
            json.setFlag(1);
            json.setCode("0");
            json.setMsg("查询成功");
            json.setObj(list);
            json.setTotleNum(count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(UserWithBLOBs user) {
        user.setRegistrationTime(new Date());
        ToJson json = new ToJson("新增失败");
        try {
            int i = userMapper.inserts(user);
            if(i > 0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("新增成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson update(UserWithBLOBs user) {
        ToJson json = new ToJson("更新失败");
        try {
            int i = userMapper.updates(user);
            if(i > 0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("更新成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson delete(String id) {
        ToJson json = new ToJson("删除失败");
        try {
            String[] idArr = id.split(",");
            int i = userMapper.deletes(idArr);
            json.setFlag(1);
            json.setCode("0");
            json.setMsg("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson login(UserWithBLOBs user) {
        ToJson json = new ToJson("登录失败");
        try {
            long phoneNumber = user.getPhoneNumber();
            String maibox = user.getMailbox();
            String password = user.getPassword();
            long i = userMapper.countByLogin(phoneNumber, maibox);
            if(i <1){
                json.setMsg("账号不存在");
            }
            else{
                List<UserWithBLOBs> list = userMapper.selectList(null,null, user);
                if(list.isEmpty()){
                    json.setMsg("密码错误");
                }
                else{
                    json.setFlag(1);
                    json.setCode("0");
                    json.setMsg("可以登录");
                    UserWithBLOBs user1 =  list.get(0);
                    user1.setIsOnline(true);
                    userMapper.updates(user1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
}
