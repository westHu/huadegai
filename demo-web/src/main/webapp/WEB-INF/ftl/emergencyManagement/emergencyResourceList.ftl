<#include "common/public.ftl">
<@header title="应急信息展示" css_war = "jquery_easyui">
<style>
    .datagrid-row {
        height: 30px;
    }
    .mail-navigation>li>a {
        padding: 5px 20px;
    }

    .with-notification a{
        position: relative;
    }
    .with-notification a span{
        position: absolute;
        right: -6px;
        top: -7px;

        display: inline-block;
        min-width: 14px;
        height: 14px;
        line-height: 13px;
        padding: 0 4px;
        background-color: #03a806;
        border-radius: 7px;
        text-align: center;
        font-size: 12px;
        color: #ffffff;
        z-index: 10000;
    }

    .with-notification  li.active a{
        background: #1d3d5a;
        color: #fff;
</style>
</@header>
<body class="sticky-header">

<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="应急信息展示" title_3="应急管理" title_4="应急信息展示" title_4_url="#" ></@pageHeading>
        <div class="wrapper">
            <ul class="directory-list with-notification">
                <li data-value="Material"><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急物资设备 <span class="hup-badge">192</span></a></li>
                <li data-value="Team">    <a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急救援队伍 <span class="hup-badge">5</span></a></li>
                <li data-value="Zj">      <a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急专家资源 <span class="hup-badge">12</span></a></li>
                <li data-value="Communication"> <a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急通信资源 <span class="hup-badge">93</span></a></li>
                <li data-value="Transportation"><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急运输资源 <span class="hup-badge">8</span></a></li>
                <li data-value="Medical"><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急医疗资源 <span class="hup-badge">4</span></a></li>
                <li data-value="RefugePlace"><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急避难场所 <span class="hup-badge">18</span></a></li>
                <li data-value="RefugePlace" ><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>应急机构管理 <span class="hup-badge">10</span></a></li>
                <li data-value="RefugePlace" ><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>联动单位管理 <span class="hup-badge">7</span></a></li>
                <li data-value="RefugePlace" ><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>敏感单位管理 <span class="hup-badge">14</span></a></li>
                <li data-value="RefugePlace" ><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>危险品 <span class="hup-badge">24</span></a></li>
                <li data-value="RefugePlace" ><a href="#"><i class="fa fa-bolt" style="padding-right: 5px;"></i>风险源 <span class="hup-badge">43</span></a></li>
                <li><a href="#">...</a></li>
            </ul>
            <br>
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            应急资源展示
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="emergencyMap" class="vmaps"></div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            资源点列表
                        </header>
                        <div class="my-panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="europe-vmap" class="vmaps">
                                <table id="point-dg" &lt;#&ndash;title="Custom DataGrid Pager"&ndash;&gt; style="width:100%;height:400px"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:false,singleSelect:true,pagination:true,url:'${context.contextPath}/emergencyResource/pointListByType',method:'get'">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'type',width:60,align:'left'">类型</th>
                                        <th data-options="field:'name',width:100,align:'left'">名称</th>
                                        <th data-options="field:'location',width:180,align:'left'">地址</th>
                                        <th data-options="field:'unit',width:100,align:'left'">单位</th>
                                        <#--<th data-options="field:'agent',width:60,align:'left'">负责人</th>
                                        <th data-options="field:'telephone',width:60,align:'left'">联系方式</th>-->
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            资源详情列表
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="australia-vmap" class="vmaps">
                                <table id="detail-dg" style="width:100%;height:95%"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:false,singleSelect:true,pagination:true,url:'${context.contextPath}/emergencyResource/detailListByPoint',method:'get'">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'pointName',width:60,align:'left'">名称</th>
                                        <th data-options="field:'name',width:60,align:'left'">名称</th>
                                        <th data-options="field:'number',width:30,align:'left'">数量</th>
                                        <th data-options="field:'status',width:30,align:'left'">状态</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer>
            2017 &copy; transfar by hup
        </footer>
    </div>
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="jquery_easyui">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW"></script>
</@js_lib>

<script type="text/javascript">
    //左边菜单的变化
    $("li").each(function () {
        $(this).bind("click", function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            } else {
                $(this).addClass("active");
            }
            var resource = new Array();
            $('.with-notification .active').each(function () {resource.push($(this).data("value")) });
            resource.join(",");
            console.info("resource = " + resource);
            //查询参数直接添加在queryParams中
            var queryParams = $('#point-dg').datagrid('options').queryParams;
            queryParams.types = resource.toString();
            $('#point-dg').datagrid('options').queryParams=queryParams;
            $("#point-dg").datagrid('reload');

            $.ajax({
                url: "${context.contextPath}/emergencyResource/pointJson?types="+resource,
                type: 'post',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.status == "0") {
                        map_view(data.result);
                    }
                }
            });
        });
    })

    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
        map_init();

        $('#point-dg').datagrid({
            onClickRow: function (index, row) {  //easyui封装好的时间（被单机行的索引，被单击行的值）
                map.centerAndZoom(new BMap.Point(row["coordinateX"], row["coordinateY"]), 15);
                var circle = new BMap.Circle(new BMap.Point(row["coordinateX"], row["coordinateY"]),1000);
                circle.setFillColor("#4792d9"); //填充颜色
                circle.setStrokeWeight(1);// 设置圆形边线的宽度，取值为大于等于1的整数。
                circle.setFillOpacity(0.3);// 返回圆形的填充透明度。
                circle.setStrokeOpacity(0.3);// 设置圆形的边线透明度，取值范围0 - 1。
                // 这样画圆 可编辑的圆 这两句js代码的位置不可改变
                map.addOverlay(circle);// 把圆添加到地图中

                //展示应急资源详情
                var queryParams = $('#detail-dg').datagrid('options').queryParams;
                queryParams.point = row["id"];
                $('#detail-dg').datagrid('options').queryParams=queryParams;
                $("#detail-dg").datagrid('reload');

            }
        });
        $('#detail-dg').datagrid({
            onClickRow: function (index, row) {  //easyui封装好的时间（被单机行的索引，被单击行的值）
            }
        });
    });

    var map;
    var marker = new Array(); //存放标注点对象的数组
    function map_init() {
        map = new BMap.Map("emergencyMap"); // 创建Map实例
        var point = new BMap.Point(120.185006,30.251013); //地图中心点，
        map.centerAndZoom(point, 12); // 初始化地图,设置中心点坐标和地图级别。
        map.enableScrollWheelZoom(true); //启用滚轮放大缩小
        //向地图中添加缩放控件
        var ctrlNav = new window.BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT,
            type: BMAP_NAVIGATION_CONTROL_LARGE
        });
        map.addControl(ctrlNav);

        //向地图中添加缩略图控件
        var ctrlOve = new window.BMap.OverviewMapControl({
            anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
            isOpen: 1
        });
        map.addControl(ctrlOve);

        //向地图中添加比例尺控件
        var ctrlSca = new window.BMap.ScaleControl({
            anchor: BMAP_ANCHOR_BOTTOM_LEFT
        });
        map.addControl(ctrlSca);
    }

    function map_view(markerArr) {
        var point = new BMap.Point(120.185006,30.251013); //地图中心点，
        map.centerAndZoom(point, 12); // 初始化地图,设置中心点坐标和地图级别。
        if (markerArr == undefined || markerArr.length ==0) {
            return;
        }
        //先隐藏所有从新加层
        for (var i = 0; i < marker.length; i++) {
            marker[i].hide();
        }
        var data = eval(markerArr);
        for (var i = 0; i < data.length; i++) {
            var p0 = data[i].coordinateX;
            var p1 = data[i].coordinateY;
            //循环生成point
            var point = new window.BMap.Point(p0, p1); //循环生成新的地图点
            var index;
            switch(data[i].type){
                case "Material":        index = 0; break;
                case "Team":            index = 1; break;
                case "Communication":   index = 2; break;
                case "Medical":         index = 3; break;
                case "Transportation":  index = 4; break;
                case "RefugePlace" :    index = 5; break;
                default: index = 0;
            }
            //循环生成图标
            var myIcon = new BMap.Icon("${absolutePath}/images/emergency/markers.png",
                    new BMap.Size(23, 25), {
                        offset: new BMap.Size(10, 25),
                        imageOffset: new BMap.Size(0, 0 -  index * 25)

                    });

            //循环生成marker
            marker[i] = new window.BMap.Marker(point, { icon: myIcon });  //按照地图点坐标生成标记
            map.addOverlay(marker[i]);
            //marker[i].setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画

            //循环生成label
            var label = new window.BMap.Label(data[i].desc, { offset: new window.BMap.Size(20, -10) });
            marker[i].setLabel(label);

            //循环添加InfoWindow
            addInfo("<p style=’font-size:12px;lineheight:1.8em;’>" + data[i].desc + "</br>地址：" + data[i].location + "</br> 电话：" + data[i].name + "</br></p>",marker[i]);
        }
        //点击显示详情
        function addInfo(txt,marker){
            var infoWindow = new BMap.InfoWindow(txt);
            marker.addEventListener("click", function(){this.openInfoWindow(infoWindow);});
        }
    }
</script>

<script>
    Array.prototype.contains = function(obj) {
        var i = this.length;
        while (i--) {
            if (this[i] === obj) {
                return true;
            }
        }
        return false;
    }
</script>
</body>
</html>
