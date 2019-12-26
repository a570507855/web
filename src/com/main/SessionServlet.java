package com.main;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionServlet extends HttpServlet {

    public void init(HttpServletRequest request, HttpServletResponse response){
        System.out.println("初始化");
    }

    public void service(HttpServletRequest request, HttpServletResponse response){
        System.out.println("接受请求");
    }

    public void destroy(HttpServletRequest request, HttpServletResponse response){
        System.out.println("销毁");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        System.out.println("*********************doget*********************");
        this.doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //创建 session的时机
        //首先 服务器调用request.getSession();
        //请求头里没有JsessionId     创建一个新的session 对象
        //请求头里有JsessionId    按照这个JsessionId去找对应的session对象
        //如果session对象没有失效   不创建新的session
        //如果session对象失效    创建新的session

        //什么叫一次会话    笼统回答 浏览器启动并且访问项目  到  关闭浏览器 .事实上，取决于JsessionID对应的session是否失效
        System.out.println("*********************dopost*********************");
        HttpSession session=request.getSession();
        session.setAttribute("name", "aaaaaaaa");
        session.setAttribute("value", "bbbbbbbbb");
//		session.setMaxInactiveInterval(10);
        //请求转发可以拿到
//		request.getRequestDispatcher("sessionServlet2").forward(request, response);
        //重定向也可以拿到
//		response.sendRedirect("sessionServlet2");

        //request    同一次请求
        //servletContext(application)  整个web的servlet都享用   从web启动  到web卸载
        //session    同一次会话
    }
}
