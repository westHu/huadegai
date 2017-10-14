<#include "common/public.ftl">
<@header title="流程审核" css_war = ""></@header>
<body class="sticky-header">

<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="流程审核"  title_3="系统设置" title_4="流程审核" title_4_url="${context.contextPath}/"></@pageHeading>
        <hr/>
        <div class="wrapper">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel">
                        <header class="panel-heading">
                            审核面板
                        </header>
                        <div class="panel-body">
                            dothing
                            <ul class="chats cool-chat">
                                <#list response.comments as obj></#list>
                                <li class="in">
                                    ${obj}
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel">
                        <header class="panel-heading">
                            审核记录
                        </header>
                        <div class="panel-body">
                            <ul class="chats cool-chat">
                                <li class="in">
                                    <img src="images/photos/user1.png" alt="" class="avatar">
                                    <div class="message">
                                        <span class="arrow"></span>
                                        <a class="name" href="#">Jone Doe</a>
                                        <span class="datetime">at Mar 12, 2014 6:12</span>
                                        <span class="body">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit
                                        </span>
                                    </div>
                                </li>
                                <li class="out">
                                    <img src="images/photos/user2.png" alt="" class="avatar">
                                    <div class="message">
                                        <span class="arrow"></span>
                                        <a class="name" href="#">Margarita Rose</a>
                                        <span class="datetime">at Mar 12, 2014 6:13</span>
                                        <span class="body">
                                            sed diam nonummy nibh euismod tincidunt ut
                                        </span>
                                    </div>
                                </li>
                            </ul>
                            <div class="chat-form ">
                                <form role="form" class="form-inline">
                                    <div class="form-group">
                                        <input type="text" style="width: 100%" placeholder="Type a message here..." class="form-control">
                                    </div>
                                    <button class="btn btn-primary" type="submit">Send</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="">
            2017 &copy; transfar by hup
        </footer>
    </div>
    <!-- main content end-->
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war=""></@js_lib>
</body>
</html>
