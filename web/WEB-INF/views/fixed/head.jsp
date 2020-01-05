<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-md justify-content-between xyy-nav-head-bgColor">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/views/home">首页</a>
            </li>

            <% if("游戏人生".equals(session.getAttribute("username"))){%>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/tomcatSessions/tomcatSessions">会话管理</a>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/views/ceshi">测试</a>
            </li>
            </li>
            <% }%>
            <li class="nav-item xyy-drop-menu">
                <a class="xyy-nav-head-a xyy-hover-btn" href="javascript:void(0);">计算机语言</a>
                <div class="xyy-drop-content">
                    <a class="xyy-drop-a" href="#">c++</a>
                    <div class="xyy-drop-menu">
                        <a class="xyy-drop-a" href="javascript:void(0);">java</a>
                        <div class="xyy-drop-content xyy-drop-content-right">
                            <a class="xyy-drop-a" href="#">java</a>
                            <a class="xyy-drop-a" href="/views/jsp">jsp</a>
                        </div>
                    </div>
                    <div class="xyy-drop-menu">
                        <a class="xyy-drop-a" href="javascript:void(0);">前端</a>
                        <div class="xyy-drop-content xyy-drop-content-right">
                            <a class="xyy-drop-a" href="https://www.w3school.com.cn/tags/index.asp" target="_blank">HTML5 参考手册</a>
                            <a class="xyy-drop-a" href="https://www.runoob.com/bootstrap4/bootstrap4-tutorial.html" target="_blank">Bootstrap4 教程</a>
                            <a class="xyy-drop-a" href="#">javascript</a>
                        </div>
                    </div>
                    <div class="xyy-drop-menu">
                        <a class="xyy-drop-a" href="javascript:void(0);">python</a>
                        <div class="xyy-drop-content xyy-drop-content-right">
                            <a class="xyy-drop-a" href="https://www.runoob.com/python/python-tutorial.html" target="_blank">python 基础教程</a>
                            <a class="xyy-drop-a" href="https://2.python-requests.org//zh_CN/latest/user/quickstart.html" target="_blank">Requests库——模拟网络请求</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="nav-item xyy-drop-menu">
                <a class="xyy-nav-head-a" href="javascript:void(0);">设计模式</a>
                <div class="xyy-drop-content">
                    <a class="xyy-drop-a" href="https://www.runoob.com/design-pattern/design-pattern-tutorial.html" target="_blank">菜鸟教程</a>
                    <a class="xyy-drop-a" href="/designPattern/studyNotes">学习笔记</a>
                </div>
            </li>
            <li class="nav-item xyy-drop-menu">
                <a class="xyy-nav-head-a" href="javascript:void(0);">在线工具</a>
                <div class="xyy-drop-content">
                    <a class="xyy-drop-a" href="https://ps.gaoding.com/" target="_blank">在线PS</a>
                    <a class="xyy-drop-a" href="https://www.iconfont.cn/home/index?spm=a313x.7781069.1998910419.2" target="_blank">阿里巴巴图标库</a>
                </div>
            </li>
        </ul>
        <% if(session.getAttribute("username") == null) {%>
        <ul class="navbar-nav">
            <li class="nav-item">
                <span class="navbar-brand"><img src="/icon/account.svg"  class="rounded-circle" ></span>
            </li>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/views/login">登录</a>
            </li>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/views/register">注册</a>
            </li>
        </ul>
        <% } else {%>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="javascript:void(0);">${sessionScope.username}</a>
            </li>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/login/personalCenter">个人中心</a>
            </li>
            <li class="nav-item">
                <a class="xyy-nav-head-a" href="/login/quit">退出</a>
            </li>
        </ul>
        <% }%>
    </nav>