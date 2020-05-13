<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta type="text/html">
    <title>cube_3D</title>
    <jsp:include page="/views/resources"/>
    <style>
        .content{
            text-align: center;
        }
    </style>
</head>
<body  id="body" onload="drawBG()">
<jsp:include page="/views/head"/>
<div class="content" >
    <canvas id="cube_3d" width="500" height="500"></canvas>
</div>

</body>
<script>
    let cube_3d = document.getElementById("cube_3d");
    let ctx = cube_3d.getContext("2d");
    function point(x,y,z) {
       this.x = x;
       this.y = y;
       this.z = z;
    }
    let cube_point = {
        point_center:new point(250,250,0),
        point_back_leftTop:new point(200,200,-50),
        point_back_rightTop:new point(300,200,-50),
        point_back_leftBottom:new point(200,300,-50),
        point_back_rightBottom:new point(300,300,-50),
    };
    ctx.fillStyle = "rgba(0,0,0,1)";
    ctx.beginPath();
    ctx.moveTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
    ctx.lineTo(cube_point.point_back_rightTop.x,cube_point.point_back_rightTop.y);
    ctx.lineTo(cube_point.point_back_rightBottom.x,cube_point.point_back_rightBottom.y);
    ctx.lineTo(cube_point.point_back_leftBottom.x,cube_point.point_back_leftBottom.y);
    ctx.lineTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
    ctx.closePath();
    ctx.fill();


    function drawBG() {
       /* ctx.fillStyle = "rgba(0,0,0,1)";
        ctx.fillRect(0,0,cube_3d.clientWidth,cube_3d.clientHeight);*/
    }
</script>
</html>
