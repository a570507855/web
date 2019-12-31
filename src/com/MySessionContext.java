package com;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

//运用了单例模式--该类负责创建自己的对象，同时确保只有单个对象被创建
public class MySessionContext {

    private static MySessionContext instance;

    private HashMap<String, HttpSession> map;

    //构造函数为私有
    private MySessionContext(){
        map = new HashMap<String, HttpSession>();
    }

    public static MySessionContext getInstance(){
        if(instance == null){
            instance = new MySessionContext();
        }
        return instance;
    }

    public synchronized void addSession(HttpSession session){
        if(session != null){
            map.put(session.getId(),session);
        }
    }

    public synchronized void delSession(HttpSession session){
        if(session != null){
            map.remove(session.getId());
        }
    }

    public synchronized HttpSession getSession(String sessionId){
        return map.get(sessionId);
    }

    public synchronized HashMap<String, HttpSession> getMap(){
        return map;
    }

    public synchronized HttpSession isOnline(String accountNumber){
        for(HashMap.Entry<String, HttpSession> entry :map.entrySet()){
            if(accountNumber.equals(entry.getValue().getAttribute("accountNumber"))){
                return entry.getValue();
            }
        }
        return null;
    }
}
