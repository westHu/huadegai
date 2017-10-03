<#include "common/public.ftl">
<@header title="设备分类" css_war="treeview,gritter_css,icheck"></@header>
<body class="sticky-header">
<section>
    <@left title="导航栏"></@left>
    <div class="main-content" >
        <@notification title="通知"></@notification>
        <@pageHeading title_1="设备分类"  title_3="设备管理" title_4="设备分类树" title_4_url="${context.contextPath}/device/category"></@pageHeading>
        <hr/>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-right" id="nestable_list_menu">
                        <button type="button" class="btn btn-success" data-action="expand-all">Expand All</button>
                        <button type="button" class="btn btn-warning" data-action="collapse-all">Collapse All</button>
                    </div>
                </div>
            </div>

            <br>
            <div class="row">
                <div class="col-lg-6">
                    <section class="panel">
                        <header class="panel-heading">
                           设备分类树
                        </header>
                        <div class="panel-body">
                            <div id="deviceCategoryTree"></div>
                        </div>
                    </section>

                </div>
                <div class="col-lg-6">

                    <section class="panel">
                        <header class="panel-heading custom-tab ">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#view" data-toggle="tab">展示面板</a>
                                </li>
                                <li class="">
                                    <a href="#add" data-toggle="tab">新增子节点</a>
                                </li>
                            </ul>
                        </header>
                        <div class="panel-body">
                            <div class="tab-content">
                                <div class="tab-pane active" id="view">
                                    <form id="categoryForm" class="form-horizontal" action="#" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">父节点</label>
                                            <div class="col-lg-4">
                                                <p class="form-control-static" id="parentName"></p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">设备分类名称</label>
                                            <div class="col-lg-4">
                                                <input type="hidden" class="form-control" name="id" id="categoryId">
                                                <input class="form-control" name="name" id="categoryName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">设备分类描述</label>
                                            <div class="col-lg-4">
                                                <input class="form-control" name="description" id="categoryDesc">

                                            </div>
                                        </div>


                                        <span class="tools pull-right">
                                            <button class="btn btn-info" type="button">&nbsp修&nbsp改&nbsp</button>
                                            <button class="btn btn-info" type="button">&nbsp删&nbsp除&nbsp</button>
                                        </span>
                                    </form>
                                </div>

                                <div class="tab-pane" id="add">
                                    <p>阿里巴巴(1688.com)批发网是全球企业间(B2B)电子商务的著名品牌,
                                        为数千万网商提供海量商机信息和便捷安全的在线交易市场,
                                        也是商人们以商会友、真实互动的社区平台。
                                    </p>
                                    <#--<form id="categoryForm" class="form-horizontal" action="#" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">父节点</label>
                                            <div class="col-lg-4">
                                                <p class="form-control-static" id="parentName_add"></p>
                                                <input type="hidden" name="parentId" id="parentId">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">组织名称</label>
                                            <div class="col-lg-4">
                                                <input class="form-control" name="name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">组织描述</label>
                                            <div class="col-lg-4">
                                                <input class="form-control" name="description">

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">组织主管</label>
                                            <div class="col-lg-4">
                                                <input class="form-control" name="leaders">

                                            </div>
                                        </div>
                                        <span class="tools pull-right">
                                                <button class="btn btn-info">&nbsp新&nbsp增&nbsp</button>
                                        </span>
                                    </form>-->
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer class="sticky-footer">
            2014 &copy; transfar by hup
        </footer>
    </div>
</section>

<@js_lib js_war="treeview,gritter_css,icheck"></@js_lib>
<script>

    $(function(){
        var options = {
            bootstrap : true,
            showTags : true,
            levels : 2,
            showCheckbox : true,
            color: "black",
            backColor: "#EFF0F4",
            showBorder: true,
            showTags: true,
            highlightSelected: true,
            selectedColor: "#000000",
            selectedBackColor: "#03a806",
            checkedIcon : "glyphicon glyphicon-check",
            data : ${deviceCategoryTree},
            onNodeSelected : function(event, data) {
                showTab(data.id, data.text, data.categoryDesc, data.parentName);
            }
        };
        $('#deviceCategoryTree').treeview(options);

        //显示小提示
        var tip = '${msg}';
        if (tip !== null && tip !== ''){
            TipsNotice(null, tip);
        }
    });

    function showTab(id, name, desc, parentName) {
        $('#categoryId').val(id);
        $('#parentName').text(parentName);
        $('#categoryName').val(name);
        $('#categoryDesc').val(desc);
    }

    // 提示方法
    function TipsNotice(title, text) {
        $.gritter.add({
            title: title || " 温馨提示 NOTICE ",
            text:  text || "没有消息！",
            image: '${absolutePath}/images/notice.jpg',
            sticky: false,
            time: 3000,
            speed:5000,
            position: 'bottom-right',
            class_name: 'gritter-light'
        });
    }
</script>
</body>
</html>
