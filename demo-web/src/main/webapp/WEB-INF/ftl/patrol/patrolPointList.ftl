<#include "common/public.ftl">
<@header title="巡检点" css_war="jquery_confirm,jquery_easyui">
<style>
    .datagrid-row {
        height: 29px;
    }
    .datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber{
        text-overflow: ellipsis;
    }
</style>
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="巡检点"  title_3="巡检管理" title_4="巡检点" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            巡检点位展示
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="patrol-point-map" class="vmaps"></div>
                        </div>
                    </section>
                </div>


                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            巡检点位展示
                            <span class="pull-right">
                               <div class="btn-group">
                                    <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                        新增巡检点 <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#myModal2" data-toggle="modal">新增巡检点</a></li>
                                        <li><a href="#">导出巡检点</a></li>
                                    </ul>
                               </div>
                            </span>
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div class="vmaps">
                                <table id="point-dg"  style="width:98%;height:95%"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,singleSelect:true,pagination:true,url:'${context.contextPath}/patrol/pointListJson',method:'get'">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'pointName',width:40,align:'left'">名称</th>
                                        <th data-options="field:'pointDesc',width:60,align:'left',
                                                            formatter: function(value,row,index){return '<span  title='+value+'>'+value+'</span>'}">描述</th>
                                        <th data-options="field:'pointAgent',width:40,align:'left'">负责人</th>
                                        <th data-options="field:'coordinateX',width:40,align:'left'">坐标</th>
                                        <th data-options="field:'coordinateY',width:40,align:'left'">坐标</th>
                                        <th data-options="field:'createDate',width:60,align:'left'">报告时间</th>
                                        <th data-options="field:'_operate',width:40,align:'center',
                                                formatter: function(value,row,index){return '<a>编辑</a> | <a>删除</a>'}">操作</th>
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
                            巡检点位设备展示
                            <span class="pull-right">
                               <div class="btn-group">
                                    <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
                                        新增巡检设备 <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#point-detail" data-toggle="modal">新增巡检设备</a></li>
                                        <li><a href="#">导出巡检设备</a></li>
                                    </ul>
                               </div>
                            </span>
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div class="vmaps">
                                <table id="point-detail-dg"  style="width:98%;height:95%"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,singleSelect:true,pagination:true,url:'${context.contextPath}/patrol/pointDetailListJson',method:'get'">
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
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer>
            2017 &copy; tansfar by hup
        </footer>
    </div>
</section>


<!-- 添加巡检点  Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">添加巡检点</h4>
            </div>
            <form class="form-horizontal" role="form" action="/patrol/pointCreate" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label  class="col-lg-3 col-sm-3 control-label">巡检点名称</label>
                        <div class="col-lg-9">
                            <div class="iconic-input">
                                <i class="fa fa-bell"></i>
                                <input type="text" class="form-control" name="pointName" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-lg-3 col-sm-3 control-label">巡检点描述</label>
                        <div class="col-lg-9">
                            <div class="iconic-input">
                                <i class="fa fa-bell"></i>
                                <input type="text" class="form-control" placeholder="巡检点描述" name="pointDesc" required>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-lg-3 col-sm-3 control-label">负责人</label>
                        <div class="col-lg-9">
                            <div class="iconic-input">
                                <i class="fa fa-bell"></i>
                                <input type="text" class="form-control" placeholder="负责人" name="pointAgent">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label col-lg-3">地址</label>
                        <div class="col-lg-5">
                            <div class="input-group m-bot15">
                                              <span class="input-group-btn">
                                                <button type="button" class="btn btn-default">
                                                       <i class="fa fa-search"></i>
                                                </button>
                                              </span>
                                <input type="text" class="form-control" id="location" name="location" placeholder="具体地址，需要主动填入">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="input-group m-bot15">
                                <input type="text" class="form-control" id="coordinateX" name="coordinateX" placeholder="x坐标">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="input-group m-bot15">
                                <input type="text" class="form-control" id="coordinateY" name="coordinateY" placeholder="y坐标">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-warning"> 确定</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="point-detail" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">添加巡检设备</h4>
            </div>
            <form class="form-horizontal" role="form" action="/patrol/pointCreate" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label  class="col-lg-3 col-sm-3 control-label">巡检点名称</label>
                        <div class="col-lg-9">
                            <div class="iconic-input">
                                <i class="fa fa-bell"></i>
                                <input type="text" class="form-control" name="pointName" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-lg-3 col-sm-3 control-label">设备编码</label>
                        <div class="col-lg-9">
                            <div class="iconic-input">
                                <i class="fa fa-bell"></i>
                                <input type="text" class="form-control" placeholder="设备编码" name="deviceCode" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-warning"> 确定</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- modal -->
