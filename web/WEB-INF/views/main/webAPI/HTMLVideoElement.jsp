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
    <track label="中文字幕" kind="subtitles" srclang="zh" default src="/vtt/caption.vtt">
</video>
<div>
    <button class="btn-dark" id="videoInfo">获取视频信息</button>
    <button class="btn-dark" id="play">播放</button>
    <button class="btn-dark" id="pause">暂停</button>
    <button class="btn-dark" id="load">停止</button>

    <div>
        <label> 播放速度</label>
        <input type="range" max="3.0" min="0.1" value="1.0" step="0.1" id="range">
        <label id="show">1.0</label>
    </div>
    <div>
        <label>音量</label>
        <input type="range" max="1.0" min="0.0" value="1.0" step="0.1" id="volumeRange">
        <label id="volumeShow">1.0</label>
    </div>
    <div>
        <progress id="progress" value="0" min="0">

        </progress>
    </div>
</div>



<jsp:include page="/views/footer"/>
<script>

    /***
     * 播放速度
     */
    document.getElementById("range").addEventListener("change", function (ev) {
        document.getElementById("show").textContent = ev.target.value
        video.playbackRate = ev.target.value
        video.muted = false
    })

    /***
     * 音量
     */
    document.getElementById("volumeRange").addEventListener("change", function (ev) {
        document.getElementById("volumeShow").textContent = ev.target.value
        video.volume =  ev.target.value
    })
    /***
     * video标签是HTMLVideoElement对象的实例
     * HTMLVideoElement继承HTMLMediaElement
     * @type {HTMLVideoElement}
     */
    var video = document.querySelector("video")
    var progress = document.getElementById("progress")
    var videoInfo = document.getElementById("videoInfo")
    var _play = document.getElementById("play")
    var pauseing = document.getElementById("pause")
    var load = document.getElementById("load")
    function getVideoInfo() {
        console.log(video.volume)
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
        console.log("是否显示播放控件：" + video.controls)
        console.log("媒体元素的CORS：" + video.crossOrigin)
        console.log("当前播放时间：" + video.currentTime + 's')
        console.log("默认是否禁音：" + video.defaultMuted)
        console.log("是否禁音：" + video.muted)
        console.log("默认播放速度：" + video.defaultPlaybackRate)
        console.log("播放速度：" + video.playbackRate)
        console.log("是否循环播放：" + video.loop)
        console.log("网络状态：" + video.networkState)
        console.log("预加载哪些数据：" + video.preload)
        switch (video.networkState) {
            case video.NETWORK_EMPTY:
                console.log("未就绪")
                break;
            case video.NETWORK_IDLE:
                console.log("空闲")
                break;
            case video.NETWORK_LOADING:
                console.log("加载中")
                break;
            case video.NETWORK_NO_SOURCE:
                console.log("无资源")
        }
        console.log("是否自动播放："+ video.autoplay)
        console.log("无法播放时展示的图片：" + video.poster)
        /***
         * 只读
         */
        console.log("视频宽度："+ video.videoWidth)
        console.log("视频高度："+ video.videoHeight)
        console.log(Object("已下载的媒体部分(TimeRanges)：") + video.buffered)
        console.log("媒体文件的绝对路径：" + video.currentSrc )
        console.log("是否暂停：" + video.paused)
        console.log("浏览器播放的媒体源范围：" + video.played )
        console.log("是否跳跃中：" + video.seeking )
        switch (video.duration) {
            case NaN:
                console.log("duration：视频可用，总时长未知")
                break;
            case "Inf":
                console.log("duration：以stream流传输，且没有预定长度")
                break;
            default:
                console.log("视频总时长：" + video.duration + "s")
        }

        console.log("视频是否播放完毕：" + video.ended)
        console.log("错误：" + video.error)
        //console.log("初始播放位置：" + video.initialTime)

        //console.log("归属的分组(mediagroup)：" + video.mediaGroup)
    }
    /***
     * 是否可以播放指定的媒体类型
     * probably：指定的类型可以播放
     * maybe：不播放无法确定
     * 空字符串：不能播放
     * */
    console.log(video.canPlayType("video/mp4"))

/*    video.load()  //重新加载
    video.play()    //播放
    video.pause()   //暂停
    video.webkitEnterFullScreen()   //全屏
    */




    /***
     * 事件监听
     */
    videoInfo.addEventListener("click",getVideoInfo)

    _play.addEventListener("click", function (ev) { video.play() })

    pauseing.addEventListener("click", function (ev) { video.pause() })

    load.addEventListener("click",function (ev) { video.load() })

    video.addEventListener("play", play)

    video.addEventListener("playing", playing)

    video.addEventListener("pause", pause)

    video.addEventListener("seeking", seeking)

    video.addEventListener("seeked", seeked)

    video.addEventListener("loadstart", loadstart)

    video.addEventListener("loadedmetadata", loadedmetadata)

    video.addEventListener("loadeddata", loadeddata)

    video.addEventListener("timeupdate", timeupdate)
    
    video.addEventListener("abort", abort)

    video.addEventListener("canplay", canplay)

    video.addEventListener("canplaythrough", canplaythrough)

    video.addEventListener("durationchange", durationchange)

    video.addEventListener("emptied", emptied)

    video.addEventListener("ended", ended)

    video.addEventListener("error", error)

    video.addEventListener("ratechange", ratechange)

    video.addEventListener("volumechange", volumechange)

    video.addEventListener("stalled", stalled)

    video.addEventListener("suspend", suspend)

    video.addEventListener("waiting", waiting)
    progress.addEventListener('click', function(e) {
        var pos = (e.pageX  - this.offsetLeft) / this.offsetWidth;
        video.currentTime = pos * video.duration;

    });

    function play() {
        console.log("暂停后播放")
    }

    function playing() {
        console.log("在媒体开始播放时触发（不论是初次播放、在暂停后恢复、或是在结束后重新开始）")
    }

    function pause() {
        console.log("暂停")
    }

    function seeking() {
        console.log("跳跃开始")
    }

    function seeked() {
        console.log("跳跃结束")
    }

    function loadstart() {
        console.log("加载开始")
    }

    function loadedmetadata() {
        console.log("加载元数据")
        progress.setAttribute("max", video.duration)
    }

    function loadeddata() {
        console.log("第一帧加载完毕")
    }

    function timeupdate() {
        progress.value = video.currentTime
    }
    
    function abort() {
        console.log("播放被终止")
    }

    function canplay() {
        console.log("视频准备就绪，可供播放")
    }

    function canplaythrough() {
        console.log("video.readystate == HAVE_ENOUGH_DATA")
    }

    function durationchange() {
        console.log("视频长度改变")
    }

    function emptied() {
        console.log("视频被清空或初始化时触发")
    }

    function ended() {
        console.log("播放结束")
    }

    function error() {
        console.log("错误时触发")
    }

    function ratechange() {
        console.log("播放速度改变")
    }

    function volumechange() {
        console.log("音量改变")
    }
    
    function stalled() {
        console.log("尝试获取数据，但数据不可用")
    }

    function suspend() {
        console.log("资源加载终止(下载完成或其他原因暂停)")
    }

    function waiting() {
        console.log("在一个待执行的操作（如回放）因等待另一个操作（如跳跃或下载）被延迟时触发")
    }

</script>
</body>
</html>
