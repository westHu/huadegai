<#include "common/public.ftl">
<@header title="应急响应展示" css_war = "jquery_easyui">
<style>
    .datagrid-row {
        height: 30px;
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
        <@pageHeading title_1="应急响应展示" title_3="应急管理" title_4="应急响应展示" title_4_url="#" ></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            应急响应展示
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="responseMap" class="vmaps" style="height: 600px"></div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-7">
                    <section class="panel">
                        <header class="panel-heading">
                            报警列表
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="europe-vmap" class="vmaps">
                                <table id="alarmEvent-dg"  style="width:98%;height:95%"
                                       data-options="rownumbers:true,fitColumns:true,nowrap:true,collapsible:true,singleSelect:true,pagination:true,url:'${context.contextPath}/emergencyResponse/alarmEventList',method:'get'">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'name',width:60,align:'left'">名称</th>
                                        <th data-options="field:'desc',width:100,align:'left',
                                                            formatter: function(value,row,index){return '<span  title='+value+'>'+value+'</span>'}">描述</th>
                                        <th data-options="field:'type',width:40,align:'left'">类型</th>
                                        <th data-options="field:'degree',width:20,align:'left'">级别</th>
                                        <th data-options="field:'reporter',width:40,align:'left'">报告者</th>
                                        <th data-options="field:'reportDate',width:60,align:'left'">报告时间</th>
                                        <th data-options="field:'status',width:30,align:'left'">状态</th>
                                        <th data-options="field:'_operate',width:20,align:'center',formatter:formatOper"">操作</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-sm-5">
                    <section class="panel">
                        <header class="panel-heading">
                            报警详情
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>
                        </header>
                        <div class="panel-body" style="border-color:#FFFFFF;padding: 0px;">
                            <div id="australia-vmap" class="vmaps" style="width: 95%; padding-top: 15px">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label  class="col-lg-3 col-sm-3 control-label">警报名称</label>
                                        <div class="col-lg-9">
                                            <div class="iconic-input">
                                                <i class="fa fa-bell"></i>
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-3 col-sm-3 control-label">警报描述</label>
                                        <div class="col-lg-9">
                                            <div class="iconic-input">
                                                <i class="fa fa-bell"></i>
                                                <input type="text" class="form-control" placeholder="警报事件描述">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-3 col-sm-3 control-label">类型&级别</label>
                                        <div class="col-lg-4">
                                            <div class="iconic-input">
                                                <select class="form-control">
                                                    <option value="水管爆裂" >水管爆裂</option>
                                                    <option value="电气故障" >电气故障</option>
                                                    <option value="地区火警" >地区火警</option>
                                                    <option value="水位超线" >水位超线</option>
                                                    <option value="设备损坏" >设备损坏</option>
                                                </select>
                                                <#--<input type="text" class="form-control" placeholder="类型">-->
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="iconic-input">
                                                <select class="form-control">
                                                    <option value="1" >应急 1级 白色预警信号</option>
                                                    <option value="2" >应急 2级 蓝色预警信号</option>
                                                    <option value="3" >应急 3级 黄色预警信号</option>
                                                    <option value="4" >应急 4级 橙色预警信号</option>
                                                    <option value="5" >应急 5级 红色预警信号</option>
                                                </select>
                                                <#--<input type="text" class="form-control" placeholder="级别">-->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-3 col-sm-3 control-label">警报起因</label>
                                        <div class="col-lg-9">
                                            <div class="iconic-input">
                                                <i class="fa fa-bell"></i>
                                                <input type="text" class="form-control" placeholder="事件起源 可先进行预测">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label col-lg-3">事件地址</label>
                                        <div class="col-lg-9">
                                            <div class="input-group m-bot15">
                                              <span class="input-group-btn">
                                                <button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
                                              </span>
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit">添加报警</button>
                                            <button class="btn btn-default" type="button">取消</button>
                                        </div>
                                    </div>

                                </form>
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
    jQuery(document).ready(function() {
        //显示小提示
        var tip = '${msg}';
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
        map_init();

        $('#alarmEvent-dg').datagrid({
            onClickRow: function (index, row) {  //easyui封装好的时间（被单机行的索引，被单击行的值）
                var point = new BMap.Point(row["coordinateX"], row["coordinateY"]);
                var myIcon = new BMap.Icon("${absolutePath}/images/emergency/markers.png",
                        new BMap.Size(23, 25), {
                            offset: new BMap.Size(10, 25),
                            imageOffset: new BMap.Size(0, 0 -  10 * 25)

                        });

                //循环生成marker
                var marker = new window.BMap.Marker(point, { icon: myIcon });  //按照地图点坐标生成标记
                map.addOverlay(marker);
                map.centerAndZoom(point, 15);
                //map.setMapType(BMAP_PERSPECTIVE_MAP);
                var circle = new BMap.Circle(new BMap.Point(row["coordinateX"], row["coordinateY"]),1500);
                circle.setFillColor("#d91e0b"); //填充颜色
                circle.setStrokeWeight(1);// 设置圆形边线的宽度，取值为大于等于1的整数。
                circle.setFillOpacity(0.3);// 返回圆形的填充透明度。
                circle.setStrokeOpacity(0.3);// 设置圆形的边线透明度，取值范围0 - 1。
                // 这样画圆 可编辑的圆 这两句js代码的位置不可改变
                map.addOverlay(circle);// 把圆添加到地图中

                //展示应急信息


            }
        });

    });

    function formatOper(val,row,index){
        return '<a href="#" onclick="editUser('+index+')">受理</a>';
    }

    var map;
    var marker = new Array(); //存放标注点对象的数组
    function map_init() {
        map = new BMap.Map("responseMap"); // 创建Map实例
        var point = new BMap.Point(120.185006,30.251013); //地图中心点，
        map.centerAndZoom(point, 12); // 初始化地图,设置中心点坐标和地图级别。
        map.enableScrollWheelZoom(true); //启用滚轮放大缩小
        //向地图中添加缩放控件
        var ctrlNav = new window.BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT,
            type: BMAP_NAVIGATION_CONTROL_LARGE
        });
        map.addControl(ctrlNav);
        map.addControl(new BMap.MapTypeControl());
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
