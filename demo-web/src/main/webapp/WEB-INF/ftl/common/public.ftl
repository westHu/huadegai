<#--公共顶部-->
<#macro header title="default" css_war = "" >
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="keywords" content="${title}">
    <meta name="description" content="${title}">
    <meta name="author" content="hup">
    <#--<link rel="shortcut icon" href="#" type="image/png">-->
    <title>${title}</title>

    <#if css_war?length gt 0>
        <#list css_war?split(",") as obj >
            <#if obj == 'responsive_table'>
                <!--responsive table-->
                <link href="${context.contextPath}/css/table-responsive.css" rel="stylesheet" />
            </#if>
            <#if obj == 'stepy'>
                <!--stepy-->
                <link href="${context.contextPath}/css/jquery.stepy.css" rel="stylesheet">
            </#if>
            <#if obj == 'gritter_css'>
                <!--gritter css-->
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/gritter/css/jquery.gritter.css" />
            </#if>
            <#if obj == 'icheck'>
                <!--icheck-->
                <link href="${context.contextPath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/minimal/red.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/minimal/green.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/minimal/yellow.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/minimal/purple.css" rel="stylesheet">

                <link href="${context.contextPath}/js/iCheck/skins/square/square.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/square/red.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/square/green.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/square/blue.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/square/yellow.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/square/purple.css" rel="stylesheet">

                <link href="${context.contextPath}/js/iCheck/skins/flat/grey.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/flat/red.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/flat/green.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/flat/blue.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
                <link href="${context.contextPath}/js/iCheck/skins/flat/purple.css" rel="stylesheet">
            </#if>
            <#if obj == 'dashboard_calendar'>
                <!--dashboard calendar-->
                <link href="${context.contextPath}/css/clndr.css" rel="stylesheet">
            </#if>
            <#if obj == 'morris_chart_css'>
                <!--Morris Chart CSS -->
                <link rel="stylesheet" href="${context.contextPath}/js/morris-chart/morris.css">
            </#if>
            <#if obj == 'treeview'>
                <!--treeview -->
                <link href="${context.contextPath}/js/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
            </#if>
            <#if obj == 'multi-select'>
                <!--multi-select-->
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/jquery-multi-select/css/multi-select.css" />
            </#if>
            <#if obj == 'treetable'>
                <!--jquery.treetable-->
                <link rel="stylesheet" href="${context.contextPath}/js/jquery-treetable/stylesheets/jquery.treetable.css">
                <link rel="stylesheet" href="${context.contextPath}/js/jquery-treetable/stylesheets/jquery.treetable.theme.default.css">
            </#if>
            <#if obj == 'pickers_css'>
                <!--pickers css-->
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-datepicker/css/datepicker-custom.css" />
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-timepicker/css/timepicker.css" />
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-colorpicker/css/colorpicker.css" />
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />
            </#if>
            <#if obj == 'paging-hup_css'>
                <!--paging-hup css-->
                <link rel="stylesheet" type="text/css" href="${context.contextPath}/css/paging-hup.css" />
            </#if>

            <#if obj == 'data_table'>
                <!--data table-->
                <link rel="stylesheet" href="${context.contextPath}/js/data-tables/DT_bootstrap.css" />
            </#if>

            <#if obj == 'jquery_confirm'>
                <!--jquery_confirm-->
                <link rel="stylesheet" href="${context.contextPath}/js/jquery-confirm/jquery-confirm.min.css" />
            </#if>


        </#list>
    </#if>

    <#nested>

    <!--common-->
    <link href="${context.contextPath}/css/style.css" rel="stylesheet">
    <link href="${context.contextPath}/css/style-responsive.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
</head>
</#macro>



