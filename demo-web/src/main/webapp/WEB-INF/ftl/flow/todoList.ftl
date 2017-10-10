<#include "common/public.ftl">
<@header title="短信列表" css_war="">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" style="min-height: 800px">
        <@notification title="通知"></@notification>
        <@pageHeading title_1="任务管理"  title_3="消息管理" title_4="待办任务" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="mail-box">
                <aside class="mail-nav mail-nav-bg-color">
                    <header class="header"> <h4>任务导航</h4> </header>
                    <div class="mail-nav-body">
                        <ul class="nav nav-pills nav-stacked mail-navigation">
                            <li class="active"><a href="mail.html"> <i class="fa fa-inbox"></i> 待办任务  <span class="label label-danger pull-right inbox-notification">4</span></a></li>
                            <li><a href="#"> <i class="fa fa-envelope-o"></i> 历史任务</a></li>
                            <li><a href="#"> <i class="fa fa-certificate"></i> 定时任务</a></li>
                            <li><a href="#"> <i class="fa fa-file-text-o"></i> 起草任务 <span class="label label-info pull-right inbox-notification">34</span></a></li>
                            <li><a href="#"> <i class="fa fa-trash-o"></i> 回收站</a></li>
                        </ul>
                    </div>
                </aside>
                <section class="mail-box-info">
                    <header class="header">
                        <div class="btn-group pull-right">
                            <button class="btn btn-sm btn-primary" type="button">
                                <i class="fa fa-chevron-left"></i>
                            </button>
                            <button class="btn btn-sm btn-primary" type="button">
                                <i class="fa fa-chevron-right"></i>
                            </button>
                        </div>
                        <div class="btn-toolbar">
                            <div class="btn-group">
                                <button class="btn btn-sm btn-primary"><i class="fa fa-refresh"></i></button>
                            </div>
                            <div class="btn-group select">
                                <button data-toggle="dropdown" class="btn btn-primary btn-sm dropdown-toggle">
                                    <span style="width: 70px;" class="dropdown-label">任务过滤器</span>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu text-left text-sm">
                                    <li><a href="#">已办任务</a></li>
                                    <li><a href="#">待办任务</a></li>
                                    <li><a href="#">回收任务</a></li>
                                    <li><a href="#">所有任务</a></li>
                                </ul>
                            </div>
                        </div>
                    </header>

                    <section class="mail-list">
                        <li class="list-group-item">
                                    <span class="pull-left chk">
                                        <input type="checkbox"/>
                                    </span>
                            <a class="thumb pull-left" href="#"> <img src="${context.contextPath}/images/avatar-mini.jpg"> </a>
                            <a class="" href="${context.contextPath}/mail_view.html"> <small class="pull-right text-muted">15 April</small> <strong>John Doe</strong>  <span>Donec ultrices faucibus rutrum. Phasellus sodales </span> <span class="label label-sm btn-success">normal</span> </a>
                        </li>
                        <li class="list-group-item">
                                    <span class="pull-left chk">
                                        <input type="checkbox"/>
                                    </span>
                            <a class="thumb pull-left" href="#"> <img src="${context.contextPath}/images/avatar-mini.jpg"> </a>
                            <a class="" href="${context.contextPath}/mail_view.html"> <small class="pull-right text-muted">15 April</small> <strong>John Doe</strong>  <span>Donec ultrices faucibus rutrum. Phasellus sodales </span> <span class="label label-sm btn-success">normal</span> </a>
                        </li>
                        <ul class="list-group">
                            <#list toDoTaskList as toDoTask>
                                <li class="list-group-item">
                                    <span class="pull-left chk">
                                        <input type="checkbox"/>
                                    </span>
                                    <a class="thumb pull-left" href="#"> <img src="${context.contextPath}/images/avatar-mini.jpg"> </a>
                                    <a class="" href="${context.contextPath}/mail_view.html"> <small class="pull-right text-muted">15 April</small> <strong>John Doe</strong>  <span>Donec ultrices faucibus rutrum. Phasellus sodales </span> <span class="label label-sm btn-success">normal</span> </a>
                                </li>
                            </#list>
                        </ul>
                    </section>
                </section>
            </div>

        </div>
        <footer class="sticky-footer">
            2017 &copy; transfar by hup</a>
        </footer>
    </div>
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war=""></@js_lib>
</body>
</html>
