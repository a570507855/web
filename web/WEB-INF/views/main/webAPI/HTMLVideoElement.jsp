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

<video controls src="/video/video.mp4" poster="/img/home/background.jpg">

</video>
<button class="btn-dark" id="btn">获取视频信息</button>
<jsp:include page="/views/footer"/>
<script>
    /***
     * video标签是HTMLVideoElement对象的实例
     * HTMLVideoElement继承HTMLMediaElement
     * @type {HTMLVideoElement}
     */
    var video = document.querySelector("video");
    function getVideoInfo() {
        switch (video.readyState) {
            case video.HAVE_NOTHING:
                console.log("视频/音频暂未就绪")
                break;
            case video.HAVE_METADATA:
                console.log("视频/音频已初始化")
                break;
            case video.HAVE_CURRENT_DATA:
                console.log("当前数据已经可以播放，但没下一帧数据")
                break;
            case video.HAVE_FUTURE_DATA:
                console.log("至少有两帧数据可用")
                break;
            case video.HAVE_ENOUGH_DATA:
                console.log("可用数据足以开始播放-如果网速得到保障 那么视频可以一直播放到底")
                break;

        }

        console.log("属性宽度："+ video.width)
        console.log("属性高度："+ video.height)
        console.log("是否显示播放界面：" + video.controls)
        console.log("媒体元素的CORS：" + video.crossOrigin)
        console.log("当前播放时间：" + video.currentTime)
        /***
         * 只读
         */
        console.log("视频宽度："+ video.videoWidth)
        console.log("视频高度："+ video.videoHeight)
        console.log(Object("已下载的媒体部分(TimeRanges)：") + video.buffered)
        console.log("媒体文件的绝对路径：" + video.currentSrc )
        /***
         * 可修改但没效果
         */
        console.log("是否自动播放："+ video.autoplay)
        console.log("无法播放时展示的图片：" + video.poster)

    }

    var button = document.querySelector("button");
    button.addEventListener("click",getVideoInfo)

    video.addEventListener("play", play)

    video.addEventListener("pause", pause)

    video.addEventListener("seeking", seeking)

    video.addEventListener("seeked", seeked)


    function play() {
        console.log("播放")
    }

    function pause() {
        console.log("暂停")
    }

    function seeking() {
        console.log("跳跃播放")
    }

    function seeked() {
        console.log("跳跃结束")
    }
</script>
</body>
</html>
