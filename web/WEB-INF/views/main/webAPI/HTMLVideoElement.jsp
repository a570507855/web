<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>HTMLVideoElement</title>
    <jsp:include page="/views/resources"/>
</head>
<body>
<jsp:include page="/views/head"/>

<video controls src="/video/first.mp4" width="800" height="500" >

</video>
<jsp:include page="/views/footer"/>
<script>
    /***
     * video标签是HTMLVideoElement对象的实例
     * HTMLVideoElement继承HTMLMediaElement
     * @type {HTMLVideoElement}
     */
    var video = document.querySelector("video");

    console.log("宽度："+video.width)
    console.log("视频宽度："+video.videoWidth)
    console.log("高度："+video.height)
    console.log("视频高度："+video.videoHeight)
    console.log("是否自动播放："+video.autoplay)
    console.log("是否自动播放："+video.autoplay)

</script>
</body>
</html>
