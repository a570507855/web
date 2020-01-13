<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>标题</title>
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

<div id="progress">
    <div class="bar">
        <div class="hang"></div>
        <span></span>
    </div>
    <div class="pro-value">0%</div>
</div>

</body>
<script>
    //创建XMLHttpRequest对象
        var xhr = new XMLHttpRequest();
        //配置请求方式、请求地址以及是否同步
        xhr.open('POST', '/ceshi/video', true);
        //设置请求结果类型为blob
        xhr.responseType = 'blob';
        //xhr.responseType = 'arraybuffer'
        xhr.setRequestHeader("Range","bytes=0-54902995");
        //请求成功回调函数
        xhr.onload = function(e) {
            if (this.status == 200) {//请求成功
                //获取blob对象
                var blob = this.response;
                console.log(blob)
                //获取blob对象地址，并把值赋给容器
                $("#video").attr("src", URL.createObjectURL(blob));
            }
        };
        xhr.send();
/*    var isSupportMediaSource = 'MediaSource' in window
    if(isSupportMediaSource){
        console.log("浏览器支持流媒体")
    }
    else{
        console.log("浏览器不支持流媒体")
    }

    var mediaSource = new MediaSource()
    var video = document.querySelector('video')
    video.src = URL.createObjectURL(mediaSource)

    mediaSource.addEventListener("sourceopen",function (ev) {
        // 这个奇怪的字符串后面再解释
        var mime = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"'

        // 新建一个 sourceBuffer
        var sourceBuffer = mediaSource.addSourceBuffer(mime);
        console.log(mediaSource.readyState)
        fetchBuffer('/video/video.mp4', function (buffer) {
            console.log(buffer)
            sourceBuffer.addEventListener('updateend', function (_) {
                console.log(sourceBuffer.updating)
                console.log(mediaSource.readyState)
                if (!sourceBuffer.updating && mediaSource.readyState === 'open') {
                    mediaSource.endOfStream();
                    video.play();
                }

                //console.log(mediaSource.readyState); // ended
            });
            sourceBuffer.appendBuffer(buffer);

        })
    })

    // 以二进制格式请求某个url
    function fetchBuffer (url, callback) {
        var xhr = new XMLHttpRequest;
        xhr.open('get', url);
        xhr.responseType = 'blob';
        xhr.onload = function () {
            callback(xhr.response);
        };
        xhr.send();
    }*/

</script>
<script>
    window.onload = function () {
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
    }
</script>
<script>

</script>

</html>