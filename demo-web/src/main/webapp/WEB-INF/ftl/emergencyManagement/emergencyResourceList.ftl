<#include "common/public.ftl">
<@header title="资源展示" css_war = "">
<style>
    .mail-navigation > li.active > a, .mail-navigation > li.active > a:hover, .mail-navigation > li.active > a:focus {
        background: #d8d8d8;
        color: #fff;
    }
</style>
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="资源展示" title_3="应急管理" title_4="资源展示" title_4_url="#" ></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-2">
                    <section class="panel">
                        <header class="panel-heading">
                            应急资源分类
                            <#--<span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>-->
                        </header>
                        <div class="panel-body">
                            <#--<div id="asia-vmap" class="vmaps"></div>-->
                            <ul class="nav nav-pills nav-stacked mail-navigation">
                                <li value="0" class="active" ><a href="#"> <i class="fa fa-certificate"></i> 应急物资设备  <span class="label label-info pull-right inbox-notification">1023</span></a></li>
                                <li value="1" ><a href="#"> <i class="fa fa-certificate"></i> 应急救援队伍  <span class="label label-info pull-right inbox-notification">20</span></a></li>
                                <li value="2" ><a href="#"> <i class="fa fa-certificate"></i> 应急专家资源  <span class="label label-info pull-right inbox-notification">14</span></a></li>
                                <li value="3" ><a href="#"> <i class="fa fa-certificate"></i> 应急通信资源  <span class="label label-danger pull-right inbox-notification">0</span></a></li>
                                <li value="4" ><a href="#"> <i class="fa fa-certificate"></i> 应急运输资源  <span class="label label-info pull-right inbox-notification">25</span></a></li>
                                <li value="5" ><a href="#"> <i class="fa fa-certificate"></i> 应急医疗资源  <span class="label label-info pull-right inbox-notification">15</span></a></li>
                                <li value="6" ><a href="#"> <i class="fa fa-certificate"></i> 应急避难场所  <span class="label label-info pull-right inbox-notification">10</span></a></li>

                            </ul>
                        </div>
                    </section>
                </div>

                <div class="col-sm-10">
                    <section class="panel">
                        <header class="panel-heading">
                            应急资源展示
                        </header>
                        <div class="panel-body">
                            <div id="world-vmap" class="vmaps"></div>
                        </div>
                    </section>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            监测点详情
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="asia-vmap" class="vmaps"></div>
                        </div>
                    </section>
                </div>
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            参数
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="australia-vmap" class="vmaps"></div>
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
<@js_lib js_war="">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW"></script>
</@js_lib>

