<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018-11-29
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>eduPractice</title>
    <script src="../../js/base.js"></script>
</head>
<body>

<form class="layui-form" id="formData" method="post"  enctype="multipart/form-data" action="/eduPractice/insert">
    <table class="layui-table">
        <colgroup>
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <tr>
            <td>学年：</td>
            <td><input id="year" name="year" class="layui-input"></td>
            <td>班级：</td>
            <td><input id="classes" name="classes" class="layui-input"></td>
        </tr>
        <tr>
            <td>学生：</td>
            <td><input id="studentName" name="studentName" class="layui-input"></td>
            <td>班主任：</td>
            <td><input id="headTeacher" name="headTeacher" class="layui-input"></td>
        </tr>
        <tr>
            <td>项目：</td>
            <td><input id="project" name="project" class="layui-input"></td>
            <td>开始时间：</td>
            <td><input id="beginTime" name="beginTime" class="layui-input"></td>
        </tr>
        <tr>
            <td>结束时间：</td>
            <td><input id="endDate" name="endDate" class="layui-input"></td>
            <td>活动时长：</td>
            <td><input id="practiceNum" name="practiceNum" class="layui-input"></td>
        </tr>
        <tr>
            <td>异议状态：</td>
            <td><input id="objection" name="objection" class="layui-input"></td>
            <td>审核状态：</td>
            <td><input id="status" name="status" class="layui-input"></td>
        </tr>
        <tr>
            <td>审核人：</td>
            <td><input id="approval" name="approval" class="layui-input"></td>
        </tr>
        <tr>
            <td>
                <button lay-submit class="layui-btn">提交</button>
            </td>
        </tr>
    </table>
</form>


</body>
    <script>
        $.ajax({
            url:'/eduPractice/select?id=1',
            type:'get',
            success:function(res){
                console.log(res)
            }
        })


    </script>

</html>
