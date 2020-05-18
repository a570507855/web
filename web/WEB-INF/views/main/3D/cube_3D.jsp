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
<div>
    <button type="button" id="translate3d">平移</button>
    <div>
        <input type="text"  id="rotateX_radian">
        <button type="button" id="rotateX">x轴旋转</button>
    </div>

</div>
<div class="content" >
    <canvas id="cube_3d" width="500" height="500"></canvas>
</div>

</body>
<script>
    let cube_3d = document.getElementById("cube_3d");
    let ctx = cube_3d.getContext("2d");
    let translate3d_btn = document.getElementById("translate3d");
    let rotateX_btn = document.getElementById("rotateX");
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
        translate3d:function (x,y,z) {
            this.point_center.x +=x;
            this.point_center.y +=y;
            this.point_center.z +=z;

            this.point_back_leftTop.x +=x;
            this.point_back_leftTop.y +=y;
            this.point_back_leftTop.z +=z;

            this.point_back_rightTop.x +=x;
            this.point_back_rightTop.y +=y;
            this.point_back_rightTop.z +=z;

            this.point_back_leftBottom.x +=x;
            this.point_back_leftBottom.y +=y;
            this.point_back_leftBottom.z +=z;

            this.point_back_rightBottom.x +=x;
            this.point_back_rightBottom.y +=y;
            this.point_back_rightBottom.z +=z;
        },
        rotateX:function (angle) {
            let radian = angle * (Math.PI / 180);
            this.point_back_leftTop.y = this.point_back_leftTop.y * Math.cos(radian) - this.point_back_leftTop.y * Math.sin(radian);
            this.point_back_leftTop.z = this.point_back_leftTop.z * Math.sin(radian) + this.point_back_leftTop.z * Math.cos(radian);

            this.point_back_rightTop.y = this.point_back_rightTop.y * Math.cos(radian) - this.point_back_rightTop.y * Math.sin(radian);
            this.point_back_rightTop.z = this.point_back_rightTop.z * Math.sin(radian) + this.point_back_rightTop.z * Math.cos(radian);

            this.point_back_leftBottom.y = this.point_back_leftBottom.y * Math.cos(radian) - this.point_back_leftBottom.y * Math.sin(radian);
            this.point_back_leftBottom.z = this.point_back_leftBottom.z * Math.sin(radian) + this.point_back_leftBottom.z * Math.cos(radian);

            this.point_back_rightBottom.y = this.point_back_rightBottom.y * Math.cos(radian) - this.point_back_rightBottom.y * Math.sin(radian);
            this.point_back_rightBottom.z = this.point_back_rightBottom.z * Math.sin(radian) + this.point_back_rightBottom.z * Math.cos(radian);
        },
        rotateY:function (radian) {

        },
        rotateZ:function (radian) {

        }
    };
    ctx.fillStyle = "rgba(0,0,0,1)";
    let i = 0;
    ctx.beginPath();
    ctx.moveTo(200,200);
    setInterval(function () {
        ++i;
        ctx.lineTo(200 + Math.sin(i * (Math.PI / 180)) * 200,200 + Math.cos(i * (Math.PI / 180)) * 200);
        ctx.fill();
    },200)
    ctx.closePath();



    function drawBG() {
       /* ctx.fillStyle = "rgba(0,0,0,1)";
        ctx.fillRect(0,0,cube_3d.clientWidth,cube_3d.clientHeight);*/
    }

    function clear(){
        ctx.clearRect(0,0,500,500);
    }

    translate3d_btn.addEventListener("click", function () {
        cube_point.translate3d(50,50,50);
        clear();
        ctx.fillStyle = "rgba(0,0,0,1)";
        ctx.beginPath();
        ctx.moveTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
        ctx.lineTo(cube_point.point_back_rightTop.x,cube_point.point_back_rightTop.y);
        ctx.lineTo(cube_point.point_back_rightBottom.x,cube_point.point_back_rightBottom.y);
        ctx.lineTo(cube_point.point_back_leftBottom.x,cube_point.point_back_leftBottom.y);
        ctx.lineTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
        ctx.closePath();
        ctx.fill();
    })

    rotateX_btn.addEventListener("click", function () {
        let rotateX_radian = document.getElementById("rotateX_radian");
        let radian = rotateX_radian.value;
        cube_point.rotateX(radian);
        console.log(cube_point)
        clear();
        ctx.fillStyle = "rgba(0,0,0,1)";
        ctx.beginPath();
        ctx.moveTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
        ctx.lineTo(cube_point.point_back_rightTop.x,cube_point.point_back_rightTop.y);
        ctx.lineTo(cube_point.point_back_rightBottom.x,cube_point.point_back_rightBottom.y);
        ctx.lineTo(cube_point.point_back_leftBottom.x,cube_point.point_back_leftBottom.y);
        ctx.lineTo(cube_point.point_back_leftTop.x,cube_point.point_back_leftTop.y);
        ctx.closePath();
        ctx.fill();
    })

</script>
</html>
