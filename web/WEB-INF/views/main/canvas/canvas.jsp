<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta type="text/html">
    <title>测试</title>
    <jsp:include page="/views/resources"/>
    <style>
        .content{
            width: 100%;
            height: 800px;
            border: 1px solid grey;
            text-align: center;
        }

    </style>
</head>
<body onload="draw()">
<jsp:include page="/views/head"/>
<div class="content">
   <canvas id="canvas" width="500" height="500"></canvas>
</div>
</body>
<script>
/*    // canvas坐标系为：左上角为起点(0,0)，x轴向右，y轴向下递增
    let canvas = document.querySelector("canvas");
    if(canvas.getContext){
        // 返回canvas的上下文，没有定义则返回null
        // contextType：2d   webgl1  webgl2
        // contextAttributes:用于设置属性    https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLCanvasElement/getContext
        let canvas_2d = canvas.getContext("2d");

    }
    else {
        alert("浏览器不支持canvas")
    }*/
function draw() {
    var ctx = document.getElementById('canvas').getContext('2d');

    ctx.fillRect(0,0,150,150);   // 使用默认设置绘制一个矩形
    ctx.save();                  // 保存默认状态

    ctx.fillStyle = '#09F'       // 在原有配置基础上对颜色做改变
    ctx.fillRect(15,15,120,120); // 使用新的设置绘制一个矩形

    ctx.save();                  // 保存当前状态
    ctx.fillStyle = '#FFF'       // 再次改变颜色配置
    ctx.globalAlpha = 0.5;
    ctx.fillRect(30,30,90,90);   // 使用新的配置绘制一个矩形

    ctx.restore();               // 重新加载之前的颜色状态
    ctx.fillRect(45,45,60,60);   // 使用上一次的配置绘制一个矩形

    ctx.restore();               // 加载默认颜色配置
    ctx.fillRect(60,60,30,30);   // 使用加载的配置绘制一个矩形
}

</script>
</html>
