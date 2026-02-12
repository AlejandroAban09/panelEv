<aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar position-relative">
        <div class="d-flex align-items-center logo-box justify-content-start d-md-block d-none">
            <!-- Logo -->
            <a href="dashboard" class="logo">
                <!-- logo-->
                <div class="logo-lg">
                    <span class="light-logo"><img src="assets/img/logo-color.png" alt="logo"></span>
                </div>
                <!--<div class="logo-lg">
                    <span style="color: #174888 !important;font-size: 30px !important;" class="light-logo fs-36 fw-700">PureCraft<span class="text-primary"></span></span>
                </div>-->
            </a>
        </div>
        <div class="multinav">
            <div class="multinav-scroll" style="height: 97%;">
                <!-- sidebar menu-->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MENÚ</li>
                    <li class="<?php echo ($seccion == 'productos') ? 'active' : ''; ?>">
                        <a href="productos">
                            <i class="icon-File"><span class="path1"></span><span class="path2"></span></i>
                            <span>Productos</span>
                        </a>
                    </li>
                    <li class="<?php echo ($seccion == 'blog') ? 'active' : ''; ?>">
                        <a href="blog">
                            <i class="icon-File"><span class="path1"></span><span class="path2"></span></i>
                            <span>Blog</span>
                        </a>
                    </li>
                    <li class="<?php echo ($seccion == 'herramientas') ? 'active' : ''; ?>">
                        <a href="herramientas">
                            <i class="icon-File"><span class="path1"></span><span class="path2"></span></i>
                            <span>Herramientas</span>
                        </a>
                    </li>
                    <li class="hide">
                        <a href="#">
                            <i class="icon-Library"><span class="path1"></span><span class="path2"></span></i>
                            <span>CATALOGOS</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="usuarios"><i class="icon-Commit"><span class="path1"></span><span
                                            class="path2"></span></i>USUARIOS</a></li>
                        </ul>
                    </li>
                    <li class="hide">
                        <a href="reports.html">
                            <i class="icon-Flag"><span class="path1"></span><span class="path2"></span></i>
                            <span>REPORTES</span>
                        </a>
                    </li>
                    <li>
                        <a href="login/logout">
                            <i class="icon-Sign-out"><span class="path1"></span><span class="path2"></span></i>
                            <span>CERRAR SESIÓN</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</aside>