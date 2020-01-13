
    //当页面完全加载所有内容后触发事件
    window.onload=function () {
        //菜单悬浮--注册鼠标进入与离开事件
        let dropMenu = document.getElementsByClassName("xyy-drop-menu");
        for(let i =0; i!== dropMenu.length; ++i){
            /***
             * 注册鼠标进入事件
             */
            dropMenu[i].addEventListener("mouseenter",function () {
                let width = this.offsetWidth,
                    content = this.getElementsByClassName("xyy-drop-content")[0];
                (' ' + content.className + ' ').indexOf(" xyy-drop-content-right ") !== -1
                    ? content.style.left = width +"px"
                    : "";
                content.style.display = "block";
            });
            /***
             * 注册鼠标离开事件
             */
            dropMenu[i].addEventListener("mouseleave",function () {
                this.getElementsByClassName("xyy-drop-content")[0].style.display = "none";
            })
        }
    };

    //设置cookie
    function setCookie(cookies, expireDay, path, domain) {
        let str  = cookies;
        let time = "";
        if(expireDay){
            let date=new Date();
            date.setTime(date.getTime()+expireDay*24*3600*1000);
            time = ';expires='+date.toUTCString();
        }
        str += time;
        if(path){
            str += ';path='+path;
        }
        else{
            str += ';path=/';
        }
        if(domain){
            str += ';domain='+domain;
        }
        document.cookie = str;
    }

    //获取cookie
    function getCookies() {
        let cookies = document.cookie,
            cookieObj = {};
        if(cookies !== '' && cookies !== undefined){
            let cookiesArr = cookies.split(';');
            cookiesArr.map(function (item) {
                let key = item.split('=')[0],
                    value =item.split('=')[1];
                cookieObj[key.trim()] = value.trim()
            })

        }
        return cookieObj;
    }

    //删除cookie
    function delCookie(cookie,path, domain) {
        setCookie(cookie,-1,path,domain);
    }
    //解析URL
    function getRequest() {
        let url = window.location.search; //获取url中"?"符后的字串
        let theRequest = {};
        if (url.indexOf("?") !== -1) {
            let str = url.substr(1);
            let strs = str.split("&");
            for(let i = 0; i < strs.length; i ++) {
                theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }


