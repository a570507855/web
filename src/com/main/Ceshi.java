package com.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Controller
@RequestMapping("ceshi")
public class Ceshi {

    @RequestMapping("video")
    public void video(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int len = 54902995;
        //创建文件对象
        File file = new File("D:\\idea_project\\web\\web\\WEB-INF\\video/second.mp4");
        //获取文件名称
        String fileName = file.getName();
        String agent = request.getHeader("User-Agent").toUpperCase();
        InputStream fis = null;
        OutputStream os = null;
        fis = new BufferedInputStream(new FileInputStream(file));

        byte[] buffer = new byte[len];
        fis.read(buffer,0,len);
        response.reset();
        //由于火狐和其他浏览器显示名称的方式不相同，需要进行不同的编码处理
        if(agent.indexOf("FIREFOX") != -1){//火狐浏览器
            response.addHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("GB2312"),"ISO-8859-1"));
        }else{//其他浏览器
            response.addHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName, "UTF-8"));
        }
        //设置response编码
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Length", "" + file.length());
        response.addHeader("Content-Range", "bytes 0-54902995/" + file.length());
        //设置输出文件类型
        response.setContentType("video/mp4");
        //获取response输出流
        os = response.getOutputStream();
        // 输出文件
        os.write(buffer);
    }



}