<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="jquery_confirm,jquery_easyui">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW"></script>
</@js_lib>
<script>
    var map;
    var circleArr = new Array();
    jQuery(document).ready(function() {
        map_init();

        $('#point-dg').datagrid({
            onClickRow: function (index, row) {  //easyui封装好的时间（被单机行的索引，被单击行的值）
                var point = new BMap.Point(row["coordinateX"], row["coordinateY"]);
                map.centerAndZoom(point, 15);
                if (!circleArr.contains(row["id"])) {
                    var circle = new BMap.Circle(point,1000);
                    circle.setFillColor("#d91e0b"); //填充颜色
                    circle.setStrokeWeight(1);// 设置圆形边线的宽度，取值为大于等于1的整数。
                    circle.setFillOpacity(0.3);// 返回圆形的填充透明度。
                    circle.setStrokeOpacity(0.3);// 设置圆形的边线透明度，取值范围0 - 1。
                    map.addOverlay(circle);// 把圆添加到地图中
                    circleArr.push(row["id"]);
                }
                //展示巡检点设备详情
                var queryParams = $('#point-detail-dg').datagrid('options').queryParams;
                queryParams.pointId = row["id"];
                $('#point-detail-dg').datagrid('options').queryParams=queryParams;
                $("#point-detail-dg").datagrid('reload');
            }
        });

        $('#point-detail-dg').datagrid();
    })

    function map_init() {
        map = new BMap.Map("patrol-point-map"); // 创建Map实例
        var point = new BMap.Point(120.185006,30.251013); //地图中心点，
        map.centerAndZoom(point, 13); // 初始化地图,设置中心点坐标和地图级别。
        map.enableScrollWheelZoom(true); //启用滚轮放大缩小
        var ctrlNav = new window.BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT,
            type: BMAP_NAVIGATION_CONTROL_LARGE
        });
        map.addControl(ctrlNav);
        map.addControl(new BMap.MapTypeControl());
        var ctrlOve = new window.BMap.OverviewMapControl({
            anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
            isOpen: 1
        });
        map.addControl(ctrlOve);
        var ctrlSca = new window.BMap.ScaleControl({
            anchor: BMAP_ANCHOR_BOTTOM_LEFT
        });
        map.addControl(ctrlSca);

        map_view(${patrolPoint})

    }

    function map_view(markerArr) {
        if (markerArr == undefined || markerArr.length ==0) {
            return;
        }
        var data = eval(markerArr);
        for (var i = 0; i < data.length; i++) {
            var p0 = data[i].coordinateX;
            var p1 = data[i].coordinateY;
            var point = new window.BMap.Point(p0, p1); //循环生成新的地图点
            var marker = new window.BMap.Marker(point);  //按照地图点坐标生成标记
            map.addOverlay(marker);
            var label = new window.BMap.Label(data[i].pointName, { offset: new window.BMap.Size(20, -10) });
            marker.setLabel(label);
            addInfo("<p style=’font-size:12px;lineheight:1.8em;’>" + data[i].pointName + "</br>描述：" + data[i].pointDesc + "</p>",marker);
        }
        //点击显示详情
        function addInfo(txt,marker){
            var infoWindow = new BMap.InfoWindow(txt);
            marker.addEventListener("click", function(){this.openInfoWindow(infoWindow);});
        }
    }

    /*function mass_view(mass) {
        if (document.createElement('canvas').getContext) {  // 判断当前浏览器是否支持绘制海量点
            if (mass == undefined || mass.length ==0) {
                return;
            }
            var data = eval(mass);
            var points = [];  // 添加海量点数据
            for (var i = 0; i < data.length; i++) {
                var p0 = data[i].coordinateX;
                var p1 = data[i].coordinateY;
                points.push(new BMap.Point(p0, p1));
            }
            var options = {
                size: BMAP_POINT_SIZE_SMALL,
                shape: BMAP_POINT_SHAPE_STAR,
                color: '#d91e0b'
            }
            var pointCollection = new BMap.PointCollection(points, options);  // 初始化PointCollection
            pointCollection.addEventListener('click', function (e) {
                alert('单击点的坐标为：' + e.point.lng + ',' + e.point.lat);  // 监听点击事件
            });
            map.addOverlay(pointCollection);  // 添加Overlay
        } else {
            alert('请在chrome、safari、IE8+以上浏览器查看本示例');
        }
    }*/


    function delete_point(id) {
        console.info("id = " + id);
        if (id == undefined || id == '') return;
        $.confirm({
            icon: 'fa fa-warning',
            title: '删除提示！',
            content: '确定要删除该巡检点吗?',
            type: 'dark',
            autoClose: 'cancel|8000',
            buttons: {
                ok: {
                    text: "确定",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        var url = "/patrol/pointDelete";
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
                                    location.reload();
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
