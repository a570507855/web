<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>播放器</title>
    <link rel="stylesheet" type="text/css" charset="UTF-8" href="/js/player/player.css">
    <script src="/js/player/player.js" charset="UTF-8"></script>
    <jsp:include page="/views/resources"/>
</head>
<body>
<jsp:include page="/views/head"/>
<div class="container">
    <div class="xyy-player-video">
        <div class="xyy-player-video-header"></div>
        <div class="xyy-player-video-body">
            <video src="/video/video.mp4" width="100%"></video>
        </div>
        <div class="xyy-player-video-footer">
            <div class="xyy-player-video-footer-progress">
                <progress class="progress">
                </progress>
                <i class="iconfont icon-list-circle"></i>

            </div>
            <div class="xyy-player-video-footer-controls xyy-flex-row">
                <div class="xyy-player-video-footer-controls-left xyy-flex-row">
                    <div><i class="iconfont icon-player-play"></i></div>
                    <div><i class="iconfont icon-player-next"></i></div>
                    <div class="xyy-player-video-time-color"><span id="playStartTime">00:00</span> / <span id="playEndTime">00:11</span></div>
                </div>
                <div class="xyy-player-video-footer-controls-right xyy-flex-row">
                    <div><i class="iconfont icon-player-setUp"></i></div>
                    <div><i class="iconfont icon-player-volume"></i></div>
                    <div><i class="iconfont icon-player-loop"></i></div>
                    <div><i class="iconfont icon-player-fullscreen"></i></div>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="/views/footer"/>
<script>
    var video = document.querySelector("video")
    var play = document.querySelector(".icon-player-play")
    var progressDiv = document.querySelector(".xyy-player-video-footer-progress")
    var progress = document.querySelector("progress")

    play.addEventListener("click", playAndPause)

    video.addEventListener("click", playAndPause)

    video.addEventListener("timeupdate", timeupdate)

    video.addEventListener("loadedmetadata", loadedmetadata)

    video.addEventListener("seeking", seeking)

    video.addEventListener("seeked", seeked)

    video.addEventListener("ended", ended)

    progressDiv.addEventListener('click', progressChange)

    /***
     *  监听事件
     */

    function playAndPause(event) {
        switchPlayPause()
        video.paused ?video.play() : video.pause()

    }

    function timeupdate() {
        var playStartTime = document.getElementById("playStartTime")
        progress.value = video.currentTime
        playStartTime.textContent = getTimeFormat(video.currentTime)
    }

    function loadedmetadata() {
        var playEndTime = document.getElementById("playEndTime")
        progress.max = video.duration
        playEndTime.textContent = getTimeFormat(video.duration)

    }
    
    function progressChange(e) {
        video.paused ? play.click() : ''
        var pos = (e.pageX  - this.offsetLeft) / this.offsetWidth;
        progress.value  = video.currentTime = pos * video.duration;
    }

    function seeking() {
        switchPlayPause()
    }

    function seeked() {
        switchPlayPause()
    }

    function ended() {
        switchPlayPause()
    }


    /***
     *  自定义方法
     */
    function getTimeFormat(_second) {
        var flag = 'ms'
        var hour = ''
        var minute = '00'
        var second = '00'
        if(_second >= 3600){
            flag = 'h'
            hour =  Math.floor( _second / 3600)
            _second = Math.floor(_second % 3600)
        }
        _second = Math.floor(_second)
        if(_second<60){
            second = toTwoPlaceTime(_second)

        }
        else {
            minute = toTwoPlaceTime(Math.floor(_second / 60))
            second = toTwoPlaceTime(Math.floor(_second % 60))
        }
        if(flag === 'h'){
            return hour+ ':' + minute + ':' + second
        }
        else {
            return minute + ':' + second
        }
    }

    function toTwoPlaceTime(time) {
        return time.toString().length === 1 ? "0" +time.toString() : time.toString()
    }

    function switchPlayPause() {
        play.classList.contains("icon-player-play") ? play.classList.replace("icon-player-play", "icon-player-pause") : play.classList.replace("icon-player-pause", "icon-player-play")
    }
    
</script>
</body>
</html>
