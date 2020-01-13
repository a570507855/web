package com.myWebSocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Component
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurationSupport implements WebSocketConfigurer {

    @Autowired
    MyWebSocketHandler handler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(handler, "/ws").addInterceptors(new HandShake());
        registry.addHandler(handler, "/ws/sockjs").addInterceptors(new HandShake()).withSockJS();
    }
}
