package com.serverSent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@RequestMapping("serverSent")
@Controller
public class ServerSent {

    static private int id = 0;

    @RequestMapping("serverSentPage")
    public String serverSentPage(){
        return "main/webServerSent/serverSent";
    }

    @RequestMapping("sentData")
    @ResponseBody
    public void userSent(HttpServletResponse response, HttpServletRequest request)throws IOException,InterruptedException{
        response.addHeader("Connection","keep-alive");
        response.addHeader("Cache-Control","no-cache");
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");

        PrintWriter writer = response.getWriter();

        writer.write("id:" + ++id + " \n");
        //writer.write("event: foo \n");
        writer.write("retry:1000 \n");//浏览器重新发起连接的时间间隔
        writer.write("data:{ \n" +
                "data:\"username\":\"xyy\", \n" +
                "data:\"sex\":\"男\", \n" +
                "data:\"age\":26 \n" +
                "data:} \n\n");
        writer.close();
    }
}
