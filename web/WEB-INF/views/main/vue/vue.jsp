<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>vue.js</title>
    <jsp:include page="/views/resources"/>
    <style>
        .red{
            color:red;
        }
        .green{
            color: green;
        }
    </style>
</head>
<body>
<jsp:include page="/views/head"/>
    <div id="app" class="container">
        <div class="xyy-text-box">{{ username }}</div>
        <span v-bind:title="message" >
            鼠标悬停几秒钟查看此处动态绑定的提示信息！
        </span>
        <ol>
            <li v-for="user in users">
                {{user.name}} : {{user.age}}
            </li>
        </ol>
        <button v-on:click="fun">vue点击</button>
        <input v-model="message">
        <ol>
            <myitem v-for="item in users" v-bind:item="item" v-bind:key="item.age">
                    {{ item.name }}
            </myitem>
        </ol>
        <p>v-html<span v-html="html"></span></p>
        <form v-on:submit.prevent="onSubmit">...</form>
        <p :class="classObject">class</p>
        <div  @keyup.alt.67="fun">1</div>
    </div>
<jsp:include page="/views/footer"/>
<script>
    Vue.component('myitem', {
        props: ['item'],
        template: '<li>{{ item.text }}</li>'
    });
    const vue = new Vue({
        el:"#app",
        data:{
            message:"信息",
            xing:'许',
            ming:"亦勇",
            //username:"许亦勇",
            users:[
                {"name":"许亦勇", "age":25},
                {"name":"许亦雄", "age":27}
            ],
            html:"<span style='color: red;'>红色</span>",
            classObject:{
                red:true,
                green:false
            }
        },
        methods:{
            fun:function () {
                console.log("vue点击事件")
            }
        },
        //计算属性，可用方法替代，但是计算属性是基于响应式依赖进行缓存的，只有在响应式依赖发生改变时才会重新求值
        computed:{
            //默认getter
            username: function () {
                return this.xing + "" + this.ming
            },
            msg:{
                get:function () {
                    return this.xing + ':' + this.message
                },
                set:function (newVal) {
                    let nameChat = newVal.split(":")
                    this.xing = nameChat[0];
                    this.message = nameChat[1];
                }
            }
        },
        //侦听器
        watch:{
            message:function (newMSG,oldMSG) {
                console.log("旧消息："+oldMSG + " 新消息："+newMSG )
            }
        },
        beforeCreate:function(){
            console.log("实例初始化之后，数据观测和事件配置之前的回调")
        },
        created:function () {
            console.log("实例创建完成时的回调")
        },
        beforeMount:function(){
            console.log("挂载开始之前的回调")
        },
        mounted:function () {
            console.log("实例被挂载后的回调")
        },
        beforeUpdate:function(){
            console.log("数据更新之前的回调")
        },
        updated:function () {
            console.log("数据更新后的回调")
        },
        activated:function(){
            console.log("被keep-alive缓存的组件激活时的回调")
        },
        deactivated:function(){
            console.log("被keep-alive缓存的组件停用时的回调")
        },
        beforeDestroy:function(){
            console.log("实例销毁之前的回调")
        },
        destroyed:function () {
            console.log("实例销毁时的回调")
        },
        errorCaptured:function (error, component, string) {
            console.log("子孙组件错误时的回调")
        }
    })

    /***
     *  v-bind:href=""  缩写：href=""
     *  v-on:click=""   缩写：@click=""
     *
     *
     *
     *
     */
</script>
</body>
</html>
