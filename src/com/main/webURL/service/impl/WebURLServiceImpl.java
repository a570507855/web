package com.main.webURL.service.impl;

import com.ToJson;
import com.main.webURL.dao.WebURLMapper;
import com.main.webURL.model.WebURL;
import com.main.webURL.model.WebURLExample;
import com.main.webURL.service.WebURLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WebURLServiceImpl implements WebURLService {

    @Autowired
    private WebURLMapper mapper;

    @Override
    public ToJson selectList(Integer page, Integer limit, WebURL webURL) {
        ToJson json = new ToJson("查询失败");
        try {
            List<WebURL> list = mapper.selectList(page, limit, webURL);
            long count = mapper.countByExample(new WebURLExample());
            json.setFlag(1);
            json.setCode("0");
            json.setMsg("查询成功");
            json.setObj(list);
            json.setTotleNum((int)count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(WebURL webURL) {
        ToJson json = new ToJson("新增失败");
        try {
            String subdomain = webURL.getSubdomain(),
                    domain = webURL.getDomain(),
                    suffix = webURL.getSuffix();
            String host = subdomain == "" ? "" : subdomain +
                            domain == "" ? "" : "." + domain +
                            suffix == "" ? "" : "." + suffix;
            webURL.setHost(host);
            int i = mapper.insert(webURL);
            if(i>0){
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
    public ToJson update(WebURL webURL) {
        ToJson json = new ToJson("更新失败");
        try {
            int i = mapper.updates(webURL);
            if(i>0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("更新失败");

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
            int i = mapper.deletes(idArr);
            if(i>0){
                json.setFlag(1);
                json.setCode("0");
                json.setMsg("删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;

    }
}
