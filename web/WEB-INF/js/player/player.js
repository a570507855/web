document.write("<link rel='stylesheet' href='../js/player/player.css' type='text/css'>");

//当页面完全加载所有内容后触发事件
window.onload=function () {
    var video = new Object({
        width:200,
        height:550,
        e:screen.width / screen.height,
        play:function(video){
            video.play();
        },
        pause:function(video){
            video.pause();
        },
        resetSize:function(){

        },
    })

    //窗口大小改变回调事件
    $(window).resize(function () {
    })
}

