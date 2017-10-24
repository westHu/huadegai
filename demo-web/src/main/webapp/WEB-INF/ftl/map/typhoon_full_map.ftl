<#include "common/public.ftl">
<@header title="台风云图" css_war = ""></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="台风云图" title_3="地图系统" title_4="台风云图" title_4_url="#" ></@pageHeading>
        <div class="wrapper" style="height: 800px">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <a href="http://typhoon.weather.com.cn/gis/typhoon_full.shtml">中国天气网</a>
                            <span class="tool pull-right">
                                <button class="btn btn-sm btn-primary" onclick="refresh_Frame()"><i class="fa fa-refresh"></i></button>
                            </span>
                        </header>
                        <div class="panel-body" style="height: 750px">
                            <iframe width="280" scrolling="no" height="25" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3"></iframe>
                        </div>
                    </section>
                </div>


                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <a href="http://typhoon.weather.com.cn/gis/typhoon_full.shtml">中国天气网</a>
                            <span class="tool pull-right">
                                <button class="btn btn-sm btn-primary" onclick="refresh_Frame()"><i class="fa fa-refresh"></i></button>
                            </span>
                        </header>
                        <div class="panel-body" style="height: 750px">
                            <iframe id="my-frame" src="http://typhoon.weather.com.cn/gis/typhoon_full.shtml" width="100%" height="100%" frameBorder="0" scrolling="no"></iframe>
                        </div>
                    </section>
                </div>

                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <a href="http://typhoon.weather.com.cn/gis/typhoon_full.shtml">中国天气网</a>
                            <span class="tool pull-right">
                                <button class="btn btn-sm btn-primary" onclick="refresh_Frame()"><i class="fa fa-refresh"></i></button>
                            </span>
                        </header>
                        <div class="panel-body" style="height: 750px">
                            <IFRAME ID='ifm2' width="100%" height="85%" frameBorder="0" scrolling="no" src="http://home.cw.uitv.com.cn/weatherdetail.aspx?cityid=101210101"></iframe>
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
<script>
    function refresh_Frame() {
        $('#my-frame').attr('src', $('#my-frame').attr('src'));
    }
</script>
</body>
</html>
