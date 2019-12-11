<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍查询</title>
    <script src="../../js/base.js"></script>
</head>
<body>
    <h1>书籍查询</h1>
</body>
<script>
    $.ajax({
        url:'/book/selectList',
        data:{
            page:0,
            limit:10
        },
        success:function (res) {
            console.log(res)
        }
    })
</script>
</html>
