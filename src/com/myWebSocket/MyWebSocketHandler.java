package com.myWebSocket;

import com.MySessionContext;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.HashMap;

/***
 * webSocket处理器
 */
@Component
public class MyWebSocketHandler implements WebSocketHandler {

    private MySessionContext users = MySessionContext.getInstance();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //TODO 建立连接后要干的事
        System.out.println(session);
        users.addSocketSession(session);
        System.out.println(session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        //TODO 消息处理
        System.out.println(session.getAttributes());
        System.out.println(message.getPayload());
        System.out.println(session.getId());
        if(session.isOpen()){
            session.sendMessage(message);
        }
        else{
            System.out.println("不在线");
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        //TODO 错误信息的处理
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        //TODO 关闭连接后要干的事
        //users.delSocketSession(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    public void sendMessageToUsers(TextMessage msg) throws IOException {
        for(HashMap.Entry<String, WebSocketSession> entry : users.getSocketSessionMap().entrySet()){
            entry.getValue().sendMessage(msg);
        }
        //session.sendMessage();
    }

    public void sendMessageToUser(){

    }
}
