package com.myWebSocket;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/***
 * webSocket处理器
 */
@Component
public class MyWebSocketHandler implements WebSocketHandler {

    /*private MySessionContext users = MySessionContext.getInstance();*/

    private List<WebSocketSession> user2 = new ArrayList<>();

/*    private HashMap<String, WebSocketSession> userMap = new HashMap<String, WebSocketSession>();*/

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //TODO 建立连接后要干的事
        user2.add(session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        //TODO 消息处理
        if(session.isOpen()){
            String username = session.getAttributes().get("username").toString();
            String text = message.getPayload().toString();
            Map<String,String> map = (Map<String, String>)JSONObject.parse(text);
            if("join".equals(map.get("cmd"))){
                map.replace("cmd", "online");
                TextMessage msg = new TextMessage(map.toString());
                session.sendMessage(msg);
            }
            else if("chat".equals(map.get("cmd"))) {
                map.put("username", username);
                TextMessage msg = new TextMessage(map.toString());
                sendMessageToUsers(msg);
            }
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
        user2.remove(session);
        //users.delSocketSession(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /***
     * 可以用作发送广播，托送消息
     * @param msg
     * @throws IOException
     */
    public void sendMessageToUsers(TextMessage msg) throws IOException {
        for(WebSocketSession user : user2){
            if(user.isOpen())
                user.sendMessage(msg);
        }
    }

    public void sendMessageToUser(){


    }
}
