<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>jsp学习笔记</title>
    <jsp:include page="/views/resources"/>
</head>
<body>
    <jsp:include page="/views/head"/>
    <%
        System.out.println(session.getMaxInactiveInterval());
        session.setMaxInactiveInterval(60*60*24);
        System.out.println(session.getId());
        System.out.println(session.getAttribute("username"));
    %>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h2>jsp简介</h2>
                <p>JSP全称Java Server Pages，是一种动态网页开发技术。它使用JSP标签在HTML网页中插入Java代码。标签通常以&lt;%开头以%&gt;结束。
                    JSP是一种Java servlet，主要用于实现Java web应用程序的用户界面部分。网页开发者们通过结合HTML代码、XHTML代码、XML元素以及嵌入JSP操作和命令来编写JSP。
                    JSP通过网页表单获取用户输入数据、访问数据库及其他数据源，然后动态地创建网页。
                    JSP标签有多种功能，比如访问数据库、记录用户选择信息、访问JavaBeans组件等，还可以在不同的网页中传递控制信息和共享信息。</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h2>jsp语法</h2><br>
                <h4>脚本程序</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;% 代码片段 %&gt;
                    </code>
                </div>

                <h4>jsp声明</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;%! int i = 0; %&gt;
                    </code>
                </div>

                <h4>jsp表达式</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;%= 表达式 %&gt;
                    </code>
                </div>

                <h4>jsp注释</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;%-- 注释内容 --%&gt;
                    </code>
                </div>

                <h4>jsp指令</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;%@ directive attribute="value"%&gt;
                    </code>
                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th>指令</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>&lt;%@ page.... %&gt;</td>
                            <td>定义页面的依赖属性，比如脚本语言、error页面、缓存需求等等</td>
                        </tr>
                        <tr>
                            <td>&lt;%@ include.... %&gt;</td>
                            <td>包含其他文件</td>
                        </tr>
                        <tr>
                            <td>&lt;%@ taglib.... %&gt;</td>
                            <td>引入标签库的定义，可以是自定义标签</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h4>jsp行为</h4>
                <P>语法格式：</P>
                <div class="alert alert-dark">
                    <code>
                        &lt;jsp:action_name attribute="value"&gt;
                    </code>
                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th>语法</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>jsp:include</td>
                            <td>用于在当前页面中包含静态或动态资源</td>
                        </tr>
                        <tr>
                            <td>jsp:useBean</td>
                            <td>寻找和初始化一个JavaBean组件</td>
                        </tr>
                        <tr>
                            <td>jsp:setProperty</td>
                            <td>设置 JavaBean组件的值</td>
                        </tr>
                        <tr>
                            <td>jsp:getProperty</td>
                            <td>将 JavaBean组件的值插入到 output中</td>
                        </tr>
                        <tr>
                            <td>jsp:forward</td>
                            <td>从一个JSP文件向另一个文件传递一个包含用户请求的request对象</td>
                        </tr>
                        <tr>
                            <td>jsp:plugin</td>
                            <td>用于在生成的HTML页面中包含Applet和JavaBean对象</td>
                        </tr>
                        <tr>
                            <td>jsp:element</td>
                            <td>动态创建一个XML元素</td>
                        </tr>
                        <tr>
                            <td>jsp:attribute</td>
                            <td>定义动态创建的XML元素的属性</td>
                        </tr>
                        <tr>
                            <td>jsp:text</td>
                            <td>用于封装模板数据</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h4>jsp隐含对象</h4>
                <div class="alert alert-dark">
                    <code>
                        &lt;%@ directive attribute="value"%&gt;
                    </code>
                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th>对象</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>request</td>
                            <td>HttpServletRequest类的实例</td>
                        </tr>
                        <tr>
                            <td>response</td>
                            <td>HttpServletResponse类的实例</td>
                        </tr>
                        <tr>
                            <td>out</td>
                            <td>PrintWriter类的实例，用于把结果输出至网页上</td>
                        </tr>
                        <tr>
                            <td>session</td>
                            <td>HttpSession类的实例</td>
                        </tr>
                        <tr>
                            <td>application</td>
                            <td>ServletContext类的实例，与应用上下文有关(实现多客户间的数据共享，生命周期：服务器启动到关闭,一个web项目对应一个application)</td>
                        </tr>
                        <tr>
                            <td>config</td>
                            <td>ServletConfig类的实例</td>
                        </tr>
                        <tr>
                            <td>pageContext</td>
                            <td>PageContext类的实例，提供对JSP页面所有对象以及命名空间的访问</td>
                        </tr>
                        <tr>
                            <td>page</td>
                            <td>类似于Java类中的this关键字</td>
                        </tr>
                        <tr>
                            <td>Exception</td>
                            <td>Exception类的对象，代表发生错误的JSP页面中对应的异常对象</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h2>控制流语句</h2>
                <p>语法格式(同java)：</p>
                <div class="alert alert-dark">
                    <h3>判断语句——<small>if....else</small></h3>
                    <pre>
                        &lt;% if( day == 0 || day == 6) { %&gt;
                            &lt;p&gt;今天是周末&lt;/p&gt;
                        &lt;% } else { %&gt;
                            &lt;p&gt;今天不是是周末&lt;/p&gt;
                        &lt;% } %&gt;
                    </pre>
                    <h3>判断语句——<small>switch....case</small></h3>
                    <pre>
                        &lt;%
                            switch(day){
                            case '0':
                                out.println("星期天");
                                break;
                            case '1':
                                out.println("星期一");
                                break;
                            case '2':
                                out.println("星期二");
                                break;
                            case '3':
                                out.println("星期三");
                                break;
                            case '4':
                                out.println("星期四");
                                break;
                            case '5':
                                out.println("星期五");
                                break;
                            default:
                                out.println("星期天");
                            }
                        %&gt;
                    </pre>
                    <h3>循环语句——<small>for</small></h3>
                    <pre>
                        &lt;% for(int i = 0;i != 3; ++i ){ %&gt;
                            out.println(i);
                        &lt;% } %&gt;
                    </pre>
                    <h3>循环语句——<small>while</small></h3>
                    <pre>
                        &lt;% while(true){ %&gt;
                            out.println("hello world");
                        &lt;% } %&gt;
                    </pre>
                </div>
            </div>
        </div>
        <%!
            private int initVar=0;
            private int serviceVar=0;
            private int destroyVar=0;
            public void jspInit(){
                initVar++;
                System.out.println("jspInit(): JSP被初始化了"+initVar+"次");
            }
            public void jspDestroy(){
                destroyVar++;
                System.out.println("jspDestroy(): JSP被销毁了"+destroyVar+"次");
            }
        %>
        <%
            serviceVar++;
            System.out.println("_jspService(): JSP共响应了"+serviceVar+"次请求");

            String content1="初始化次数 : "+initVar;
            String content2="响应客户请求次数 : "+serviceVar;
            String content3="销毁次数 : "+destroyVar;
        %>
        <h1>菜鸟教程 JSP 测试实例</h1>
        <p><%=content1 %></p>
        <p><%=content2 %></p>
        <p><%=content3 %></p>
    </div>
    <input>
    <jsp:include page="/views/footer"/>
    <script>
        $(document).ready(function () {
            console.log(getCookie())
            //delCookie("sid=15259207770")
        })
    </script>
</body>
</html>
<%--4CBA9F18CB7D1FBDB61A47FD71AD007D--%>
<%--g5v7l70mn0cvs43pped9na09gh--%>