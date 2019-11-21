    document.write("<script type='text/javascript' src='../js/jquery-3.4.1.min.js'></script>");
    document.write("<script type='text/javascript' src='../js/layui-v2.5.5/layui/layui.js'></script>");
    document.write("<link rel='stylesheet' href='../js/layui-v2.5.5/layui/css/layui.css' type='text/css'>");

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
            console.log(111)
        })

        //解析URL
        function getRequest() {
            var url = window.location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") !== -1) {
                var str = url.substr(1);
                var strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }
    }