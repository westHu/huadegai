
// 百度地图API功能
var map = new BMap.Map("world-vmap");
var point = new BMap.Point(116.404, 39.915);
map.centerAndZoom(point, 15);
map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.ScaleControl());
map.addControl(new BMap.OverviewMapControl());
map.addControl(new BMap.MapTypeControl());
map.setCurrentCity("北京");

$(document).ready(function(){
    alert(1111);

    $.getJSON("/mapJson", function(json){
        alert("JSON Data: " + json);
    });
});


var points = [
    [116.417, 39.909],
    [116.417, 39.919],
    [116.415, 39.913],
    [116.412, 39.921],
    [116.410, 39.915],
    [116.408, 39.920],
    [116.412, 39.912],
    [116.413, 39.915]
];


// 向地图添加标注
for( var i = 0;i < points.length; i++){
    var myIcon = new BMap.Icon("images/marker.png", new BMap.Size(50, 50));
    var point = new BMap.Point(points[i][0],points[i][1]);
    // 创建标注对象并添加到地图
    var marker = new BMap.Marker(point,{icon: myIcon});
    map.addOverlay(marker);
    //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    marker.addEventListener("click", function(){
        alert("您点击了标注");
    });
};

/*var opts = {
 width : 250,     // 信息窗口宽度
 height: 100,     // 信息窗口高度
 title : "Hello"  // 信息窗口标题
 }
 var infoWindow = new BMap.InfoWindow("Worlsdfffffffffffffffffffffffffffffffd", opts);  // 创建信息窗口对象
 map.openInfoWindow(infoWindow, point);*/      // 打开信息窗口



// 添加自定义覆盖物
var mySquare = new SquareOverlay(map.getCenter(), 100, "red");
map.addOverlay(mySquare);