<#-- ##########页面引入 导航栏 的模板 ##############-->
<#macro left title="导航栏">
    <!-- left side start-->
    <div class="left-side sticky-left-side">
        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="${context.contextPath}/" style="font-size: 20px; margin: 10px 0px 0px 25px;">
                <img src="${context.contextPath}/images/iconfont-01-copy.png" alt="">
                 &nbsp导航栏
            </a>
        </div>
        <div class="logo-icon text-center">
            <a href="${context.contextPath}/"></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="${context.contextPath}/images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#"><@shiro.principal/></a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                    <li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                    <li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li><a href="${context.contextPath}/"><i class="fa fa-home"></i> <span>首页.</span></a></li>
                <li class="menu-list"><a href=""><i class="fa fa-laptop"></i> <span>系统风格</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="blank_page.html"> Blank Page</a></li>
                        <li><a href="boxed_view.html"> Boxed Page</a></li>
                        <li><a href="leftmenu_collapsed_view.html"> Sidebar Collapsed</a></li>
                        <li><a href="horizontal_menu.html"> Horizontal Menu</a></li>

                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-book"></i> <span>综合管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="general.html"> General</a></li>
                        <li><a href="buttons.html"> Buttons</a></li>
                        <li><a href="tabs-accordions.html"> Tabs & Accordions</a></li>
                        <li><a href="typography.html"> Typography</a></li>
                        <li><a href="slider.html"> Slider</a></li>
                        <li><a href="panels.html"> Panels</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-cogs"></i> <span>水质管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="grids.html"> Grids</a></li>
                        <li><a href="gallery.html"> Media Gallery</a></li>
                        <li><a href="calendar.html"> Calendar</a></li>
                        <li><a href="tree_view.html"> Tree View</a></li>
                        <li><a href="nestable.html"> Nestable</a></li>

                    </ul>
                </li>

                <li><a href="fontawesome.html"><i class="fa fa-bullhorn"></i> <span>视频管理</span></a></li>

                <li class="menu-list"><a href=""><i class="fa fa-envelope"></i> <span>OA管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mail.html"> Inbox</a></li>
                        <li><a href="mail_compose.html"> Compose Mail</a></li>
                        <li><a href="mail_view.html"> View Mail</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-bar-chart-o"></i> <span>报表管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="flot_chart.html"> Flot Charts</a></li>
                        <li><a href="morris.html"> Morris Charts</a></li>
                        <li><a href="chartjs.html"> Chartjs</a></li>
                        <li><a href="c3chart.html"> C3 Charts</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="fa fa-th-list"></i> <span>消息管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${context.contextPath}/smsMessage"> 短信管理</a></li>
                        <li><a href="basic_table.html"> Basic Table</a></li>
                        <li><a href="dynamic_table.html"> Advanced Table</a></li>
                        <li><a href="/user"> Responsive Table</a></li>
                        <li><a href="editable_table.html"> Edit Table</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="fa fa-map-marker"></i> <span>地图系统</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="google_map.html"> Google Map</a></li>
                        <li><a href="vector_map.html"> Vector Map</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-tasks"></i> <span>巡检系统</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${context.contextPath}"> 巡检任务</a></li>
                        <li><a href="${context.contextPath}"> 巡检记录</a></li>
                        <li><a href="${context.contextPath}"> 巡检考核</a></li>
                        <li><a href="${context.contextPath}/patrol/planList"> 巡检计划</a></li>
                        <li><a href="${context.contextPath}/patrol/pointList"> 巡检区域</a></li>
                        <li><a href="${context.contextPath}/patrol/pointList"> 巡检点</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-file-text"></i> <span>设备管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${context.contextPath}/device/purchase"> 设备采购</a></li>
                        <li><a href="${context.contextPath}/device/inbound"> 设备入库</a></li>
                        <li><a href="${context.contextPath}/device/install"> 设备安装</a></li>
                        <li><a href="${context.contextPath}/device/repair"> 设备检修</a></li>
                        <li><a href="${context.contextPath}/device/scrap"> 设备报废</a></li>
                        <li><a href="${context.contextPath}/device/query"> 设备查询</a></li>
                        <li><a href="${context.contextPath}/device/category"> 设备分类</a></li>
                    </ul>
                </li>
                <li class="menu-list" ><a href=""><i class="fa fa-file-text"></i> <span>流程管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${context.contextPath}/task/list?status=todo"> 任务管理</a></li>
                        <li><a href="${context.contextPath}/process/definitionList?name=devicePurchase"> 流程定义</a></li>
                        <li><a href="${context.contextPath}/process/runtimeList?name=devicePurchase"> 流程运行记录</a></li>
                    </ul>
                </li>
                <li class="menu-list" ><a href=""><i class="fa fa-file-text"></i> <span>系统设置</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${context.contextPath}/user/list"> 用户管理</a></li>
                        <li><a href="${context.contextPath}/role/list"> 角色管理</a></li>
                        <li><a href="${context.contextPath}/resource/list"> 资源管理</a></li>
                        <li><a href="${context.contextPath}/organization/list"> 组织管理</a></li>
                    </ul>
                </li>
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
</#macro>



