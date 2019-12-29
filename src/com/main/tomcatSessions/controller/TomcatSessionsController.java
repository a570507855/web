package com.main.tomcatSessions.controller;

import com.ToJson;
import com.main.tomcatSessions.model.TomcatSessions;
import com.main.tomcatSessions.service.TomcatSessionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("tomcatSessions")
public class TomcatSessionsController {

    @Autowired
    private TomcatSessionsService tomcatSessionsService;

    @RequestMapping("tomcatSessions")
    public String tomcatSessions(){
        return "main/tomcatSessions/tomcatSessions";
    }

    @ResponseBody
    @RequestMapping("selectList")
    public ToJson selectList(Integer page, Integer Limit, TomcatSessions tomcatSessions){
        return tomcatSessionsService.selectList(page, Limit, tomcatSessions);
    }

    @ResponseBody
    @RequestMapping("selectSessions")
    public ToJson selectSessions(){
        return tomcatSessionsService.selectSessions();
    }
}
