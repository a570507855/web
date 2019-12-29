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
}
