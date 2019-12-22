<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="用户表">
    <meta name="description" content="用户数据表">
    <title>用户表</title>
    <script src="../../../js/base.js"></script>
    <style>
        .margin-right {
            margin-right: 5px;
            width: 110px;
        }
        .flex-toolbar{
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap
        }
        .flex-toolbar-search{
            display: flex;
            justify-content: flex-end;
            flex: auto;
        }
    </style>
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo" lay-even></table>
</body>
<script id="toolbarDemo" type="text/html">
    <div class="flex-toolbar">
        <div>
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="insert">新增</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</button>
        </div>
        <div class="flex-toolbar-search">
            <div class="layui-inline  margin-right"  style="width: 200px">
                <input id="content" placeholder="内容" class="layui-input" onkeydown="keyEvent(event)">
            </div>
            <button class="layui-btn" lay-event="search" id="search">搜索</button>
        </div>
    </div>
</script>
<script>
    layui.use("table",function () {
        var table = layui.table;
        var content = '';
        table.render({
            elem: '#demo'
            ,url: '/user/selectList/' //数据接口
            ,toolbar: '#toolbarDemo'
            ,title: 'URL'
            ,where:{
            }
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'username', title: '用户名', minWidth: 120}
                , {field: 'userid', title: '用户id', minWidth: 120}
                , {field: 'phoneNumber', title: '手机号', minWidth: 130}
                , {field: 'mailbox', title: '邮箱', minWidth: 170}
                , {field: 'password', title: '密码', minWidth: 100}
                , {field: 'nickname', title: '昵称', minWidth: 120}
                , {field: 'sex', title: '性别', templet:'<div>{{ d.sex == 0? "女" : "男"}}</div>', minWidth: 80}
                , {field: 'birthday', title: '生日', minWidth: 110}
                , {field: 'signature', title: '个性签名', minWidth: 300}
                , {field: 'currency', title: '货币', minWidth: 100}
                , {field: 'isMember', title: '会员', templet:'<div>{{ d.isMember == 0? "非会员" : "会员"}}</div>', minWidth: 100}
                , {field: 'isOnline', title: '在线状态', templet:'<div>{{ d.isOnline == 0? "离线" : "在线"}}</div>', minWidth: 100}
                , {field: 'isBorbidLogin', title: '禁止登录', templet:'<div>{{ d.isBorbidLogin == 0? "否" : "是"}}</div>', minWidth: 100}
                , {field: 'lastLoginTime', title: '上次登录时间', minWidth: 160}
                , {field: 'lastPassTime', title: '上次修改密码时间', minWidth: 160}
                , {field: 'registrationTime', title: '注册时间', minWidth: 160}
                , {field: 'realName', title: '真实姓名', minWidth: 100}
                , {field: 'documentType', title: '证件类型', minWidth: 100}
                , {field: 'documentNumber', title: '证件号码', minWidth: 100}
                /*, {fixed: 'right', title: '操作', width: 300, toolbar: '#barDemo'}*/
            ]]
            ,done : function () {
                $('.layui-table-fixed-r').removeClass('layui-hide');
                $('#content').val(content)
            }
            ,page: true
            ,limit:20
            ,id:'testReload'   //table唯一标识,可用于重载table
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.totleNum, //解析数据长度
                    "data": res.obj //解析数据列表
                };
            }
        })

        //头工具栏事件
        table.on('toolbar(demo)', function(obj){
            var data = table.checkStatus(obj.config.id).data;
            switch(obj.event){
                case 'insert':
                    layer.open({
                        type:2,
                        title:['新增','text-align:center'],
                        area:['800px','100%'],
                        //shadeClose:true,
                        content:"/user/newAndEdit"
                    })
                    break;
                case 'delete':
                    var ids = '';
                    $.each(data,function (index,item) {
                        ids += item.id +','
                    })
                    if(ids == ''){
                        layer.msg('请选择数据！！',{
                            offset:['45%','45%']
                        })
                        return false;
                    }
                    layer.confirm("确定删除所选？？？",{
                        yes:function () {
                            $.ajax({
                                url:'/user/delete',
                                data:{
                                    id:ids,
                                },
                                success:function (res) {
                                    if(res.flag){
                                        layer.msg(res.msg,{icon:1,offset:['45%','45%']})
                                        setTimeout(function () {
                                            location.reload();
                                        },1500)
                                    }
                                    else{
                                        layer.msg(res.msg,{icon:2,offset:['45%','45%']})
                                    }
                                }
                            })
                        },
                        offset:['45%','45%']
                    })
                    break;
                case 'search' :
                    content = $('#content').val()
                    //表格重载
                    table.reload('testReload',{
                        page: {
                            curr: 1 //重新从第 1 页开始
                        },
                        where:{
                            content:content
                        }
                    })
                    break;
            }
        });

        //行工具栏事件
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            switch (obj.event) {
                case "detail":
                    console.log(111)
                    break;
                case "":
                    break;
            }
        });
    })

    //按下Enter搜索事件
    function keyEvent(event){
        if(event.key=='Enter'){
            $('#search').click();
        }
    }
</script>
</html>
