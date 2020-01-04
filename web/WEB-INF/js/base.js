
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

        //菜单悬浮--注册鼠标进入与离开事件
        var dropMenu = document.getElementsByClassName("xyy-drop-menu")
        for(var i =0; i!= dropMenu.length; ++i){
            dropMenu[i].addEventListener("mouseenter",function (event) {
                var width = $(this).width(),
                    content = $(this).find(".xyy-drop-content").first()
                if(content.hasClass("xyy-drop-content-right")){
                    content.css("left",width+"px");
                }
                content.show();
            })
            dropMenu[i].addEventListener("mouseleave",function (event) {
                $(this).find(".xyy-drop-content").first().hide();
            })
        }
    }

    //设置cookie
    function setCookie(cookies, expireDay, path, domain) {
        var str  = cookies
        var time = "";
        if(expireDay){
            var date=new Date();
            date.setTime(date.getTime()+expireDay*24*3600*1000);
            time = ';expires='+date.toUTCString()
        }
        str += time;
        if(path){
            str += ';path='+path
        }
        else{
            str += ';path=/'
        }
        if(domain){
            str += ';domain='+domain
        }
        document.cookie = str
    }

    //获取cookie
    function getCookie() {
        var cookies = document.cookie,
            cookieObj = {};
        if(cookies != '' && cookies != undefined){
            var cookiesArr = cookies.split(';')
            for(var i = 0; i != cookiesArr.length;++i){
                var key = cookiesArr[i].split('=')[0],
                    value = cookiesArr[i].split('=')[1];
                cookieObj[key.trim()] = value.trim()
            }
        }
        return cookieObj;
    }

    //删除cookie
    function delCookie(cookie,path, domain) {
        setCookie(cookie,-1,path,domain)
    }
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


