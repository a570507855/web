<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>设计模式学习笔记</title>
    <jsp:include page="/views/resources"/>
</head>
<body class="xyy-body-bgColor">
<jsp:include page="/views/head"/>
<div  class="container xyy-content-main">
    <jsp:include page="/designPattern/designPatternMenu"/>
    <div class="xyy-content-main-article">
        <div class="xyy-flex-end xyy-text-box">
            <a href="/designPattern/singletonPattern" class="xyy-link-gray">单例模式<i class="iconfont icon-right-arrow"></i></a>
        </div>
        <div class="xyy-text-box">
            <div class="xyy-text-bottom-line">
                <h1>设计模式简介</h1>
                <p>设计模式（Design pattern）代表了最佳的实践，通常被有经验的面向对象的软件开发人员所采用。
                    设计模式是软件开发人员在软件开发过程中面临的一般问题的解决方案。这些解决方案是众多软件开发人员经过相当长的一段时间的试验和错误总结出来的。
                    设计模式是一套被反复使用的、多数人知晓的、经过分类编目的、代码设计经验的总结。使用设计模式是为了重用代码、让代码更容易被他人理解、保证代码可靠性。
                    毫无疑问，设计模式于己于他人于系统都是多赢的，设计模式使代码编制真正工程化，设计模式是软件工程的基石，如同大厦的一块块砖石一样。
                    项目中合理地运用设计模式可以完美地解决很多问题，每种模式在现实中都有相应的原理来与之对应，每种模式都描述了一个在我们周围不断重复发生的问题，
                    以及该问题的核心解决方案，这也是设计模式能被广泛应用的原因。</p>
            </div>
            <div class="xyy-text-bottom-line">
                <h1>设计模式类型</h1>
                <p>常用的设计模式有23种，共分为三大类：<b>创建型模式、结构型模式、行为型模式</b>。另还有<b>J2EE设计模式</b></p>
                <table class="table table-bordered table-sm">
                    <colgroup>
                        <col width="50">
                        <col width="300">
                        <col width="200">
                    </colgroup>
                    <thead>
                    <tr class="thead-dark">
                        <th>序号</th>
                        <th>模式&描述</th>
                        <th>包括</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <h2>创建型模式</h2>
                            <p>这些设计模式提供了一种在创建对象的同时隐藏创建逻辑的方式，而不是使用 new 运算符直接实例化对象。
                                这使得程序在判断针对某个给定实例需要创建哪些对象时更加灵活。</p>
                        </td>
                        <td>
                            <ul>
                                <li>工厂模式</li>
                                <li>抽象工厂模式</li>
                                <li>单例模式</li>
                                <li>建造者模式</li>
                                <li>原型模式</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <h2>结构型模式</h2>
                            <p>这些设计模式关注类和对象的组合。继承的概念被用来组合接口和定义组合对象获得新功能的方式。</p>
                        </td>
                        <td>
                            <ul>
                                <li>适配器模式</li>
                                <li>桥接模式</li>
                                <li>过滤器模式</li>
                                <li>组合模式</li>
                                <li>装饰器模式</li>
                                <li>外观模式</li>
                                <li>享元模式</li>
                                <li>代理模式</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <h2>行为型模式</h2>
                            <p>这些设计模式特别关注对象之间的通信。</p>
                        </td>
                        <td>
                            <ul>
                                <li>责任链模式</li>
                                <li>命令模式</li>
                                <li>解释器模式</li>
                                <li>迭代器模式</li>
                                <li>中介者模式</li>
                                <li>备忘录模式</li>
                                <li>观察者模式</li>
                                <li>状态模式</li>
                                <li>空对象模式</li>
                                <li>策略模式</li>
                                <li>模板模式</li>
                                <li>访问者模式</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>
                            <h2>J2EE 模式</h2>
                            <p>这些设计模式特别关注表示层。这些模式是由 Sun Java Center 鉴定的。</p>
                        </td>
                        <td>
                            <ul>
                                <li>MVC 模式</li>
                                <li>业务代表模式</li>
                                <li>组合实体模式</li>
                                <li>数据访问对象模式</li>
                                <li>前端控制器模式</li>
                                <li>拦截过滤器模式</li>
                                <li>服务定位器模式</li>
                                <li>传输对象模式</li>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="xyy-text-bottom-line">
                <h1>设计模式的六大原则</h1>
                <h3>1、开闭原则</h3>
                <p>开闭原则的意思是：对扩展开放，对修改关闭。在程序需要进行拓展的时候，不能去修改原有的代码，实现一个热插拔的效果。
                    简言之，是为了使程序的扩展性好，易于维护和升级。想要达到这样的效果，我们需要使用接口和抽象类</p>
                <h3>2、里氏代换原则</h3>
                <p>里氏代换原则是面向对象设计的基本原则之一。 里氏代换原则中说，任何基类可以出现的地方，子类一定可以出现。LSP 是继承复用的基石，
                    只有当派生类可以替换掉基类，且软件单位的功能不受到影响时，基类才能真正被复用，而派生类也能够在基类的基础上增加新的行为。
                    里氏代换原则是对开闭原则的补充。实现开闭原则的关键步骤就是抽象化，而基类与子类的继承关系就是抽象化的具体实现，
                    所以里氏代换原则是对实现抽象化的具体步骤的规范。</p>
                <h3>3、依赖倒转原则</h3>
                <p>这个原则是开闭原则的基础，具体内容：针对接口编程，依赖于抽象而不依赖于具体。</p>
                <h3>4、接口隔离原则</h3>
                <p>使用多个隔离的接口，比使用单个接口要好。强调降低依赖，降低耦合。</p>
                <h3>5、迪米特法则</h3>
                <p>一个实体应当尽量少地与其他实体之间发生相互作用，使得系统功能模块相对独立。</p>
                <h3>6、合成复用原则</h3>
                <p>尽量使用合成/聚合的方式，而不是使用继承。</p>
            </div>
        </div>

    </div>
</div>
<jsp:include page="/views/footer"/>
</body>
</html>
