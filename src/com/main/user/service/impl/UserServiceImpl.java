package com.main.user.service.impl;

import com.ToJson;
import com.main.user.dao.UserMapper;
import com.main.user.model.UserWithBLOBs;
import com.main.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
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
    public void login(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public boolean isRegister(String accountNumber) {
        long phoneNumber = 0;
        String maibox = "";
        if(isNumer(accountNumber)){
            phoneNumber = Long.parseLong(accountNumber);

        }
        else{
            maibox = accountNumber;
        }
        long i = userMapper.countByLogin(phoneNumber, maibox);
        return i != 0;
    }

    @Override
    public boolean isPass(String accountNumber, String password) {
        long phoneNumber = 0;
        String maibox = "";
        UserWithBLOBs user = new UserWithBLOBs();
        long count = 0;
        user.setPassword(password);
        if(isNumer(accountNumber)){
            phoneNumber = Long.parseLong(accountNumber);
            user.setPhoneNumber(phoneNumber);
            count = userMapper.count(user);
        }
        else{
            maibox = accountNumber;
            user.setMailbox(maibox);
            count = userMapper.count(user);
        }
        return isRegister(accountNumber) && count != 0;
    }

    public static boolean isNumer(String str) {
        String bigStr;
        try {
            bigStr = new BigDecimal(str).toString();
        } catch (Exception e) {
            return false;//异常 说明包含非数字。
        }
        return true;
    }

}
