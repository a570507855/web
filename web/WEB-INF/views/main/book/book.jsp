<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍查询</title>
    <script src="../../../js/base.js"></script>
</head>
<body>
    <h1>书籍查询</h1>
</body>
<script>
    $.ajax({
        url:'/book/delete',
        data:{
            id:"3,4,6",
        },
        async:false,
        success:function (res) {
            console.log(res)
        }
    })


    // $.ajax({
    //     url:'/book/selectList',
    //     data:{
    //
    //     },
    //     success:function (res) {
    //         console.log("分页查询：")
    //         console.log(res)
    //     }
    // })

</script>
</html>
