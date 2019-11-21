<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>播放器</title>
    <script src="../js/base.js"></script>
    <script src="../js/player/player.js"></script>
</head>
<body>
<div class="player-video" >
    <div class="player-video-title"></div>
    <div class="player-video-body">
        <video preload='auto' src="../video/movie.ogv" id="video" width="100%" height="100%"></video>
    </div>
    <div class="player-video-control">
        <div class="player-video-control-top"></div>
        <div class="player-video-control-bottom">
            <!--<div><img src="../icon/player-start.svg"></div>-->
        </div>
    </div>
</div>
</body>
</html>
