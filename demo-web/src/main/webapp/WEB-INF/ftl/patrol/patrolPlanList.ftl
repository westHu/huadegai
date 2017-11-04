<#include "common/public.ftl">
<@header title="巡检计划" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css,jquery_confirm,jquery_easyui">
<style>
    .trclick td
    {
        background: #c4e8f5 !important;
    }
</style>
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="巡检计划"  title_3="巡检管理" title_4="巡检计划" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">新增巡检计划</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/patrol/planCreate">新增巡检计划</a></li>
                                    <li><a href="#">导入巡检计划</a></li>
                                    <li><a href="#">导出巡检计划</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table id="plan-table" class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>巡检计划</th>
                                            <th>描述</th>
                                            <th>创建人</th>
                                            <th>开始时间</th>
                                            <th>结束时间</th>
                                            <th>时间间隔</th>
                                            <th>状态</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list pager.getList() as obj>
                                            <tr id="${obj.id}">
                                                <td>${obj.planName}</td>
                                                <td>${obj.planDesc}</td>
                                                <td>${obj.planCreater}</td>
                                                <td>${obj.planBegin?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>${obj.planEnd?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>${obj.planPerHour} 小时</td>
                                                <td><#if obj.status == true>启用<#else>停用</#if></td>
                                                <td>${obj.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                                            操&nbsp作 <span class="caret"></span>
                                                        </button>
                                                        <ul role="menu" class="dropdown-menu">
                                                            <li><a href="#" >编辑巡检计划</a></li>
                                                            <li><a href="javascript:delete_patrol_plan(${obj.id})" >删除巡检计划</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="javascript:execute_plan(${obj.id})" >开启执行</a></li>
                                                            <li><a href="javascript:close_plan(${obj.id})" >关闭执行</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                                <@hup_pagination  showBegin = "${ (pager.currentPage-1) * pager.pageSize + 1 }"  showEnd = "${pager.currentPage * pager.pageSize}"></@hup_pagination>
                            </section>
                        </div>
                    </section>
                </div>
            </div>

            <#--http://www.cnblogs.com/wujy/p/3897501.html-->
            <div class="row">
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            巡检路线图(推荐)
                        </header>
                        <#--<div class="panel-body" style="height:400px;">-->
                            <section id="unseen" style="width:100%;height:400px;">
                                <div id="allmap" style="height: inherit"></div>
                            </section>
                        <#--</div>-->
                    </section>
                </div>

                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            巡检设备
                        </header>
                        <#--<div class="panel-body" style="height:400px">-->
                            <section id="unseen" style="width:100%;height:400px">
                                <table id="plan-detail-dg" style="height: 400px"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,singleSelect:true,pagination:true,url:'${context.contextPath}/patrol/planDetailListJson',method:'get'">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'deviceCode',width:60,align:'left'">设备编码</th>
                                        <th data-options="field:'deviceName',width:60,align:'left'">设备名称</th>
                                        <th data-options="field:'deviceModel',width:40,align:'left'">设备型号</th>
                                        <th data-options="field:'deviceSpec',width:40,align:'left'">设备规格</th>
                                        <th data-options="field:'deviceBrand',width:40,align:'left'">设备品牌</th>
                                        <th data-options="field:'_operate',width:40,align:'center',
                                                formatter: function(value,row,index){return '<a>编辑</a> | <a>删除</a>'}">操作</th>
                                    </tr>
                                    </thead>
                                </table>
                            </section>
                        <#--</div>-->
                    </section>
                </div>
            </div>

        </div>
        <footer>
            2017 &copy; tansfar by hup
        </footer>
    </div>
</section>
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,paging-hup,jquery_confirm,jquery_easyui">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW"></script>
</@js_lib>
<script type="text/javascript">
    //定义集合用来存放沿线的坐标值
    var chartData = [];
    //加载地图
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(118.10000, 24.46667), 11);
    var walking = new BMap.WalkingRoute(map, { renderOptions: { map: map, autoViewport: true} });
    var startpoint = new BMap.Point(118.112917, 24.435153);
    var endpoint = new BMap.Point(118.1086487, 24.439108);
    walking.search(startpoint, endpoint);
    //通过setSearchCompleteCallback回调事件可以把步行间的坐标信息获取
    walking.setSearchCompleteCallback(function (rs) {
        var pts = walking.getResults().getPlan(0).getRoute(0).getPath();
        for (var i = 0; i < pts.length; i++) {
            chartData.push(new BMap.Point(pts[i].lat, pts[i].lng));
        }
    });
    //另外两点的步行路线
    var walkings = new BMap.WalkingRoute(map, { renderOptions: { map: map, autoViewport: true} });
    var twoPoint = new BMap.Point(118.1286555, 24.4491888);
    walkings.search(endpoint, twoPoint);
    walkings.setSearchCompleteCallback(function (rs) {
        var pts = walkings.getResults().getPlan(0).getRoute(0).getPath();
        for (var i = 0; i < pts.length; i++) {
            chartData.push(new BMap.Point(pts[i].lat, pts[i].lng));
        }
    });
    //用来存放途经点的坐标
    var viaRouteData = [];
    viaRouteData.push(endpoint);

    $(function () {
        $("#btn_show").click(function () {
            //这边故意让它晚一秒运行，因为上面获取坐标信息是比较慢又是异步
            setTimeout(ShowRoute, 1000);
        });
    });

    function ShowRoute() {
        var firstPoint;
        var endPoint;
        var newChartData = [];
        //对坐标点重新定义
        $.each(chartData, function (item, value) {
            newChartData.push(new BMap.Point(value.lat, value.lng));
        });
        //为了获得起点及终点的坐标值,方便对它进行文字处理
        firstPoint = newChartData[0];
        endPoint = newChartData[newChartData.length - 1];
        //加载地图
        var maps = new BMap.Map("r-result");
        maps.centerAndZoom(new BMap.Point(118.10000, 24.46667), 15);
        //把步行线路的坐标集合转化成折线
        var polyline = new BMap.Polyline(newChartData, { strokeColor: "red", strokeWeight: 6, strokeOpacity: 0.5 });
        maps.addOverlay(polyline);

        //对起点、终点、途经点做一个简单的处理，泡泡跟文字提示
        var m1 = new BMap.Marker(firstPoint);
        var m2 = new BMap.Marker(endPoint);
        maps.addOverlay(m1);
        maps.addOverlay(m2);
        var lab1 = new BMap.Label("起点", { position: firstPoint });
        var lab2 = new BMap.Label("终点", { position: endPoint });
        maps.addOverlay(lab1);
        maps.addOverlay(lab2);

        $.each(viaRouteData, function (item, value) {
            var m = new BMap.Marker(value);
            maps.addOverlay(m);
            var lab = new BMap.Label("途经点", { position: value });
            maps.addOverlay(lab);
        });
    }
</script>

<script>
    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        console.info("tip = " + tip)
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
        //巡检设备列表
        $('#plan-detail-dg').datagrid();

        $("#plan-table tr:gt(0)").bind("click", function () {
        //$(this).css("background","#FF0000").siblings().css("background","#ffffff");
            if($(this).hasClass("trclick")){
                $(this).removeClass("trclick");
            }else{
                $(this).parent().find("tr").removeClass("trclick");
                $(this).addClass("trclick");
                //加载巡检设备
                var queryParams = $('#plan-detail-dg').datagrid('options').queryParams;
                queryParams.planId = $(this).attr("id") ;
                $('#plan-detail-dg').datagrid('options').queryParams=queryParams;
                $("#plan-detail-dg").datagrid('reload');
            }
        });

    });

    function delete_patrol_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/planDelete";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        console.info("postData= " + postData);
                        $.ajax({
                            url: url,
                            type: 'delete',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
                                }
                            }
                        });
                    }
                },
                cancel: {
                    text: "取消",
                    btnClass: 'btn-primary',
                    keys: ['esc'],
                    /*action:function () {
                        console.info("你点击了取消按钮！")
                    }*/
                }
            }
        });
    }


    function execute_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '启动提示！',
            content: '确定要启动该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/executePlan";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        $.ajax({
                            url: url,
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
                                }
                            }
                        });
                    }
                },
                cancel: {
                    text: "取消",
                    btnClass: 'btn-primary',
                    keys: ['esc'],
                    /*action:function () {
                        console.info("你点击了取消按钮！")
                    }*/
                }
            }
        });
    }


    function close_plan(id) {
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '关闭提示！',
            content: '确定要关闭该巡检计划吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/closePlan";
                        var postData = {id: id};
                        postData = JSON.stringify(postData);
                        $.ajax({
                            url: url,
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: postData,
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == "0") {
                                    location.href= "${context.contextPath}/patrol/planList?msg="+data.description;
                                }
                            }
                        });
                    }
                },
                cancel: {
                    text: "取消",
                    btnClass: 'btn-primary',
                    keys: ['esc'],
                    /*action:function () {
                        console.info("你点击了取消按钮！")
                    }*/
                }
            }
        });
    }


    function TipsNotice(title, text) {
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image:  '${absolutePath}/images/notice.jpg',
            sticky: false,
            time: 3000,
            speed:5000,
            position: 'bottom-right',
            class_name: 'gritter-light'
        });
    }

</script>

<script>
    //分页
    $("#page").paging({
        pageNo: ${pager.currentPage},
        totalPage: ${pager.pageCount},
        totalSize: ${pager.totalCount},
        callback: function(num) {
            var pageSize = $('#pageSize option:selected').val();
            var pageUrl =  "${context.contextPath}/patrol/planList?currentPage="+num+"&pageSize="+pageSize;
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
