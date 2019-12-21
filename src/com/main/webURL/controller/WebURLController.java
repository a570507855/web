package com.main.webURL.controller;

import com.ToJson;
import com.main.webURL.model.WebURL;
import com.main.webURL.service.WebURLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("webURL")
public class WebURLController {

    @Autowired
    private WebURLService webURLService;

    @RequestMapping("webURL")
    public String webURL(HttpServletRequest request, HttpServletResponse response){
        System.out.println("**************************************");
        //获取客户端cookie
        System.out.println(request.getHeader("cookie"));
        //设置服务端cookie
        response.addCookie(new Cookie("username","disueb"));
        //设置session
        HttpSession session = request.getSession();
        session.setAttribute("username","许亦勇");
        String sessionId = session.getId();
        if(session.isNew()){
            System.out.println("该session是新创建的，ID："+sessionId);
        }/*E02414723F1879780DE401AB614EBD6E*/
        else{
            System.out.println("服务器已经存在该session，ID："+sessionId);
        }
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
