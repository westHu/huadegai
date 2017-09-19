<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>Responsive Table</title>

  <!--responsive table-->
  <link href="css/table-responsive.css" rel="stylesheet" />

  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="index.index.ftl"><img src="images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="index.index.ftl"><img src="images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->


        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">John Doe</a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                    <li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                    <li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li><a href="index.index.ftl"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
                <li class="menu-list"><a href=""><i class="fa fa-laptop"></i> <span>Layouts</span></a>
                    <ul class="sub-menu-list">
                        <li ><a href="blank_page.html"> Blank Page</a></li>
                        <li><a href="boxed_view.html"> Boxed Page</a></li>
                        <li><a href="leftmenu_collapsed_view.html"> Sidebar Collapsed</a></li>
                        <li><a href="horizontal_menu.html"> Horizontal Menu</a></li>

                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-book"></i> <span>UI Elements</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="general.html"> General</a></li>
                        <li><a href="buttons.html"> Buttons</a></li>
                        <li><a href="tabs-accordions.html"> Tabs & Accordions</a></li>
                        <li><a href="typography.html"> Typography</a></li>
                        <li><a href="slider.html"> Slider</a></li>
                        <li><a href="panels.html"> Panels</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-cogs"></i> <span>Components</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="grids.html"> Grids</a></li>
                        <li><a href="gallery.html"> Media Gallery</a></li>
                        <li><a href="calendar.html"> Calendar</a></li>
                        <li><a href="tree_view.html"> Tree View</a></li>
                        <li><a href="nestable.html"> Nestable</a></li>

                    </ul>
                </li>

                <li><a href="fontawesome.html"><i class="fa fa-bullhorn"></i> <span>Fontawesome</span></a></li>

                <li class="menu-list"><a href=""><i class="fa fa-envelope"></i> <span>Mail</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="mail.html"> Inbox</a></li>
                        <li><a href="mail_compose.html"> Compose Mail</a></li>
                        <li><a href="mail_view.html"> View Mail</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href=""><i class="fa fa-tasks"></i> <span>Forms</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="form_layouts.html"> Form Layouts</a></li>
                        <li><a href="form_advanced_components.html"> Advanced Components</a></li>
                        <li><a href="form_wizard.html"> Form Wizards</a></li>
                        <li><a href="form_validation.html"> Form Validation</a></li>
                        <li><a href="editors.html"> Editors</a></li>
                        <li><a href="inline_editors.html"> Inline Editors</a></li>
                        <li><a href="pickers.html"> Pickers</a></li>
                        <li><a href="dropzone.html"> Dropzone</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-bar-chart-o"></i> <span>Charts</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="flot_chart.html"> Flot Charts</a></li>
                        <li><a href="morris.html"> Morris Charts</a></li>
                        <li><a href="chartjs.html"> Chartjs</a></li>
                        <li><a href="c3chart.html"> C3 Charts</a></li>
                    </ul>
                </li>
                <li class="menu-list nav-active"><a href="#"><i class="fa fa-th-list"></i> <span>Data Tables</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="basic_table.html"> Basic Table</a></li>
                        <li><a href="dynamic_table.html"> Advanced Table</a></li>
                        <li class="active"><a href="responsive_table.responsive_table.ftl"> Responsive Table</a></li>
                        <li><a href="editable_table.html"> Edit Table</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="fa fa-map-marker"></i> <span>Maps</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="google_map.html"> Google Map</a></li>
                        <li><a href="vector_map.html"> Vector Map</a></li>
                    </ul>
                </li>
                <li class="menu-list"><a href=""><i class="fa fa-file-text"></i> <span>Extra Pages</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="profile.html"> Profile</a></li>
                        <li><a href="invoice.html"> Invoice</a></li>
                        <li><a href="pricing_table.html"> Pricing Table</a></li>
                        <li><a href="timeline.html"> Timeline</a></li>
                        <li><a href="blog_list.html"> Blog List</a></li>
                        <li><a href="blog_details.html"> Blog Details</a></li>
                        <li><a href="directory.html"> Directory </a></li>
                        <li><a href="chat.html"> Chat </a></li>
                        <li><a href="404.html"> 404 Error</a></li>
                        <li><a href="500.html"> 500 Error</a></li>
                        <li><a href="registration.html"> Registration Page</a></li>
                        <li><a href="lock_screen.html"> Lockscreen </a></li>
                    </ul>
                </li>
                <li><a href="login.login.ftl"><i class="fa fa-sign-in"></i> <span>Login Page</span></a></li>

            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

        <!--toggle button start-->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>
        <!--toggle button end-->

        <!--search start-->
        <form class="searchform" action="index.index.ftl" method="post">
            <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
        </form>
        <!--search end-->

        <!--notification menu start -->
        <div class="menu-right">
            <ul class="notification-menu">
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-tasks"></i>
                        <span class="badge">8</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">You have 8 pending task</h5>
                        <ul class="dropdown-list user-list">
                            <li class="new">
                                <a href="#">
                                    <div class="task-info">
                                        <div>Database update</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning">
                                            <span class="">40%</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="new">
                                <a href="#">
                                    <div class="task-info">
                                        <div>Dashboard done</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 90%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="90" role="progressbar" class="progress-bar progress-bar-success">
                                            <span class="">90%</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Web Development</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 66%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="66" role="progressbar" class="progress-bar progress-bar-info">
                                            <span class="">66% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Mobile App</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 33%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="33" role="progressbar" class="progress-bar progress-bar-danger">
                                            <span class="">33% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div>Issues fixed</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div style="width: 80%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" role="progressbar" class="progress-bar">
                                            <span class="">80% </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="new"><a href="">See All Pending Task</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge">5</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">You have 5 Mails </h5>
                        <ul class="dropdown-list normal-list">
                            <li class="new">
                                <a href="">
                                    <span class="thumb"><img src="images/photos/user1.png" alt="" /></span>
                                        <span class="desc">
                                          <span class="name">John Doe <span class="badge badge-success">new</span></span>
                                          <span class="msg">Lorem ipsum dolor sit amet...</span>
                                        </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="images/photos/user2.png" alt="" /></span>
                                        <span class="desc">
                                          <span class="name">Jonathan Smith</span>
                                          <span class="msg">Lorem ipsum dolor sit amet...</span>
                                        </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="images/photos/user3.png" alt="" /></span>
                                        <span class="desc">
                                          <span class="name">Jane Doe</span>
                                          <span class="msg">Lorem ipsum dolor sit amet...</span>
                                        </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="images/photos/user4.png" alt="" /></span>
                                        <span class="desc">
                                          <span class="name">Mark Henry</span>
                                          <span class="msg">Lorem ipsum dolor sit amet...</span>
                                        </span>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <span class="thumb"><img src="images/photos/user5.png" alt="" /></span>
                                        <span class="desc">
                                          <span class="name">Jim Doe</span>
                                          <span class="msg">Lorem ipsum dolor sit amet...</span>
                                        </span>
                                </a>
                            </li>
                            <li class="new"><a href="">Read All Mails</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge">4</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">Notifications</h5>
                        <ul class="dropdown-list normal-list">
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #1 overloaded.  </span>
                                    <em class="small">34 mins</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #3 overloaded.  </span>
                                    <em class="small">1 hrs</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #5 overloaded.  </span>
                                    <em class="small">4 hrs</em>
                                </a>
                            </li>
                            <li class="new">
                                <a href="">
                                    <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                    <span class="name">Server #31 overloaded.  </span>
                                    <em class="small">4 hrs</em>
                                </a>
                            </li>
                            <li class="new"><a href="">See All Notifications</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="images/photos/user-avatar.png" alt="" />
                        John Doe
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="#"><i class="fa fa-user"></i>  Profile</a></li>
                        <li><a href="#"><i class="fa fa-cog"></i>  Settings</a></li>
                        <li><a href="#"><i class="fa fa-sign-out"></i> Log Out</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!--notification menu end -->

        </div>
        <!-- header section end-->

        <!-- page heading start-->
        <div class="page-heading">
            <h3>
                Responsive Table
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="#">Dashboard</a>
                </li>
                <li>
                    <a href="#">Data Table</a>
                </li>
                <li class="active"> Responsive Table </li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Responsive table
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
            </header>
            <div class="panel-body">
                <section id="unseen">
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <th>Code</th>
                            <th>Company</th>
                            <th class="numeric">Price</th>
                            <th class="numeric">Change</th>
                            <th class="numeric">Change %</th>
                            <th class="numeric">Open</th>
                            <th class="numeric">High</th>
                            <th class="numeric">Low</th>
                            <th class="numeric">Volume</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list userList as user>
                                <tr>
                                    <td>${user.username}</td>
                                    <td>AUSTRALIAN AGRICULTURAL COMPANY LIMITED.</td>
                                    <td class="numeric">$1.38</td>
                                    <td class="numeric">-0.01</td>
                                    <td class="numeric">-0.36%</td>
                                    <td class="numeric">$1.39</td>
                                    <td class="numeric">$1.39</td>
                                    <td class="numeric">$1.38</td>
                                    <td class="numeric">9,395</td>
                                </tr>
                            </#list>
                        </tbody>
                    </table>
                </section>
            </div>
        </section>
        <section class="panel">
            <header class="panel-heading">
                Flip Scroll
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                 </span>
            </header>
            <div class="panel-body">
                <section id="flip-scroll">
                    <table class="table table-bordered table-striped table-condensed cf">
                        <thead class="cf">
                        <tr>
                            <th>Code</th>
                            <th>Company</th>
                            <th class="numeric">Price</th>
                            <th class="numeric">Change</th>
                            <th class="numeric">Change %</th>
                            <th class="numeric">Open</th>
                            <th class="numeric">High</th>
                            <th class="numeric">Low</th>
                            <th class="numeric">Volume</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>AAC</td>
                            <td>AUSTRALIAN AGRICULTURAL COMPANY LIMITED.</td>
                            <td class="numeric">$1.38</td>
                            <td class="numeric">-0.01</td>
                            <td class="numeric">-0.36%</td>
                            <td class="numeric">$1.39</td>
                            <td class="numeric">$1.39</td>
                            <td class="numeric">$1.38</td>
                            <td class="numeric">9,395</td>
                        </tr>
                        <tr>
                            <td>AAD</td>
                            <td>ARDENT LEISURE GROUP</td>
                            <td class="numeric">$1.15</td>
                            <td class="numeric">  +0.02</td>
                            <td class="numeric">1.32%</td>
                            <td class="numeric">$1.14</td>
                            <td class="numeric">$1.15</td>
                            <td class="numeric">$1.13</td>
                            <td class="numeric">56,431</td>
                        </tr>
                        <tr>
                            <td>AAX</td>
                            <td>AUSENCO LIMITED</td>
                            <td class="numeric">$4.00</td>
                            <td class="numeric">-0.04</td>
                            <td class="numeric">-0.99%</td>
                            <td class="numeric">$4.01</td>
                            <td class="numeric">$4.05</td>
                            <td class="numeric">$4.00</td>
                            <td class="numeric">90,641</td>
                        </tr>
                        <tr>
                            <td>ABC</td>
                            <td>ADELAIDE BRIGHTON LIMITED</td>
                            <td class="numeric">$3.00</td>
                            <td class="numeric">  +0.06</td>
                            <td class="numeric">2.04%</td>
                            <td class="numeric">$2.98</td>
                            <td class="numeric">$3.00</td>
                            <td class="numeric">$2.96</td>
                            <td class="numeric">862,518</td>
                        </tr>
                        <tr>
                            <td>ABP</td>
                            <td>ABACUS PROPERTY GROUP</td>
                            <td class="numeric">$1.91</td>
                            <td class="numeric">0.00</td>
                            <td class="numeric">0.00%</td>
                            <td class="numeric">$1.92</td>
                            <td class="numeric">$1.93</td>
                            <td class="numeric">$1.90</td>
                            <td class="numeric">595,701</td>
                        </tr>
                        <tr>
                            <td>ABY</td>
                            <td>ADITYA BIRLA MINERALS LIMITED</td>
                            <td class="numeric">$0.77</td>
                            <td class="numeric">  +0.02</td>
                            <td class="numeric">2.00%</td>
                            <td class="numeric">$0.76</td>
                            <td class="numeric">$0.77</td>
                            <td class="numeric">$0.76</td>
                            <td class="numeric">54,567</td>
                        </tr>
                        <tr>
                            <td>ACR</td>
                            <td>ACRUX LIMITED</td>
                            <td class="numeric">$3.71</td>
                            <td class="numeric">  +0.01</td>
                            <td class="numeric">0.14%</td>
                            <td class="numeric">$3.70</td>
                            <td class="numeric">$3.72</td>
                            <td class="numeric">$3.68</td>
                            <td class="numeric">191,373</td>
                        </tr>
                        <tr>
                            <td>ADU</td>
                            <td>ADAMUS RESOURCES LIMITED</td>
                            <td class="numeric">$0.72</td>
                            <td class="numeric">0.00</td>
                            <td class="numeric">0.00%</td>
                            <td class="numeric">$0.73</td>
                            <td class="numeric">$0.74</td>
                            <td class="numeric">$0.72</td>
                            <td class="numeric">8,602,291</td>
                        </tr>
                        <tr>
                            <td>AGG</td>
                            <td>ANGLOGOLD ASHANTI LIMITED</td>
                            <td class="numeric">$7.81</td>
                            <td class="numeric">-0.22</td>
                            <td class="numeric">-2.74%</td>
                            <td class="numeric">$7.82</td>
                            <td class="numeric">$7.82</td>
                            <td class="numeric">$7.81</td>
                            <td class="numeric">148</td>
                        </tr>
                        <tr>
                            <td>AGK</td>
                            <td>AGL ENERGY LIMITED</td>
                            <td class="numeric">$13.82</td>
                            <td class="numeric">  +0.02</td>
                            <td class="numeric">0.14%</td>
                            <td class="numeric">$13.83</td>
                            <td class="numeric">$13.83</td>
                            <td class="numeric">$13.67</td>
                            <td class="numeric">846,403</td>
                        </tr>
                        <tr>
                            <td>AGO</td>
                            <td>ATLAS IRON LIMITED</td>
                            <td class="numeric">$3.17</td>
                            <td class="numeric">-0.02</td>
                            <td class="numeric">-0.47%</td>
                            <td class="numeric">$3.11</td>
                            <td class="numeric">$3.22</td>
                            <td class="numeric">$3.10</td>
                            <td class="numeric">5,416,303</td>
                        </tr>
                        </tbody>
                    </table>
                </section>
            </div>
        </section>
        <section class="panel">
            <header class="panel-heading">
                No More Tables
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="javascript:;" class="fa fa-times"></a>
                 </span>
            </header>
            <div class="panel-body">
                <section id="no-more-tables">
                    <table class="table table-bordered table-striped table-condensed cf">
                        <thead class="cf">
                        <tr>
                            <th>Code</th>
                            <th>Company</th>
                            <th class="numeric">Price</th>
                            <th class="numeric">Change</th>
                            <th class="numeric">Change %</th>
                            <th class="numeric">Open</th>
                            <th class="numeric">High</th>
                            <th class="numeric">Low</th>
                            <th class="numeric">Volume</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td data-title="Code">AAC</td>
                            <td data-title="Company">AUSTRALIAN AGRICULTURAL COMPANY LIMITED.</td>
                            <td class="numeric" data-title="Price">$1.38</td>
                            <td class="numeric" data-title="Change">-0.01</td>
                            <td class="numeric" data-title="Change %">-0.36%</td>
                            <td class="numeric" data-title="Open">$1.39</td>
                            <td class="numeric" data-title="High">$1.39</td>
                            <td class="numeric" data-title="Low">$1.38</td>
                            <td class="numeric" data-title="Volume">9,395</td>
                        </tr>
                        <tr>
                            <td data-title="Code">AAD</td>
                            <td data-title="Company">ARDENT LEISURE GROUP</td>
                            <td class="numeric" data-title="Price">$1.15</td>
                            <td class="numeric" data-title="Change">  +0.02</td>
                            <td class="numeric" data-title="Change %">1.32%</td>
                            <td class="numeric" data-title="Open">$1.14</td>
                            <td class="numeric" data-title="High">$1.15</td>
                            <td class="numeric" data-title="Low">$1.13</td>
                            <td class="numeric" data-title="Volume">56,431</td>
                        </tr>
                        <tr>
                            <td data-title="Code">AAX</td>
                            <td data-title="Company">AUSENCO LIMITED</td>
                            <td class="numeric" data-title="Price">$4.00</td>
                            <td class="numeric" data-title="Change">-0.04</td>
                            <td class="numeric" data-title="Change %">-0.99%</td>
                            <td class="numeric" data-title="Open">$4.01</td>
                            <td class="numeric" data-title="High">$4.05</td>
                            <td class="numeric" data-title="Low">$4.00</td>
                            <td class="numeric" data-title="Volume">90,641</td>
                        </tr>
                        <tr>
                            <td data-title="Code">ABC</td>
                            <td data-title="Company">ADELAIDE BRIGHTON LIMITED</td>
                            <td class="numeric" data-title="Price">$3.00</td>
                            <td class="numeric" data-title="Change">  +0.06</td>
                            <td class="numeric" data-title="Change %">2.04%</td>
                            <td class="numeric" data-title="Open">$2.98</td>
                            <td class="numeric" data-title="High">$3.00</td>
                            <td class="numeric" data-title="Low">$2.96</td>
                            <td class="numeric" data-title="Volume">862,518</td>
                        </tr>
                        <tr>
                            <td data-title="Code">ABP</td>
                            <td data-title="Company">ABACUS PROPERTY GROUP</td>
                            <td class="numeric" data-title="Price">$1.91</td>
                            <td class="numeric" data-title="Change">0.00</td>
                            <td class="numeric" data-title="Change %">0.00%</td>
                            <td class="numeric" data-title="Open">$1.92</td>
                            <td class="numeric" data-title="High">$1.93</td>
                            <td class="numeric" data-title="Low">$1.90</td>
                            <td class="numeric" data-title="Volume">595,701</td>
                        </tr>
                        <tr>
                            <td data-title="Code">ABY</td>
                            <td data-title="Company">ADITYA BIRLA MINERALS LIMITED</td>
                            <td class="numeric" data-title="Price">$0.77</td>
                            <td class="numeric" data-title="Change">  +0.02</td>
                            <td class="numeric" data-title="Change %">2.00%</td>
                            <td class="numeric" data-title="Open">$0.76</td>
                            <td class="numeric" data-title="High">$0.77</td>
                            <td class="numeric" data-title="Low">$0.76</td>
                            <td class="numeric" data-title="Volume">54,567</td>
                        </tr>
                        <tr>
                            <td data-title="Code">ACR</td>
                            <td data-title="Company">ACRUX LIMITED</td>
                            <td class="numeric" data-title="Price">$3.71</td>
                            <td class="numeric" data-title="Change">  +0.01</td>
                            <td class="numeric" data-title="Change %">0.14%</td>
                            <td class="numeric" data-title="Open">$3.70</td>
                            <td class="numeric" data-title="High">$3.72</td>
                            <td class="numeric" data-title="Low">$3.68</td>
                            <td class="numeric" data-title="Volume">191,373</td>
                        </tr>
                        <tr>
                            <td data-title="Code">ADU</td>
                            <td data-title="Company">ADAMUS RESOURCES LIMITED</td>
                            <td class="numeric" data-title="Price">$0.72</td>
                            <td class="numeric" data-title="Change">0.00</td>
                            <td class="numeric" data-title="Change %">0.00%</td>
                            <td class="numeric" data-title="Open">$0.73</td>
                            <td class="numeric" data-title="High">$0.74</td>
                            <td class="numeric" data-title="Low">$0.72</td>
                            <td class="numeric" data-title="Volume">8,602,291</td>
                        </tr>
                        <tr>
                            <td data-title="Code">AGG</td>
                            <td data-title="Company">ANGLOGOLD ASHANTI LIMITED</td>
                            <td class="numeric" data-title="Price">$7.81</td>
                            <td class="numeric" data-title="Change">-0.22</td>
                            <td class="numeric" data-title="Change %">-2.74%</td>
                            <td class="numeric" data-title="Open">$7.82</td>
                            <td class="numeric" data-title="High">$7.82</td>
                            <td class="numeric" data-title="Low">$7.81</td>
                            <td class="numeric" data-title="Volume">148</td>
                        </tr>
                        <tr>
                            <td data-title="Code">AGK</td>
                            <td data-title="Company">AGL ENERGY LIMITED</td>
                            <td class="numeric" data-title="Price">$13.82</td>
                            <td class="numeric" data-title="Change">  +0.02</td>
                            <td class="numeric" data-title="Change %">0.14%</td>
                            <td class="numeric" data-title="Open">$13.83</td>
                            <td class="numeric" data-title="High">$13.83</td>
                            <td class="numeric" data-title="Low">$13.67</td>
                            <td class="numeric" data-title="Volume">846,403</td>
                        </tr>
                        <tr>
                            <td data-title="Code">AGO</td>
                            <td data-title="Company">ATLAS IRON LIMITED</td>
                            <td class="numeric" data-title="Price">$3.17</td>
                            <td class="numeric" data-title="Change">-0.02</td>
                            <td class="numeric" data-title="Change %">-0.47%</td>
                            <td class="numeric" data-title="Open">$3.11</td>
                            <td class="numeric" data-title="High">$3.22</td>
                            <td class="numeric" data-title="Low">$3.10</td>
                            <td class="numeric" data-title="Volume">5,416,303</td>
                        </tr>
                        </tbody>
                    </table>
                </section>
            </div>
        </section>
        </div>
        </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2014 &copy; AdminEx by <a href="http://www.mycodes.net/" target="_blank">源码之家</a>
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

</body>
</html>
