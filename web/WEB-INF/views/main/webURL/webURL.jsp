<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="个人,网页,爬虫">
    <meta name="description" content="个人网页，将爬虫获取到的数据进行表格展示">
    <title>webURL</title>
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
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="insert">新增</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</button>
        </div>
        <div class="flex-toolbar-search">
            <div class="layui-inline  margin-right"  style="width: 120px">
                <input id="statusCode" placeholder="响应状态码" class="layui-input" onkeydown="keyEvent(event)">
            </div>
            <div class="layui-inline  margin-right"  style="width: 120px">
                <input id="title" placeholder="标题" class="layui-input" onkeydown="keyEvent(event)">
            </div>
            <div class="layui-inline  margin-right"  style="width: 120px">
                <input id="description" placeholder="描述" class="layui-input" onkeydown="keyEvent(event)">
            </div>
            <div class="layui-inline  margin-right"  style="width: 120px">
                <input id="keywords" placeholder="关键字" class="layui-input" onkeydown="keyEvent(event)">
            </div>
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
        var statusCode = '',
            title = '',
            description = '',
            keywords = '',
            content = '';
        table.render({
            elem: '#demo'
            ,url: '/webURL/selectList/' //数据接口
            ,toolbar: '#toolbarDemo'
            ,title: 'URL'
            ,where:{
            }
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'url', title: '网址',templet:'<div><a href="{{d.url}}" style="">{{d.url}}</a></div>', minWidth: 420}
                , {field: 'host', title: '主机名', minWidth: 180}
                , {field: 'statusCode', title: '响应状态码', minWidth: 100}
                , {field: 'title', title: '标题', minWidth: 580}
                , {field: 'description', title: '描述', minWidth: 580}
                , {field: 'keywords', title: '关键字', minWidth: 580}
                , {field: 'content', title: '内容', templet:'<div><input class="layui-input" value="{{d.content}}"></div>', minWidth: 400}
                , {field: 'protocol', title: '协议', minWidth: 100}
                , {field: 'subdomain', title: '子域', minWidth: 100}
                , {field: 'domain', title: '域', minWidth: 100}
                , {field: 'suffix', title: '后缀', minWidth: 100}
                , {field: 'encoding', title: '文本编码', minWidth: 100}
                , {field: 'type', title: '类型', minWidth: 200}
                /*, {fixed: 'right', title: '操作', width: 300, toolbar: '#barDemo'}*/
            ]]
            ,done : function () {
                $('.layui-table-fixed-r').removeClass('layui-hide');
                $('#title').val(title)
                $('#description').val(description)
                $('#keywords').val(keywords)
                $('#content').val(content)
                $('#statusCode').val(statusCode)
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
                        content:"/eduCampus/newAndEdit"
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
                    title = $('#title').val()
                    description = $('#description').val()
                    keywords = $('#keywords').val()
                    content = $('#content').val()
                    statusCode = $('#statusCode').val()
                    //表格重载
                    table.reload('testReload',{
                        page: {
                            curr: 1 //重新从第 1 页开始
                        },
                        where:{
                            statusCode:statusCode,
                            title:title,
                            description:description,
                            keywords:keywords,
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
