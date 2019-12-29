package com.listener;

import com.MySessionContext;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//监听session
public class sessionListener implements HttpSessionListener {

    MySessionContext myc = MySessionContext.getInstance();

    public void sessionCreated(HttpSessionEvent sessionEvent)
    {
        //在会话产生时调用
        HttpSession session = sessionEvent.getSession();
        myc.addSession(session);
    }

    public void sessionDestroyed(HttpSessionEvent sessionEvent)
    {
        //在会话关闭时调用
        HttpSession session = sessionEvent.getSession();
        myc.delSession(session);
    }
}