<script type="text/javascript">

    var markerArr = [
        { title: "东城广场物资点", point: "120.170742,30.256168", address: "大江东康山庄", tel: "12306" },
        { title: "九堡三区物资点", point: "120.059712,30.247932", address: "拱墅区下沙路九堡镇（赤岗塔） ", tel: "18500000000" },
        { title: "解放东路物资点", point: "120.20071,30.20256", address: "解放东路交叉路口", tel: "18500000000" },
        { title: "环城北路物资点", point: "120.103549,30.175588", address: "环城北路120号", tel: "18500000000" },
        { title: "汤浦水库物资点", point: "120.123312,30.329948", address: "环城北路1000号", tel: "18500000000" },
        { title: "城西银泰物资点", point: "120.092877,30.245311", address: "环城北路1000号", tel: "18500000000" },
        { title: "康亭路口物资点", point: "121.164592,30.206504", address: "环城北路1000号", tel: "18500000000" },
        { title: "中河双向物资点", point: "120.152587,30.175588", address: "之江路312号", tel: "18500000000" },
        { title: "杨公堤物资点", point: "120.149579,30.252362", address: "杨公堤20号（原西山路20号）", tel: "18500000000" }
    ];

    //左边菜单的变化
    $("li").each(function () {
        $(this).bind("click", function () {
            // alert(this.innerHTML);
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            } else {
                $(this).addClass("active");
            }
            var resource = new Array();
            $('.nav-pills .active').each(function () { resource.push($(this).val())});
            resource.join(",");
            console.info("resource = " + resource);
            if (resource.length > 0) {
                //markerArr.splice(0, markerArr.length);//清空数组
                markerArr = [];
                if(resource.contains(0)){
                    markerArr.push("{ title: \"东城广场物资点\", point: \"120.170742,30.256168\", address: \"大江东康山庄\", tel: \"12306\" }")
                }
                if(resource.contains(1)){
                    markerArr.push("{ title: \"解放东路物资点\", point: \"120.20071,30.20256\", address: \"解放东路交叉路口\", tel: \"18500000000\" }")
                }
                if(resource.contains(2)){
                    markerArr.push("{ title: \"九堡三区物资点\", point: \"120.059712,30.247932\", address: \"拱墅区下沙路九堡镇（赤岗塔） \", tel: \"18500000000\" }")
                }
                if(resource.contains(3)){
                    markerArr.push("{ title: \"汤浦水库物资点\", point: \"120.123312,30.329948\", address: \"环城北路1000号\", tel: \"18500000000\" }")
                }
                if(resource.contains(4)){
                    markerArr.push("{ title: \"康亭路口物资点\", point: \"121.164592,30.206504\", address: \"环城北路1000号\", tel: \"18500000000\" }")
                }
                if(resource.contains(5)){
                    markerArr.push("{ title: \"杨公堤物资点\", point: \"120.149579,30.252362\", address: \"杨公堤20号（原西山路20号）\", tel: \"18500000000\" }")
                }
                if(resource.contains(6)){
                    markerArr.push("{ title: \"环城北路物资点\", point: \"120.103549,30.175588\", address: \"环城北路120号\", tel: \"18500000000\" }")
                }
                //markerArr.join(",");
                console.info("markerArr = " + markerArr);
                map_init();
            }
        });
    })




    //var markerArr = ${param};

    function map_init() {
        //console.info(markerArr);
        var map = new BMap.Map("world-vmap"); // 创建Map实例
        var point = new BMap.Point(120.149579,30.252362); //地图中心点，广州市
        map.centerAndZoom(point, 13); // 初始化地图,设置中心点坐标和地图级别。
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

        var point = new Array(); //存放标注点经纬信息的数组
        var marker = new Array(); //存放标注点对象的数组
        var info = new Array(); //存放提示信息窗口对象的数组
        console.info(markerArr.length);
        for (var i = 0; i < markerArr.length; i++) {
            console.info(markerArr[i]);
            console.info(markerArr[i].point);
            var p0 = markerArr[i].point.split(",")[0]; //
            //console.info(p0);
            var p1 = markerArr[i].point.split(",")[1]; //按照原数组的point格式将地图点坐标的经纬度分别提出来
            //console.info(p1);
            point[i] = new window.BMap.Point(p0, p1); //循环生成新的地图点
            marker[i] = new window.BMap.Marker(point[i]); //按照地图点坐标生成标记
            map.addOverlay(marker[i]);
            //marker[i].setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            var label = new window.BMap.Label(markerArr[i].title, { offset: new window.BMap.Size(20, -10) });
            marker[i].setLabel(label);
            info[i] = new window.BMap.InfoWindow("<p style=’font-size:12px;lineheight:1.8em;’>" + markerArr[i].title + "</br>地址：" + markerArr[i].address + "</br> 电话：" + markerArr[i].tel + "</br></p>"); // 创建信息窗口对象
        }
        marker[0].addEventListener("mouseover", function () {
            this.openInfoWindow(info[0]);
        });
        marker[1].addEventListener("mouseover", function () {
            this.openInfoWindow(info[1]);
        });
        marker[2].addEventListener("mouseover", function () {
            this.openInfoWindow(info[2]);
        });
        marker[3].addEventListener("mouseover", function () {
            this.openInfoWindow(info[3]);
        });
    }

    window.onload = map_init
    //异步调用百度js
   /* function map_load() {
        var load = document.createElement("script");
        load.src = "http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW&callback=map_init";
        document.body.appendChild(load);
    }
    window.onload = map_load;*/
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
