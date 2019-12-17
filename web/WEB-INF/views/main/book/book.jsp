<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍查询</title>
    <script src="../../../js/base.js"></script>
</head>
<body>
<div style="width: 95%;margin: 60px;">
    <div >
        <h1>设置cookie</h1>
        <p>document.cookie = "userName=许亦勇;password=disueb11"</p>
    </div>
    <div >
        <h1>获取cookie</h1>
        <p>document.cookie 获得以分号分割的键值对字符串</p>
    </div>
    <div >
        <h1>给cookie设置终止日期</h1>
        <p>document.cookie="userId=828; expires=GMT_String"</p>
    </div>
    <div >
        <h1>删除cookie</h1>
        <p>document.cookie="userId=828; expires=GMT_String" 将时间设置为过去时间便可删除cookie</p>
    </div>
    <div >
        <h1>指定可访问cookie的路径</h1>
        <p>document.cookie="userId=320; path=/shop"; 表示当前cookie仅能在shop目录下使用，path=/表示整个网站可用</p>
    </div>
    <div >
        <h1>指定可访问cookie的主机名</h1>
        <p>document.cookie="userId=320; domain=cookieDomain"; 表示当前cookie能在同一个域下的不同主机使用</p>
    </div>
    <div>
        <button class="layui-btn layui-btn-normal" id="export">导出</button>
    </div>
</div>
</body>
<script>
    // $.ajax({
    //     url:'/book/delete',
    //     data:{
    //         id:"3,4,6",
    //     },
    //     async:false,
    //     success:function (res) {
    //         console.log(res)
    //     }
    // })
    console.log('${sessionScope.username}')
    console.log(getCookie())
    $('#export').on('click',function () {
        location.href="/book/export"
    })
    $.ajax({
        url:'/book/selectList',
        data:{

        },
        success:function (res) {
            console.log("分页查询：")
            console.log(res)
        }
    })

</script>
</html>
