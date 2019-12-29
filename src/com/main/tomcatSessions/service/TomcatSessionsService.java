package com.main.tomcatSessions.service;

import com.ToJson;
import com.main.tomcatSessions.model.TomcatSessions;
import org.apache.ibatis.annotations.Param;

public interface TomcatSessionsService {

    ToJson selectList(@Param("page") Integer page, @Param("limit") Integer limit, @Param("tomcatSessions") TomcatSessions tomcatSessions);

    ToJson selectSessions();
}
