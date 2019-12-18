package com.main.webURL.service;

import com.ToJson;
import com.main.webURL.model.WebURL;

public interface WebURLService {

    ToJson selectList(Integer page, Integer limit, WebURL webURL);

    ToJson insert(WebURL webURL);

    ToJson update(WebURL webURL);

    ToJson delete(String id);
}