<#-- ##########页面引入 通知 的模板 ##############-->
<#macro notification title="通知">
    <div class="header-section">

        <!--toggle button start-->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>
        <!--toggle button end-->

        <!--search start-->
        <form class="searchform" action="index.index.ftl" method="post">
            <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
        </form>
        <!--search end-->

        <!--notification menu start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-tasks"></i>
                        <span class="badge">8</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">You have 8 pending task</h5>
                        <ul class="dropdown-list user-list">
                            <li class="new">
                                <a href="#">
                                    <div class="task-info">
                                        <div>Database update</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning">
                                            <span class="">40%</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="new">
                                <a href="#">
                                    <div class="task-info">
                                        <div>Dashboard done</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 90%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="90" role="progressbar" class="progress-bar progress-bar-success">
                                            <span class="">90%</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Web Development</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 66%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="66" role="progressbar" class="progress-bar progress-bar-info">
                                            <span class="">66% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Mobile App</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 33%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="33" role="progressbar" class="progress-bar progress-bar-danger">
                                            <span class="">33% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Issues fixed</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 80%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" role="progressbar" class="progress-bar">
                                            <span class="">80% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="new"><a href="">See All Pending Task</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge">5</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">You have 5 Mails </h5>
                        <ul class="dropdown-list normal-list">
                            <li class="new">
                                <a href="">
                                    <span class="thumb"><img src="${context.contextPath}/images/photos/user1.png" alt="" /></span>
                                    <span class="desc">
                                              <span class="name">John Doe <span class="badge badge-success">new</span></span>
                                              <span class="msg">Lorem ipsum dolor sit amet...</span>
                                            </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="${context.contextPath}/images/photos/user2.png" alt="" /></span>
                                    <span class="desc">
                                              <span class="name">Jonathan Smith</span>
                                              <span class="msg">Lorem ipsum dolor sit amet...</span>
                                            </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="${context.contextPath}/images/photos/user3.png" alt="" /></span>
                                    <span class="desc">
                                              <span class="name">Jane Doe</span>
                                              <span class="msg">Lorem ipsum dolor sit amet...</span>
                                            </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="${context.contextPath}/images/photos/user4.png" alt="" /></span>
                                    <span class="desc">
                                              <span class="name">Mark Henry</span>
                                              <span class="msg">Lorem ipsum dolor sit amet...</span>
                                            </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="${context.contextPath}/images/photos/user5.png" alt="" /></span>
                                    <span class="desc">
                                              <span class="name">Jim Doe</span>
                                              <span class="msg">Lorem ipsum dolor sit amet...</span>
                                            </span>
                                </a>
                            </li>
                            <li class="new"><a href="">Read All Mails</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge">4</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">Notifications</h5>
                        <ul class="dropdown-list normal-list">
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #1 overloaded.  </span>
                                    <em class="small">34 mins</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #3 overloaded.  </span>
                                    <em class="small">1 hrs</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #5 overloaded.  </span>
                                    <em class="small">4 hrs</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #31 overloaded.  </span>
                                    <em class="small">4 hrs</em>
                                </a>
                            </li>
                            <li class="new"><a href="">See All Notifications</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="${context.contextPath}/images/photos/user2.png" alt="" />
                        <@shiro.principal/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="#"><i class="fa fa-user"></i>个人信息</a></li>
                        <li><a href="#"><i class="fa fa-cog"></i>个人设置</a></li>
                        <li><a href="${context.contextPath}/logout"><i class="fa fa-sign-out"></i> 登 出</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!--notification menu end -->

    </div>
