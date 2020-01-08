package com.webAPI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("webAPI")
public class webAPI {

    @RequestMapping("index")
    public String index(){
        return "main/webAPI/index";
    }

    @RequestMapping("HTMLVideoElement")
    public String HTMLVideoElement(){
        return "main/webAPI/HTMLVideoElement";
    }
}
