<%@ page import="org.apache.poi.ss.formula.functions.Count" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>游戏人生</title>
    <meta name="keywords" content="首页,许亦勇,码农">
    <meta name="description" content="首页,许亦勇的个人首页">
    <jsp:include page="/views/resources"/>
</head>
<body>
    <jsp:include page="/views/head"/>
    <div class="container">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- 指示符 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
                </div>
                <div class="carousel-item">
                    <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                </div>
                <div class="carousel-item">
                    <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
                </div>
            </div>
            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <div class="container">
        <div class="alert alert-success">
            <strong>成功!</strong> 指定操作成功提示信息。
        </div>
        <div class="alert alert-info">
            <strong>信息!</strong> 请注意这个信息。
        </div>
        <div class="alert alert-warning">
            <strong>警告!</strong> 设置警告信息。
        </div>
        <div class="alert alert-danger">
            <strong>错误!</strong> 失败的操作
        </div>
        <div class="alert alert-primary">
                <strong>首选!</strong> 这是一个重要的操作信息。
        </div>
        <div class="alert alert-secondary">
                <strong>次要的!</strong> 显示一些不重要的信息。
        </div>
        <div class="alert alert-dark">
                <strong>深灰色!</strong> 深灰色提示框。
        </div>
        <div class="alert alert-light">
                <strong>浅灰色!</strong>浅灰色提示框。
        </div>
    </div>
    <jsp:include page="/views/footer"/>
</body>
<script>
    $(document).ready(function () {
        
    })
</script>
</html>
