package com.main.webURL.controller;

import com.ToJson;
import com.main.webURL.model.WebURL;
import com.main.webURL.service.WebURLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("webURL")
public class WebURLController {

    @Autowired
    private WebURLService webURLService;

    @RequestMapping("webURL")
    public String webURL(){
        return "main/webURL/webURL";
    }

    @ResponseBody
    @RequestMapping("selectList")
    public ToJson selectList(Integer page, Integer limit, WebURL webURL){
        return webURLService.selectList(page, limit, webURL);
    }

    @ResponseBody
    @RequestMapping("insert")
    public ToJson insert(WebURL webURL){
        return webURLService.insert(webURL);
    }

    @ResponseBody
    @RequestMapping("update")
    public ToJson update(WebURL webURL){
        return webURLService.update(webURL);
    }

    @ResponseBody
    @RequestMapping("delete")
    public ToJson delete(String id){
        return webURLService.delete(id);
    }

    @ResponseBody
    @RequestMapping("export")
    public ToJson export(HttpServletResponse response, Integer page, Integer limit, WebURL webURL){
        return webURLService.export(response, page, limit, webURL);
    }

}
