<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="个人,网页,爬虫">
    <meta name="description" content="个人网页，sessionid管理">
    <title>会话管理</title>
    <jsp:include page="/views/resources"/>
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
            <button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="back">返回</button>
        </div>
<%--        <div class="flex-toolbar-search">
            <button class="layui-btn" lay-event="search" id="search">搜索</button>
        </div>--%>
    </div>
</script>
<script>
    layui.use("table",function () {
        var table = layui.table;
        table.render({
            elem: '#demo'
            ,url: '/tomcatSessions/selectSessions/' //数据接口
            ,toolbar: '#toolbarDemo'
            ,title: 'URL'
            ,where:{
            }
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'sessionId', title: '会话id', minWidth: 310}
                , {field: 'username', title: '用户名', minWidth: 160}
                , {field: 'isMember', title: '会员',templet:'<div>{{d.isMember ? "是" : "否"}}</div>', minWidth: 160}
                , {field: 'maxInactiveString', title: '过期时限', minWidth: 160}
                , {field: 'creationTime', title: '创建时间', minWidth: 180}
                , {field: 'lastAccessDate', title: '最后访问时间', minWidth: 180}
                /*, {fixed: 'right', title: '操作', width: 300, toolbar: '#barDemo'}*/
            ]]
            ,done : function () {
                $('.layui-table-fixed-r').removeClass('layui-hide');
            }
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
                case 'back':
                    history.back()
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
                                url:'/webURL/delete',
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
                    //表格重载
                    table.reload('testReload',{
                        page: {
                            curr: 1 //重新从第 1 页开始
                        },
                        where:{
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
