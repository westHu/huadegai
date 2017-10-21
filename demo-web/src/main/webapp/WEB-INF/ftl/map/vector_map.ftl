<#include "common/public.ftl">
<@header title="地图展示" css_war = ""></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="地图展示" title_3="地图系统" title_4="地图展示" title_4_url="#" ></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            监测点展示
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="world-vmap" class="vmaps" style="height: 800px"></div>
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
<@js_lib js_war=""></@js_lib>

<script type="text/javascript">
    var markerArr = [
        { title: "城区1#监测点", point: "120.170742,30.256168", address: "大江东康山庄", tel: "12306" },
        { title: "一鑫针织1#监测点", point: "120.059712,30.247932", address: "拱墅区下沙路九堡镇（赤岗塔） ", tel: "18500000000" },
        { title: "绿科安监测点", point: "120.20071,30.20256", address: "解放东路交叉路口", tel: "18500000000" },
        { title: "新龙家印染3#监测点", point: "120.103549,30.175588", address: "环城北路120号", tel: "18500000000" },
        { title: "汤浦水库监测点", point: "120.123312,30.329948", address: "环城北路1000号", tel: "18500000000" },
        { title: "金立源监测点", point: "120.092877,30.245311", address: "环城北路1000号", tel: "18500000000" },
        { title: "康亭路监测点", point: "121.164592,30.206504", address: "环城北路1000号", tel: "18500000000" },
        { title: "中河双向监测点", point: "120.152587,30.175588", address: "之江路312号", tel: "18500000000" },
        { title: "岳湖监测点", point: "120.149579,30.252362", address: "杨公堤20号（原西山路20号）", tel: "18500000000" }

    ];
    //var markerArr =${param};

    function map_init() {
        console.info(markerArr);
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
        for (var i = 0; i < markerArr.length; i++) {
            var p0 = markerArr[i].point.split(",")[0]; //
            console.info(p0);
            var p1 = markerArr[i].point.split(",")[1]; //按照原数组的point格式将地图点坐标的经纬度分别提出来
            console.info(p1);
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
    //异步调用百度js
    function map_load() {
        var load = document.createElement("script");
        load.src = "http://api.map.baidu.com/api?v=2.0&ak=wP746Nxc9dhwGHc68oAQviyW&callback=map_init";
        document.body.appendChild(load);
    }
    window.onload = map_load;
</script>
</body>
</html>
