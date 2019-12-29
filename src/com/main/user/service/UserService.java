package com.main.user.service;

import com.ToJson;
import com.main.user.model.UserWithBLOBs;
import org.apache.ibatis.annotations.Param;

public interface UserService {
    ToJson selectList(@Param("integer") Integer page, @Param("limit") Integer limit, @Param("user") UserWithBLOBs user);

    ToJson insert(UserWithBLOBs user);

    ToJson update(UserWithBLOBs user);

    ToJson delete(String id);
}
