<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-md  justify-content-between">
        <ul class="navbar-nav">
            <li class="nav-item">
                <span class="navbar-brand"><img src="/img/nav.svg">导航</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/views/home">首页</a>
            </li>
            <% if("游戏人生".equals(session.getAttribute("username"))){%>
            <li class="nav-item">
                <a class="nav-link" href="/tomcatSessions/tomcatSessions">会话管理</a>
            </li>
            <% }%>


            <li class="nav-item xyy-drop-menu">
                    <a class="nav-link xyy-hover-btn" href="#">计算机语言</a>
                    <div class="xyy-drop-content">
                        <a class="xyy-drop-a" href="#">c++</a>
                        <a class="xyy-drop-a" href="#">java</a>
                        <a class="xyy-drop-a" href="#">jsp</a>
                        <div class="xyy-drop-menu">
                            <a class="xyy-drop-a" href="#">前端</a>
                            <div class="xyy-drop-content xyy-drop-content-right">
                                <a class="xyy-drop-a" href="#">c++</a>
                                <a class="xyy-drop-a" href="#">java</a>
                                <a class="xyy-drop-a" href="#">jsp</a>
                                <a class="xyy-drop-a" href="#">前端</a>
                            </div>
                        </div>
                    </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">java</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/views/jsp">jsp</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">前端</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="https://www.w3school.com.cn/tags/index.asp" target="_blank">HTML5 参考手册</a>
                    <a class="dropdown-item" href="https://www.runoob.com/bootstrap4/bootstrap4-tutorial.html" target="_blank">Bootstrap4 教程</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">python</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="https://www.runoob.com/python/python-tutorial.html" target="_blank">python 基础教程</a>
                    <a class="dropdown-item" href="https://2.python-requests.org//zh_CN/latest/user/quickstart.html" target="_blank">Requests库——模拟网络请求</a>
                    <a class="dropdown-item" href="https://2.python-requests.org//zh_CN/latest/user/quickstart.html" target="_blank">Requests库——模拟网络请求</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown">在线工具</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="https://ps.gaoding.com/" target="_blank">在线PS</a>
                </div>
            </li>
        </ul>
        <% if(session.getAttribute("username") == null) {%>
        <ul class="navbar-nav">
            <li class="nav-item">
                <span class="navbar-brand"><img src="/icon/account.svg"  class="rounded-circle" ></span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/views/login">登录</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/views/register">注册</a>
            </li>
        </ul>
        <% } else {%>
        <ul class="navbar-nav">
            <li class="nav-item">
                <span class="navbar-brand"><img src="/icon/account.svg"  class="rounded-circle" ></span>
            </li>
            <li class="nav-item">
                <span class="navbar-brand">${sessionScope.username}</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/personalCenter">个人中心</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login/quit">退出</a>
            </li>
        </ul>
        <% }%>
    </nav>