</#macro>



<#-- ##########页面引入公共顶部的模板 ##############-->
<#macro pageHeading title_1 = "默认标题"  title_3 = "默认标题" title_4 = "默认标题" title_4_url ="#">
    <div class="page-heading">
        <h3>
           ${title_1}
        </h3>
        <ul class="breadcrumb">
            <li>
                <a href="${context.contextPath}/">首页</a>
            </li>
            <li>
                <a href="#">${title_3}</a>
            </li>
            <li class="active">
                <a href="${title_4_url}">${title_4}</a>
            </li>
        </ul>
    </div>
</#macro>



<#-- ##########页面引入 分页 的模板 ##############-->
<#macro  hup_pagination showBegin = "1"  showEnd = "10">
<div id="my-page-div" class="row-fluid">
    <div class="span6" style="float: left">
        <div id="dynamic-table_length" class="dataTables_length">
            <label>
                <select class="form-control" size="1" name="dynamic-table_length" aria-controls="dynamic-table" id="pageSize">
                    <option value="10" <#if pager.pageSize == 10>selected="selected"</#if> >10</option>
                    <option value="20" <#if pager.pageSize == 20>selected="selected"</#if> >20</option>
                    <option value="30" <#if pager.pageSize == 30>selected="selected"</#if> >30</option>
                    <option value="40" <#if pager.pageSize == 40>selected="selected"</#if> >40</option>
                </select>
            </label>
        </div>
    </div>
    <div class="span6" style="float: left; padding: 10px;">
        <div class="dataTables_info" id="dynamic-table_info">
            条/页.  现显示：[ ${showBegin} - ${showEnd} ]
        </div>
    </div>
    <div class="span6" style="float: right">
        <div id="page" class="page_div"></div>
    </div>
</div>
</#macro>



