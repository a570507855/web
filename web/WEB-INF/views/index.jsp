<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="个人,网页,许亦勇">
    <meta name="description" content="许亦勇个人网页">
<%--    <meta http-equiv="refresh" content="0.1;url=/views/login" />--%>
    <title>首页</title>
    <script src="/js/base.js"></script>
</head>
<body>
<div >
    <h1>设置cookie</h1>
    <p>document.cookie = "userName=许亦勇;password=disueb11"</p>
</div>
<div >
    <h1>获取cookie</h1>
    <p>document.cookie 获得以分号分割的键值对字符串</p>
</div>
<div >
    <h1>给cookie设置终止日期</h1>
    <p>document.cookie="userId=828; expires=GMT_String"</p>
</div>
<div >
    <h1>删除cookie</h1>
    <p>document.cookie="userId=828; expires=GMT_String" 将时间设置为过去时间便可删除cookie</p>
</div>
<div >
    <h1>指定可访问cookie的路径</h1>
    <p>document.cookie="userId=320; path=/shop"; 表示当前cookie仅能在shop目录下使用，path=/表示整个网站可用</p>
</div>
<div >
    <h1>指定可访问cookie的主机名</h1>
    <p>document.cookie="userId=320; domain=cookieDomain"; 表示当前cookie能在同一个域下的不同主机使用</p>
</div>
<div>
    <button type="button" class="layui-btn layui-btn-normal" id="export">导出</button>
</div>
</body>
</html>