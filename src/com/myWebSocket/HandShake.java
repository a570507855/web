package com.myWebSocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * webSocket建立连接（握手）和断开的拦截器
 */
@Component
public class HandShake implements HandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        //这里进行一系列的健壮性判断 是否建立成功....
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest )request;
        HttpSession session = servletRequest.getServletRequest().getSession();
        attributes.put("sid", session.getId());
        attributes.put("username", session.getAttribute("username"));
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

    }
}