<#-- ##########页面引入js库的模板 ##############-->
<#macro js_lib  js_war = "default">
    <!-- Placed js at the end of the document so the pages load faster -->
    <script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${context.contextPath}/js/bootstrap.min.js"></script>
    <script src="${context.contextPath}/js/modernizr.min.js"></script>
    <script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

    <#if js_war?length gt 0>
        <#list js_war?split(",") as obj >
            <#if obj == 'validate_stepy'>
                <!--validate_stepy-->
                <script src="${context.contextPath}/js/jquery.validate.min.js"></script>
                <script src="${context.contextPath}/js/jquery.stepy.js"></script>
            </#if>

            <#if obj == 'easy_pie_chart'>
                <!--easy pie chart-->
                <script src="${context.contextPath}/js/easypiechart/jquery.easypiechart.js"></script>
                <script src="${context.contextPath}/js/easypiechart/easypiechart-init.js"></script>
            </#if>

            <#if obj == 'sparkline_chart'>
                <!--Sparkline Chart-->
                <script src="${context.contextPath}/js/sparkline/jquery.sparkline.js"></script>
                <script src="${context.contextPath}/js/sparkline/sparkline-init.js"></script>
            </#if>

            <#if obj == 'icheck'>
                <!--icheck -->
                <script src="${context.contextPath}/js/iCheck/jquery.icheck.js"></script>
                <script src="${context.contextPath}/js/icheck-init.js"></script>
            </#if>

            <#if obj == 'jQuery_flot_chart'>
                <!-- jQuery Flot Chart-->
                <script src="${context.contextPath}/js/flot-chart/jquery.flot.js"></script>
                <script src="${context.contextPath}/js/flot-chart/jquery.flot.tooltip.js"></script>
                <script src="${context.contextPath}/js/flot-chart/jquery.flot.resize.js"></script>
            </#if>

            <#if obj == 'morris_chart'>
                <!--Morris Chart-->
                <script src="${context.contextPath}/js/morris-chart/morris.js"></script>
                <script src="${context.contextPath}/js/morris-chart/raphael-min.js"></script>
            </#if>

            <#if obj == 'calendar'>
                <!--Calendar-->
                <script src="${context.contextPath}/js/calendar/clndr.js"></script>
                <script src="${context.contextPath}/js/calendar/evnt.calendar.init.js"></script>
                <script src="${context.contextPath}/js/calendar/moment-2.2.1.js"></script>
                <script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
            </#if>

            <#if obj == 'gritter_script'>
                <!--gritter script-->
                <script src="${context.contextPath}/js/gritter/js/jquery.gritter.js" type="text/javascript"></script>
                <script src="${context.contextPath}/js/gritter/js/gritter-init.js" type="text/javascript"></script>
            </#if>
            <#if obj == 'treeview'>
                <!--treeview-->
                <script src="${context.contextPath}/js/bootstrap-treeview/js/bootstrap-treeview.min.js"></script>
            </#if>
            <#if obj == 'input_mask'>
                <!--bootstrap-input-mask-->
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
            </#if>
            <#if obj == 'multi-select'>
                <!--multi-select-->
                <script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.multi-select.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/multi-select-init.js"></script>
            </#if>
            <#if obj == 'treetable'>
                <!--treetable-->
                <script src="${context.contextPath}/js/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
            </#if>

            <#if obj == 'pickers_plugins'>
                <!--pickers plugins-->
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-daterangepicker/moment.min.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-daterangepicker/daterangepicker.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
            </#if>

            <#if obj == 'pickers_initialization'>
                <!--pickers initialization-->
                <script type="text/javascript" src="${context.contextPath}/js/pickers-init.js"></script>
            </#if>

            <#if obj == 'paging-hup'>
                <!--pickers initialization-->
                <script type="text/javascript" src="${context.contextPath}/js/paging-hup.js"></script>
            </#if>

            <#if obj == 'data_table'>
                <!--data table-->
                <script type="text/javascript" src="${context.contextPath}/js/data-tables/jquery.dataTables.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/data-tables/DT_bootstrap.js"></script>
                <!--script for editable table-->
                <script type="text/javascript" src="${context.contextPath}/js/editable-table.js"></script>
            </#if>
            <#if obj == 'spinner'>
                <!--spinner-->
                <script type="text/javascript" src="${context.contextPath}/js/fuelux/js/spinner.min.js"></script>
                <script type="text/javascript" src="${context.contextPath}/js/spinner-init.js"></script>
            </#if>

            <#if obj == 'dashboard_charts'>
                <!--Dashboard Charts-->
                <script src="${context.contextPath}/js/dashboard-chart-init.js"></script>
            </#if>

            <#if obj == 'jquery_confirm'>
            <!--jquery_confirm-->
            <script src="${context.contextPath}/js/jquery-confirm/jquery-confirm.min.js"></script>
            </#if>

        </#list>
    </#if>

    <#nested>
    <!--common scripts for all pages-->
    <script src="${context.contextPath}/js/scripts.js"></script>
    <#--hup    -->
    <script src="${context.contextPath}/js/common-hup.js"></script>
</#macro>







<#--公共底部-->
<#macro footer>
<script type="text/javascript" src="/static/js/common.js"></script>
    <#nested>
</body>
</html>
</#macro>