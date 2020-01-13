package com;

import org.springframework.web.socket.WebSocketSession;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

//运用了单例模式--该类负责创建自己的对象，同时确保只有单个对象被创建
public class MySessionContext {

    private static MySessionContext instance;

    private HashMap<String, HttpSession> sessionMap;

    private HashMap<String, WebSocketSession> webSocketSessionMap;

    //构造函数为私有
    private MySessionContext(){
        sessionMap = new HashMap<String, HttpSession>();
    }

    public static MySessionContext getInstance(){
        if(instance == null){
            instance = new MySessionContext();
        }
        return instance;
    }

    /************************session*****************************/

    public synchronized void addSession(HttpSession session){
        if(session != null){
            sessionMap.put(session.getId(),session);
        }
    }

    public synchronized void delSession(HttpSession session){
        if(session != null){
            sessionMap.remove(session.getId());
        }
    }

    public synchronized HttpSession getSession(String sessionId){
        return sessionMap.get(sessionId);
    }

    public synchronized HashMap<String, HttpSession> getSessionMap(){
        return sessionMap;
    }

    public synchronized int getSessionCount(){
        return sessionMap.size();
    }

    public synchronized HttpSession isOnline(String accountNumber){
        for(HashMap.Entry<String, HttpSession> entry : sessionMap.entrySet()){
            if(accountNumber.equals(entry.getValue().getAttribute("accountNumber"))){
                return entry.getValue();
            }
        }
        return  null;
    }

    /************************webSocketSession*****************************/

    public synchronized void addSocketSession(WebSocketSession webSocketSession){
        if(webSocketSession != null){
            webSocketSessionMap.put(webSocketSession.getId(),webSocketSession);
        }
    }

    public synchronized void delSocketSession(WebSocketSession webSocketSession){
        if(webSocketSession != null){
            webSocketSessionMap.remove(webSocketSession.getId());
        }
    }

    public synchronized WebSocketSession getSocketSession(String id){
        return webSocketSessionMap.get(id);
    }

    public synchronized HashMap<String, WebSocketSession> getSocketSessionMap(){
        return webSocketSessionMap;
    }

    public synchronized int getSocketSessionCount(){
        return webSocketSessionMap.size();
    }
}
