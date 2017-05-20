<%@page import="dao.RepresentorDAO"%>
<%@page import="models.Representor"%>
<%@page pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	uri = uri.substring(uri.lastIndexOf("/") + 1);
%>
<div class="header-v8 header-sticky">
	<!-- Topbar blog -->
	<div class="blog-topbar">
		<div class="topbar-search-block">
			<div class="container">
				<form action="">
					<input type="text" class="form-control" placeholder="搜索...">
					<div class="search-close">
						<i class="icon-close"></i>
					</div>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-xs-8">
					<div class="topbar-time"></div>
					<div class="topbar-toggler">
						<span class="fa fa-angle-down"></span>
					</div>
					<ul class="topbar-list topbar-menu">
						
						<li><a href="javascript:void(0);">English</a> <!--ul class="topbar-dropdown">
                                    <li><a href="#">English</a></li>
                                </ul--></li>
						<!--li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signin" href="javascript:void(0);">登录</a></strong></li>
								<li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signup" href="javascript:void(0);">注册</a></strong></li-->
					</ul>
				</div>
				<div class="col-sm-4 col-xs-4 clearfix">
					<i class="fa fa-search search-btn pull-right"></i>
					<ul
						class="topbar-list topbar-log_reg pull-right visible-sm-block visible-md-block visible-lg-block">
						<!--
                            <li class="cd-log_reg home"><a class="cd-signin" href="javascript:void(0);">登录</a></li>
                            <li class="cd-log_reg"><a class="cd-signup" href="javascript:void(0);">注册</a></li>
                        -->
						<li class="home"><a href="#"><i class="fa fa-weixin"></i></a></li>
						<li class=""><a href="#"><i class="fa fa-weibo"></i></a></li>
						<%
							Representor rep = (Representor)session.getAttribute("rep");
							if(rep == null){
						%>
						<li class=""><a class="btn btn-default btn-xs" href="login.jsp" role="button" style="color: #333;">登录</a></li>
						<li class=""><a class="btn btn-default btn-xs" href="register.jsp" role="button" style="color: #333;">注册</a></li>
						<%}else{ %>
							<li class=""><a class="btn btn-default btn-xs" href="representor/index.jsp" role="button" style="color: #333;">个人中心</a></li>
							<li class=""><a class="btn btn-default btn-xs" href="Exit" role="button" style="color: #333;">注销</a></li>
						<%} %>
					</ul>
				</div>
			</div>
			<!--/end row-->
		</div>
		<!--/end container-->
	</div>
	<!-- End Topbar blog -->

	<!-- Navbar -->
	<div class="navbar mega-menu" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="res-container">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<div class="navbar-brand">
					<a href="index.jsp"> <img class="img-responsive" alt="Logo"
						src="public/images/logo3.png">
					</a>
				</div>
			</div>
			<!--/end responsive container-->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-responsive-collapse">
				<div class="res-container">
					<nav id="main-nav">
						<ul class="nav navbar-nav">
							<!-- Home -->
							<li class="<%if (uri.equals("index.jsp") || uri.equals("")) {%> active <%}%>"><a
								href="index.jsp"> 首页 </a></li>
							<!-- End Home -->

							<!-- Archives -->
							<li
								class="dropdown <%if (uri.equals("dissertation.jsp")) {%> active <%}%>"><a
								href="dissertation.jsp" class="dropdown-toggle"> 论文要求 </a></li>
							<!-- End Archives -->

							<!-- vision -->
							<li
								class="dropdown <%if (uri.equals("schedule.jsp")) {%> active <%}%> mega-menu-fullwidth "><a
								href="schedule.jsp" class="dropdown-toggle"> 日程安排 </a></li>

							<!-- End vision -->

							<!-- Careers -->
							<li
								class="dropdown <%if (uri.equals("hotel.jsp") || uri.equals("repast.jsp")) {%> active <%}%>"><a
								href="hotel.jsp" class="dropdown-toggle"> 有关事项</a>
								<ul class="dropdown-menu">
									<li class="<%if (uri.equals("hotel.jsp")) {%> active <%}%>"><a
										href="hotel.jsp">酒店浏览</a></li>
									<li class="<%if (uri.equals("repast.jsp")) {%> active <%}%>"><a
										href="repast.jsp">就餐安排</a></li>
								</ul></li>
							<!-- End Careers -->

							<!-- About Us -->
							<li class="dropdown <%if (uri.equals("gxu.jsp") || uri.equals("academy.jsp") || uri.equals("related.jsp")) {%> active <%}%>"><a href="related.jsp" class="dropdown-toggle">
									周边介绍 </a>
								<ul class="dropdown-menu">
									<li class="<%if (uri.equals("gxu.jsp")) {%> active <%}%>"><a
										href="gxu.jsp">广西大学简介</a></li>
									<li class="<%if (uri.equals("academy.jsp")) {%> active <%}%>"><a href="academy.jsp">数信学院概览</a></li>
									<li class="<%if (uri.equals("related.jsp")) {%> active <%}%>"><a href="related.jsp">周边美景</a></li>
								</ul></li>
							<!-- About Us -->
						</ul>
					</nav>
				</div>
				<!--/responsive container-->
			</div>
			<!--/navbar-collapse-->
		</div>
		<!--/end contaoner-->
	</div>
	<!-- End Navbar -->
</div>