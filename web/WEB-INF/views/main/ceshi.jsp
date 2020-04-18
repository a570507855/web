<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html manifest="/manifest/index.manifest">
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>测试</title>
    <jsp:include page="/views/resources"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            border: 0;
        }
        #progress {
            width: 1000px;
            height: 35px;
            line-height: 35px;
            margin: 100px auto;
            position: relative;
        }

        .bar {
            width: 900px;
            height: 100%;
            background: #ccc;
            border-radius: 8px;
            position: relative;
        }

        .pro-value {
            position: absolute;
            right: 30px;
            top: 0;
        }

        .hang {
            width: 0;
            height: 100%;
            background: #f40;
            border-radius: 8px 0 0 8px;
        }

        span {
            width: 25px;
            height: 49px;
            background: #f40;
            position: absolute;
            left: 0;
            top: -7px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="/views/head"/>


</body>
<script>
    if(sessionStorage.pagecount){
        sessionStorage.pagecount = +sessionStorage.pagecount + 1;
    }
    else {
        sessionStorage.pagecount = 1;
    }

    if(localStorage.pagecount){
        localStorage.pagecount = +localStorage.pagecount + 1;
    }
    else {
        localStorage.pagecount = 1;
    }
    console.log(sessionStorage.pagecount);
    console.log(localStorage.pagecount);


</script>
<script>
    /*window.onload = function () {
        // 1. 获取页面标签
        var progress = document.getElementById('progress');
        var bar = progress.children[0];
        var hang = bar.children[0];
        var mask = bar.children[1];
        var proValue = progress.children[1];

        // 2. 监听鼠标拖拽事件
        mask.onmousedown = function (event) {
            var event = event || window.event;

            // 2.1 求出初始值
            var initial = event.clientX - mask.offsetLeft;

            document.onmousemove = function (event) {
                var event = event || window.event;

                // 2.2 求出走过的距离
                var distanceX = event.clientX - initial;

                // 2.3 处理边界值
                if (distanceX < 0) {
                    distanceX = 0;
                }
                else if (distanceX >= bar.offsetWidth - mask.offsetWidth) {
                    distanceX = bar.offsetWidth - mask.offsetWidth;
                }
                // 2.3 赋值给小按钮
                mask.style.left = distanceX + 'px';
                hang.style.width = distanceX + 'px';
                // 2.4 算出百分比
                proValue.innerHTML = parseInt(distanceX / (bar.offsetWidth - mask.offsetWidth) * 100) + '%';

                return false;

            }
            // 2.5 结束拖拽和移动事件
            document.onmouseup = function () {
                document.onmousemove = null;
                document.onmouseup = null;
            }
            return false;
        }
    }*/
</script>
<script>

</script>

</html>