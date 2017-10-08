<#include "common/public.ftl">
<@header title="短信列表" css_war="responsive_table,gritter_css,pickers_css,paging-hup_css">
</@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="短信管理"  title_3="消息管理" title_4="短信列表" title_4_url="#"></@pageHeading>
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">短信模板</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="${context.contextPath}/smsMessage/smsTemplateList">短信模板</a></li>
                                    <li><a href="${context.contextPath}/smsMessage/smsTemplateList">网关管理</a></li>
                                </ul>
                            </div>
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                             </span>
                        </header>
                        <div class="panel-body">
                            <div class=" form">
                                <form class="cmxform form-horizontal adminex-form" id="commentForm" method="post" action="${context.contextPath}/smsMessage/create">
                                    <div class="form-group ">
                                        <label for="cname" class="control-label col-lg-2">手机号 (*)</label>
                                        <div class="col-lg-10">
                                            <input class="form-control" id="mobile" name="mobile" minlength="2" placeholder="手机号，多个逗号分隔" required />
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="cemail" class="control-label col-lg-2">网关&类型 (*)</label>
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-lg-2">
                                                    <input class="form-control" name="gateway" placeholder="网关" value="阿里大鱼" readonly>
                                                </div>
                                                <div class="col-md-2">
                                                    <select class="form-control" name="type">
                                                        <option value ="notification" selected>通知短信</option>
                                                        <option value ="marketing">营销短信</option>
                                                        <option value="other">其他类型</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="curl" class="control-label col-lg-2">模板编码 (-)</label>
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-lg-2">
                                                    <div class="input-group">
                                                        <input class="form-control" name="templateCode" placeholder="模板编码">
                                                        <span class="input-group-btn">
                                                             <a data-toggle="modal" href="#templateList">
                                                                <button type="button" class="btn btn-default">
                                                                   <i class="fa fa-search"></i>
                                                                </button>
                                                             </a>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <input class="form-control" name="templateParam" placeholder="模板参数">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="comment" class="control-label col-lg-2">短信内容 (*)</label>
                                        <div class="col-lg-10">
                                            <textarea class="form-control " id="content" name="content" placeholder="短信内容" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit">发送</button>
                                            <button class="btn btn-default" type="reset">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </section>
                    <!-- Modal -->
                    <div class="modal fade" id="templateList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">短信模板列表</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-striped table-condensed cf">
                                        <thead class="cf">
                                        <tr>
                                            <th>模板编码</th>
                                            <th>模板内容</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>code-1</td>
                                            <td>你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>ADELAIDEADELAIDEADELAIDEADELAIDEADELAIDEADELAIDE</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        <tr>
                                            <td>code-1</td>
                                            <td>ACRUX 你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！</td>

                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-primary" type="button">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- modal -->
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="btn-group">
                                <button class="btn btn-primary" type="button">导入导出</button>
                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul role="menu" class="dropdown-menu">
                                    <li><a href="#">导入设备</a></li>
                                    <li><a href="#">导出设备</a></li>
                                    <li><a href="#">打印列表</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">保存PDF</a></li>
                                </ul>
                            </div>
                        </header>
                        <div class="panel-body">
                            <section id="unseen">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>手机号</th>
                                            <th>短信内容</th>
                                            <th>模板编码</th>
                                            <th>模板内容</th>
                                            <th>发送网关</th>
                                            <th>发送时间</th>
                                            <th>状态</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list page.getList() as obj>
                                            <tr>
                                                <td>${obj.mobile}</td>
                                                <td>${obj.content}</td>
                                                <td>${obj.templateCode}</td>
                                                <td>${obj.templateParam}</td>
                                                <td>${obj.gateway}</td>
                                                <td>${obj.executeTime?string("yyyy-MM-dd HH:ss:mm")}</td>
                                                <td>${obj.status}</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>

                                <@hup_pagination  showBegin = "${ (page.currentPage-1) * page.pageSize + 1 }"  showEnd = "${page.currentPage * page.pageSize}"></@hup_pagination>
                            </section>
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

<!-- Placed js at the end of the document so the pages load faster -->
<@js_lib js_war="gritter_script,pickers_plugins,pickers_initialization,paging-hup"></@js_lib>
<script>

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
        pageNo: ${page.currentPage},
        totalPage: ${page.pageCount},
        totalSize: ${page.totalCount},
        callback: function(num) {
            //alert(num)
            var pageSize = $('#pageSize option:selected').val();
            console.info(pageSize);
            var pageUrl =  "${context.contextPath}/smsMessage?currentPage="+num+"&pageSize="+pageSize;
            console.info(pageUrl)
            location.href = pageUrl;
        }
    })
</script>
</body>
</html>
