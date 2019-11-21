<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社会实践</title>
    <script src="../../js/base.js"></script>
    <style>
        .content {
            width:98%;
            margin:0 auto
        }
    </style>
</head>
<body>
    <div class="content">
        <table id="demo" lay-filter="demo" lay-even></table>
    </div>

    <script>
        layui.use('table',function(){
            var table = layui.table;
            table.render({
                elem:'#demo',
                url:'/eduPractice/selectList',
                page:true,
                limit:10,
                id:'tableData',
                cols:[[
                    {type:'checkbox', fixed: 'left'}
                    ,{field: 'practiceId', title: 'ID', minwidth:135, sort: true, fixed: 'left'}
                    ,{field: 'year', title: '学年', minwidth:135}
                    ,{field: 'classes', title: '班级', minwidth:135}
                    ,{field: 'studentName', title: '学生', minwidth:135}
                    ,{field: 'headTeacher', title: '班主任', minwidth:135}
                    ,{field: 'project', title: '实践项目', minwidth:135}
                    ,{field: 'beginTime', title: '开始时间', minwidth:135}
                    ,{field: 'endDate', title: '结束时间', minwidth:135}
                    ,{field: 'practiceNum', title: '活动时长', minwidth:135}
                    ,{field: 'objection', title: '异议状态', minwidth:135}
                    ,{field: 'status', title: '审核状态', minwidth:135}
                    ,{field: 'approval', title: '审核人', minwidth:135}
                ]],
                parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                    console.log(res)
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.totleNum, //解析数据长度
                    "data":res.obj //解析数据列表

                };
            }
            })
            //数据重载
            var $ = layui.$, active = {
                reload: function(){
                    var id = $('#testReload').val();
                    //执行重载
                    table.reload('tableData', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            practiceId:id
                        }
                    });
                }
            };
            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        })
    </script>

</body>
</html>
