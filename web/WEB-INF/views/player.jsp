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
            <video src="/video/video.mp4"></video>
        </div>
        <div class="xyy-player-video-footer">
            <div class="xyy-player-video-footer-progress"></div>
            <div class="xyy-player-video-footer-controls xyy-flex-row">
                <div class="xyy-player-video-footer-controls-left xyy-flex-row">
                    <div><i class="iconfont icon-player-play"></i></div>
                    <div><i class="iconfont icon-player-next"></i></div>
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
    play.addEventListener("click", function (evt) {
        if(this.classList.contains("icon-player-play")){
            this.classList.replace("icon-player-play", "icon-player-pause")
            video.play()
        }
        else {
            this.classList.replace("icon-player-pause", "icon-player-play")
            video.pause()
        }


    })
</script>
</body>
</html>
