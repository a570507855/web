package com.main.user.service;

import com.ToJson;
import com.main.user.model.UserWithBLOBs;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
    ToJson selectList(@Param("integer") Integer page, @Param("limit") Integer limit, @Param("user") UserWithBLOBs user);

    ToJson insert(UserWithBLOBs user);

    ToJson update(UserWithBLOBs user);

    ToJson delete(String id);

    void login(HttpServletRequest request, HttpServletResponse response);

    boolean isRegister(String accountNumber);

    boolean isPass(String accountNumber, String password);
}
