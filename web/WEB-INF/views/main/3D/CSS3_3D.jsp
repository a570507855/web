<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta type="text/html">
    <title>3D</title>
    <jsp:include page="/views/resources"/>
    <style>
        .content{
            width: 100%;
            height: 800px;
            border: 1px solid grey;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            background-color: black;
        }
        .shadow-box{
            width: 200px;
            height: 150px;
            margin: 10px;
            border-radius: 10px;
            box-shadow:1px 1px 5px #b3b3b3,
            -1px 1px 5px #b3b3b3,
            -1px -1px 5px #b3b3b3,
            1px -1px 5px #b3b3b3;
        }
        .box{
            position: absolute;
            width: 120px;
            height: 120px;
            border: 1px solid #ccc;
            background: rgba(255,255,255,0.8);
            box-shadow: inset 0 0 20px rgba(0,0,0,0.2);
            line-height: 120px;
            text-align: center;
            color: #333;
            font-size: 100px;
            user-select:none;
        }
        .box_one{
            transform: translateZ(60px);
        }
        .box_two{
            transform: rotateY(-90deg) translateZ(60px);
        }
        .box_three{
            transform: rotateX(90deg) translateZ(60px);
        }
        .box_four{
            transform: rotateY(90deg) translateZ(60px);
        }
        .box_five{
            transform: rotateX(-90deg) translateZ(60px) ;
        }
        .box_six{
            transform: rotateY(180deg) translateZ(60px) ;
        }
        .six-box{
            position: relative;
            /*perspective: 1200px;*/
            perspective-origin: center;
            transform-style: preserve-3d;
            width: 120px;
            height: 120px;
        }
        .circle{
            position: relative;
            width: 300px;
            height: 300px;
            display: inline-block;
            margin: 20px;
            perspective-origin: 50% 50%;
            transform-style: preserve-3d;
           /* transform: rotate3d(1,1,0,45deg);*/
            animation: mymove 10s linear infinite;
        }
        .circle-z{
            border-radius: 50%;
            border: 1px solid #FF0099;
            height: 300px;
            width: 300px;
            position: absolute;
        }
        .circle-z-one{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform: translateZ(-90px);
        }
        .circle-z-three{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform: translateZ(90px);
        }

        .circle-x{
            border-radius: 50%;
            border: 1px solid #0099FF;
            height: 300px;
            width: 300px;
            position: absolute;
        }

        .circle-x-one{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform: translateY(90px) rotateX(90deg);
        }
        .circle-x-two{
            transform: rotateX(90deg);
        }
        .circle-x-three{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform:translateY(-90px) rotateX(90deg);
        }

        .circle-y{
            border-radius: 50%;
            border: 1px solid #FFCC33;
            height: 300px;
            width: 300px;
            position: absolute;
        }

        .circle-y-one{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform: translateX(90px) rotateY(90deg);
        }
        .circle-y-two{
            transform: rotateY(90deg);
        }
        .circle-y-three{
            top: 10%;
            left: 10%;
            height: 240px;
            width: 240px;
            transform:translateX(-90px) rotateY(90deg);
        }

        @-webkit-keyframes mymove
        {
            100% { -webkit-transform:  rotateX(360deg) rotateY(180deg) }
        }
        @-moz-keyframes mymove
        {
            100% { -moz-transform:  rotateX(360deg) rotateY(360deg) }
        }
        @-ms-keyframes mymove
        {
            100% { -ms-transform:  rotateX(360deg) rotateY(360deg) }
        }
        @keyframes mymove
        {
            100% { transform:  rotateX(360deg) rotateY(360deg) }
        }
    </style>
</head>
<body  id="body">
<jsp:include page="/views/head"/>
<div class="content" >
    <div style="display: flex;flex-direction: row;justify-content: space-around">
        <div class="shadow-box" id="2d">
            translate
        </div>
        <div class="shadow-box">
            3D旋转
        </div>
        <div class="six-box" style="text-align: center;" id="3d">
            <div class="box box_one">1</div>
            <div class="box box_two">2</div>
            <div class="box box_three">3</div>
            <div class="box box_four">4</div>
            <div class="box box_five">5</div>
            <div class="box box_six">6</div>
        </div>
    </div>
    <div>
        <div class="circle">
            <div class="circle-z-one circle-z"></div>
            <div class="circle-z-two circle-z"></div>
            <div class="circle-z-three circle-z"></div>

            <div class="circle-x-one circle-x"></div>
            <div class="circle-x-two circle-x"></div>
            <div class="circle-x-three circle-x"></div>

            <div class="circle-y-one circle-y"></div>
            <div class="circle-y-two circle-y"></div>
            <div class="circle-y-three circle-y"></div>
        </div>
    </div>

</div>

</body>
<script>
    let transform_translate = document.getElementById("2d");
    let transform_rotate3d = document.getElementById("3d");
    let body = document.getElementById("body")
    let is_translate_down = false;
    let is_rotate3d_down = false;
    let pre_point={
        x:-1,
        y:-1,
        rotateX:0,
        rotateY:0
    }

    let pre_rotate_point = {
        pre_x: 0,
        pre_y: 0,
        rotateX: 0,
        rotateY: 0
    };

    transform_translate.addEventListener("mousedown", function (ev) {
        is_translate_down = true;
        pre_point = {
            x:ev.pageX,
            y:ev.pageY,
            offsetLeft:ev.pageX - ev.offsetX - transform_translate.offsetLeft,
            offsetTop:ev.pageY - ev.offsetY - transform_translate.offsetTop
        }
    });
    transform_translate.addEventListener("mouseup", function (ev) {
        is_translate_down = false;
    });

    transform_translate.addEventListener("mousemove", function (ev) {
        if(is_translate_down){
            let x = ev.pageX-pre_point.x + pre_point.offsetLeft;
            let y = ev.pageY-pre_point.y + pre_point.offsetTop;
            transform_translate.style = "transform:translate("+x+"px,"+y+"px);"
        }
    });

    /***
     * 3D旋转
     */
    transform_rotate3d.addEventListener("mousedown", function (ev) {
        is_rotate3d_down = true;
        pre_rotate_point.pre_x = ev.pageX;
        pre_rotate_point.pre_y = ev.pageY;
    });
    body.addEventListener("mouseup", function (ev) {
        if(is_rotate3d_down){
            is_rotate3d_down = false;
        }
    });

    body.addEventListener("mousemove", function (ev) {
        if(is_rotate3d_down){
            console.log(pre_rotate_point)
            let x = ev.pageX - pre_rotate_point.pre_x;
            let y = pre_rotate_point.pre_y - ev.pageY;
            pre_rotate_point.pre_x = ev.pageX;
            pre_rotate_point.pre_y = ev.pageY;
            transform_rotate3d.style = "transform:rotateX("+ (+pre_rotate_point.rotateY+y)+"deg) rotateY("+ (+pre_rotate_point.rotateX+x)+"deg);"
            pre_rotate_point.rotateX = +pre_rotate_point.rotateX+x;
            pre_rotate_point.rotateY = +pre_rotate_point.rotateY+y;
        }
    });

</script>
</html>
