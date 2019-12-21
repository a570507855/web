package com.main.webURL.service;

import com.ToJson;
import com.main.webURL.model.WebURL;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletResponse;

public interface WebURLService {

    ToJson selectList(Integer page, Integer limit, WebURL webURL);

    ToJson insert(WebURL webURL);

    ToJson update(WebURL webURL);

    ToJson delete(String id);

    ToJson export(@Param("response") HttpServletResponse response, @Param("page") Integer page, @Param("limit") Integer limit, @Param("book") WebURL webURL);
}
