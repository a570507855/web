package com.myWebSocket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("webSocket")
public class MyWebSocket {

    @RequestMapping("webSocket")
    public String webSocket(){
        return "main/webSocket/webSocket";
    }


}
