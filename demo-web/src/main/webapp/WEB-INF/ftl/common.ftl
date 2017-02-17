<#--公共顶部模板 header-->
<#macro header>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>Peppa Pig</title>

    <!--icheck-->
    <link href="${context.contextPath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
    <link href="${context.contextPath}/js/iCheck/skins/square/square.css" rel="stylesheet">
    <link href="${context.contextPath}/js/iCheck/skins/square/red.css" rel="stylesheet">
    <link href="${context.contextPath}/js/iCheck/skins/square/blue.css" rel="stylesheet">

    <!--dashboard calendar-->
    <link href="${context.contextPath}/css/clndr.css" rel="stylesheet">

    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="${context.contextPath}/js/morris-chart/morris.css">

    <!--common-->
    <link href="${context.contextPath}/css/style.css" rel="stylesheet">
    <link href="${context.contextPath}/css/style-responsive.css" rel="stylesheet">




    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${context.contextPath}/js/html5shiv.js"></script>
    <script src="${context.contextPath}/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="${context.contextPath}/home"><img src="${context.contextPath}/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="${context.contextPath}/home"><img src="${context.contextPath}/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">John Doe</a></h4>
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
                <li class="active"><a href="${context.contextPath}/home"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
            <#--<li class="menu-list"><a href=""><i class="fa fa-laptop"></i> <span>Layouts</span></a>
                <ul class="sub-menu-list">
                    <li><a href="#"> 正常布局</a></li>
                    <li><a href="${context.contextPath}/layout/boxed"> 魔盒布局</a></li>
                    <li><a href="${context.contextPath}/layout/collapsed"> 折叠布局</a></li>
                    <li><a href="${context.contextPath}/layout/horizontal"> 水平布局</a></li>

                </ul>
            </li>-->
                <li class="menu-list"><a href=""><i class="fa fa-book"></i> <span>UI Elements</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="general.html"> General</a></li>
                        <li><a href="buttons.html"> Buttons</a></li>
                        <li><a href="tabs-accordions.html"> Tabs & Accordions</a></li>
                        <li><a href="typography.html"> Typography</a></li>
                        <li><a href="slider.html"> Slider</a></li>
                        <li><a href="panels.html"> Panels</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-cogs"></i> <span>Components</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="grids.html"> Grids</a></li>
                        <li><a href="gallery.html"> Media Gallery</a></li>
                        <li><a href="calendar.html"> Calendar</a></li>
                        <li><a href="tree_view.html"> Tree View</a></li>
                        <li><a href="nestable.html"> Nestable</a></li>

                    </ul>
                </li>

                <li><a href="fontawesome.html"><i class="fa fa-bullhorn"></i> <span>Fontawesome</span></a></li>

                <li class="menu-list"><a href=""><i class="fa fa-envelope"></i> <span>Mail</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mail.html"> Inbox</a></li>
                        <li><a href="mail_compose.html"> Compose Mail</a></li>
                        <li><a href="mail_view.html"> View Mail</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-tasks"></i> <span>Forms</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="form_layouts.html"> Form Layouts</a></li>
                        <li><a href="form_advanced_components.html"> Advanced Components</a></li>
                        <li><a href="form_wizard.html"> Form Wizards</a></li>
                        <li><a href="form_validation.html"> Form Validation</a></li>
                        <li><a href="editors.html"> Editors</a></li>
                        <li><a href="inline_editors.html"> Inline Editors</a></li>
                        <li><a href="pickers.html"> Pickers</a></li>
                        <li><a href="dropzone.html"> Dropzone</a></li>
                        <li><a href="http://www.weidea.net"> More</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-bar-chart-o"></i> <span>Charts</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="flot_chart.html"> Flot Charts</a></li>
                        <li><a href="morris.html"> Morris Charts</a></li>
                        <li><a href="chartjs.html"> Chartjs</a></li>
                        <li><a href="c3chart.html"> C3 Charts</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href="#"><i class="fa fa-th-list"></i> <span>Data Tables</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="basic_table.html"> Basic Table</a></li>
                        <li><a href="dynamic_table.html"> Advanced Table</a></li>
                        <li><a href="responsive_table.html"> Responsive Table</a></li>
                        <li><a href="editable_table.html"> Edit Table</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="fa fa-map-marker"></i> <span>Maps</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="google_map.html"> Google Map</a></li>
                        <li><a href="vector_map.html"> Vector Map</a></li>
                        <li><a href="${context.contextPath}/mapView"> Baidu Map</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-file-text"></i> <span>Extra Pages</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="profile.html"> Profile</a></li>
                        <li><a href="invoice.html"> Invoice</a></li>
                        <li><a href="pricing_table.html"> Pricing Table</a></li>
                        <li><a href="timeline.html"> Timeline</a></li>
                        <li><a href="blog_list.html"> Blog List</a></li>
                        <li><a href="blog_details.html"> Blog Details</a></li>
                        <li><a href="directory.html"> Directory </a></li>
                        <li><a href="chat.html"> Chat </a></li>
                        <li><a href="404.html"> 404 Error</a></li>
                        <li><a href="500.html"> 500 Error</a></li>
                        <li><a href="registration.html"> Registration Page</a></li>
                        <li><a href="lock_screen.html"> Lockscreen </a></li>
                    </ul>
                </li>
                <li><a href="login.html"><i class="fa fa-sign-in"></i> <span>Login Page</span></a></li>

            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
</#macro>




<#--公共底部模板footer-->
<#macro footer mode='' model_js='' require_js=''>

    <!--footer section start-->
    <footer>
        2017 &copy; write by <a href="#" target="_blank">Peppa pig</a>
    </footer>
    <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${context.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${context.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${context.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${context.contextPath}/js/bootstrap.min.js"></script>
<script src="${context.contextPath}/js/modernizr.min.js"></script>
<script src="${context.contextPath}/js/jquery.nicescroll.js"></script>

<!--easy pie chart-->
<script src="${context.contextPath}/js/easypiechart/jquery.easypiechart.js"></script>
<script src="${context.contextPath}/js/easypiechart/easypiechart-init.js"></script>

<!--Sparkline Chart-->
<script src="${context.contextPath}/js/sparkline/jquery.sparkline.js"></script>
<script src="${context.contextPath}/js/sparkline/sparkline-init.js"></script>

<!--icheck -->
<script src="${context.contextPath}/js/iCheck/jquery.icheck.js"></script>
<script src="${context.contextPath}/js/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="${context.contextPath}/js/flot-chart/jquery.flot.js"></script>
<script src="${context.contextPath}/js/flot-chart/jquery.flot.tooltip.js"></script>
<script src="${context.contextPath}/js/flot-chart/jquery.flot.resize.js"></script>


<!--Morris Chart-->
<script src="${context.contextPath}/js/morris-chart/morris.js"></script>
<script src="${context.contextPath}/js/morris-chart/raphael-min.js"></script>

<!--Calendar-->
<script src="${context.contextPath}/js/calendar/clndr.js"></script>
<script src="${context.contextPath}/js/calendar/evnt.calendar.init.js"></script>
<script src="${context.contextPath}/js/calendar/moment-2.2.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

<!--Dashboard Charts-->
<script src="${context.contextPath}/js/dashboard-chart-init.js"></script>

<#if model_js == 'baiduMap'>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW">
        //v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
        //v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
    </script>
</#if>

<#if require_js != ''>
    <script src="${context.contextPath}/js/require.js" defer async data-main="${context.contextPath}/js/${require_js}"></script>
</#if>

<script type="text/javascript">
    var basePath = "${context.contextPath}";
</script>

</body>
</html>
</#macro>