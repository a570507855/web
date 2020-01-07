<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>标题</title>
    <jsp:include page="/views/resources"/>
</head>
<body>
<jsp:include page="/views/head"/>

    <video id="video" controls preload="auto">

    </video>

<%--<jsp:include page="/views/footer"/>--%>

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
        fetchBuffer('/video/first.mp4', function (buffer) {
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
</html>
