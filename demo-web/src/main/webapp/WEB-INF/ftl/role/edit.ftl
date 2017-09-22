<#include "common/public.ftl">
<@header title="新增角色" keywords="新增角色" description="新增角色">
<!--multi-select-->
<link rel="stylesheet" type="text/css" href="${context.contextPath}/js/jquery-multi-select/css/multi-select.css" />
</@header>


<body class="sticky-header">

<section>
    <!-- left side start-->
    <@left title="导航栏"></@left>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <@notification title="通知"></@notification>
        <!-- header section end-->

        <!-- page heading start-->
        <@pageHeading title_1="角色管理" title_2="首页" title_3="系统设置" title_4="新增角色"></@pageHeading>
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            角色管理
                        </header>
                        <div class="panel-body">
                            <form class="form-horizontal adminex-form" method="get">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">角色名称</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" name="role">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">角色描述</label>
                                    <div class="col-lg-4">
                                        <input type="text" class="form-control" name="description">

                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <section class="panel">
                        <header class="panel-heading">
                            选择资源
                        </header>
                        <div class="panel-body">
                            <form action="#" class="form-horizontal ">
                                <div class="form-group">
                                    <label class="control-label col-md-3">资源列表</label>
                                    <div class="col-md-9">
                                        <select multiple="multiple" class="multi-select" id="my_multi_select2"
                                                name="my_multi_select2[]">
                                            <optgroup label="NFC EAST">
                                                <option>Dallas Cowboys</option>
                                                <option>New York Giants</option>
                                                <option>Philadelphia Eagles</option>
                                                <option>Washington Redskins</option>
                                            </optgroup>
                                            <optgroup label="NFC NORTH">
                                                <option>Chicago Bears</option>
                                                <option>Detroit Lions</option>
                                                <option>Green Bay Packers</option>
                                                <option>Minnesota Vikings</option>
                                            </optgroup>
                                            <optgroup label="NFC SOUTH">
                                                <option>Atlanta Falcons</option>
                                                <option>Carolina Panthers</option>
                                                <option>New Orleans Saints</option>
                                                <option>Tampa Bay Buccaneers</option>
                                            </optgroup>
                                            <optgroup label="NFC WEST">
                                                <option>Arizona Cardinals</option>
                                                <option>St. Louis Rams</option>
                                                <option>San Francisco 49ers</option>
                                                <option>Seattle Seahawks</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
        <!-- page end-->
        </section>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2017 &copy; transfar by hup
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

<!--multi-select-->
<script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="${context.contextPath}/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script src="${context.contextPath}/js/multi-select-init.js"></script>

<!--common scripts for all pages-->
<script src="${context.contextPath}/js/scripts.js"></script>

</body>
</html>
