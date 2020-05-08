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
<body onload="init()">
<jsp:include page="/views/head"/>
<div class="content">
    <canvas id="canvas" width="700" height="700" style="border: 1px solid grey;margin-top: 50px;"></canvas>
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
    let food = {
        x:15,
        y:15
    };
    let snake = {
        head:{x:10, y:10},
        body:[{x:9,y:10}],
        direction:"right",
        play:true,
        speed:100
    };
    let body = document.querySelector("body");
    let ctx = document.getElementById('canvas').getContext('2d');
    body.addEventListener("keydown", function (ev) {
        switch (ev.key) {
            case "w":
            case "W":
                snake.direction = "up";
                break;
            case "a":
            case "A":
                snake.direction = "left";
                break;
            case "s":
            case "S":
                snake.direction = "down";
                break;
            case "d":
            case "D":
                snake.direction = "right";
                break;
            case " ":
                snake.play = !snake.play;
                break;
        }
    });
    function drawMap() {
        let map = [];
        for (let i = 0; i !== 28;++i){
            for(let j = 0; j !== 28;++j){
                if(typeof map[i] === "undefined"){
                    map[i] = [];
                }
                //墙
                if(i === 0 || j ===0 || i ===27 || j === 27){
                    map[i][j] = 1;
                    ctx.fillStyle = "black";
                    ctx.fillRect(i*25,j*25,25,25);
                }
                else {
                    map[i][j] = 0;
                    ctx.fillStyle = "#dedede";
                    ctx.fillRect(i*25,j*25,25,25);
                }
            }
        }

    }

    function drawSnack(snake) {
        let snake_head = snake.head;
        let snake_body = snake.body;
        ctx.fillStyle = "red";
        ctx.fillRect(snake_head.x*25,snake_head.y*25,25,25);
        for(let i = 0; i !== snake_body.length;++i){
            ctx.fillRect(snake_body[i].x*25,snake_body[i].y*25,25,25);
        }
    }

    function drawFood(food) {
        ctx.beginPath();
        ctx.moveTo(food.x*25+12,food.y*25+12);
        ctx.fillStyle = "green";
        ctx.arc(food.x*25+12,food.y*25+12,12,0,2*Math.PI);
        ctx.fill();
        ctx.closePath();
    }
    
    function move(snake,food) {
        let add_term = {
            x:0,
            y:0
        };
        switch (snake.direction) {
            case "up":
                clear(snake);
                copyPoint(add_term,snake);
                snake.head.y -= 1;
                if(isFood(snake,food)){
                    snake.body.push(add_term);
                    getFood(snake,food);
                }
                isWall(snake);
                drawSnack(snake);
                break;
            case "down":
                clear(snake);
                copyPoint(add_term,snake);
                snake.head.y += 1;
                if(isFood(snake,food)){
                    snake.body.push(add_term);
                    getFood(snake,food);
                }
                isWall(snake);
                drawSnack(snake);
                break;
            case "left":
                clear(snake);
                copyPoint(add_term,snake);
                snake.head.x -= 1;
                if(isFood(snake,food)){
                    snake.body.push(add_term);
                    getFood(snake,food);
                }
                isWall(snake);
                drawSnack(snake);
                break;
            case "right":
                clear(snake);
                copyPoint(add_term,snake);
                snake.head.x += 1;
                if(isFood(snake,food)){
                    snake.body.push(add_term);
                    getFood(snake,food);
                }
                isWall(snake);
                drawSnack(snake);
                break;

        }
    }

    function copyPoint(add_term,snake) {
        add_term.x = snake.body[snake.body.length - 1].x;
        add_term.y = snake.body[snake.body.length - 1].y;
        for (let i = snake.body.length - 1 ;i !== 0;--i){
            snake.body[i].x = snake.body[i - 1].x;
            snake.body[i].y = snake.body[i - 1].y;
        }
        snake.body[0].x = snake.head.x;
        snake.body[0].y = snake.head.y;
    }

    function clear(snake) {
        let snake_head = snake.head;
        let snake_body = snake.body;
        ctx.fillStyle = "#dedede";
        ctx.fillRect(snake_head.x*25,snake_head.y*25,25,25);
        for(let i = 0; i !== snake_body.length;++i){
            ctx.fillRect(snake_body[i].x*25,snake_body[i].y*25,25,25);
        }
    }

    function isWall(snake) {
        if(snake.head.x === 0 || snake.head.x === 27 || snake.head.y === 0 || snake.head.y === 27){
            snake.play = false;
            ctx.fillStyle = "blue";
            ctx.fillRect(snake.head.x*25, snake.head.y*25, 25,25);
            setTimeout(function () {
                ctx.fillStyle = "green";
                ctx.fillRect(snake.head.x*25, snake.head.y*25, 25,25);
            },200)
        }
    }

    function isFood(snake,food) {
        return snake.head.x === food.x && snake.head.y === food.y
    }

    function getFood(snake,food) {
        let random_x = null;
        let random_y = null;
        let x = 0;
        let y = 0;
        let isOk = false;
        while (!isOk){
            isOk = true;
            random_x = Math.random();
            random_y = Math.random();
            x = Math.round(random_x * 27);
            y = Math.round(random_y * 27);
            if(x === 0 || x === 27 || y === 0 || y === 27 ||(x === snake.head.x && y === snake.head.y)){
                isOk = false;
            }
            else {
                for(let i = 0;i !== snake.body.length;++i){
                    if(x === snake.body[i].x && y === snake.body[i].y){
                        isOk = false;
                    }
                }
            }
        }
        food.x = x;
        food.y = y;
        drawFood(food);
    }

    function play() {
        setInterval(function () {
            if(snake.play){
                move(snake,food);
            }
        },snake.speed)
    }

    function init() {
        drawMap();
        drawFood(food);
        drawSnack(snake);
        play();
    }
    
</script>
</html>
