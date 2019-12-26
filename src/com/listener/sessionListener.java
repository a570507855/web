package com.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;

//监听session
public class sessionListener implements HttpSessionListener {

    public void sessionCreated(HttpSessionEvent sessionEvent)
    {
        //在会话产生时调用
        System.out.println("***************session创建事件*************");
        HttpSession session = sessionEvent.getSession();
        String sessionId = session.getId();
        session.setMaxInactiveInterval(60*10);
        System.out.println("*时间："+new Date().toString());
        System.out.println("*session Id："+sessionId);
    }

    public void sessionDestroyed(HttpSessionEvent sessionEvent)
    {
        //在会话关闭时调用
        System.out.println("***************session销毁事件*************");
        HttpSession session = sessionEvent.getSession();
        String sessionId = session.getId();
        System.out.println("*时间："+new Date().toString());
        System.out.println("*session Id："+sessionId);
    }
}
