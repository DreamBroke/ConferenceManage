<%@page import="models.Method"%>
<%@page import="dao.MethodDAO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="models.Room"%>
<%@page import="dao.HotelDAO"%>
<%@page import="models.Hotel"%>
<%@page import="dao.RepresentorDAO"%>
<%@page import="dao.ProfessionalDAO"%>
<%@page import="models.Professional"%>
<%@page import="models.Representor"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>广西大学会议管理中心 —— 个人中心</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="../public/stylesheets/bootstrap.min.css" rel="stylesheet">


<!--  Paper Dashboard core CSS    -->
<link href="../public/stylesheets/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../public/stylesheets/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../public/stylesheets/themify-icons.css" rel="stylesheet">
<style type="text/css">
select.form-control {
	border: 1px solid #CCC5B9;
}
</style>
</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="../index.jsp" class="simple-text"> 首页 </a>
				</div>
				<ul class="nav">
					<li><a href="index.jsp"> <i class="ti-user"></i>
							<p>个人信息</p>
					</a></li>
					<li><a href="dissertation.jsp"> <i
							class="fa fa-file-word-o"></i>
							<p>管理论文</p>
					</a></li>
					<li class="active"><a href="check.jsp"> <i
							class="fa fa-rmb"></i>
							<p>预订房间</p>
					</a></li>
					<li><a href="repassword.jsp"> <i class="fa fa-cog"></i>
							<p>密码服务</p>
					</a></li>
				</ul>
			</div>
		</div>
		<%
			Representor rep = (Representor) session.getAttribute("rep");
			String username = rep.getRep_username();
			rep = RepresentorDAO.getRepresentorByUsername(username);
			if (rep != null) {
		%>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">欢迎您，<%=rep.getRep_name()%> <%
 	if (rep.getRep_sex().equals("男")) {
 %>先生<%
 	} else {
 %>女士<%
 	}
 %></a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="../Exit"> <i class="fa fa-bell"></i>
									<p>注销</p>
							</a></li>
						</ul>

					</div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-lg-12 col-md-12">
							<div class="card">
								<div class="header">
									<h3 class="title">支付方式</h3>
								</div>
								<div class="content">
									<div class="row">
										<div class="col-md-3"></div>
										<div class="col-md-6">
											<div class="row">
												<form action="AddCheckServlet" method="POST">
													<div class="col-md-12" style="padding-left: 6px;">
														<div class="form-group">
															<label>支付方式</label> <select onchange="changeBrief()" name="method" class="form-control" id="method">
																<%
																	ArrayList<Method> al = MethodDAO.getAllMethod();
																	for(Method m : al){
																%>
																<option value="<%=m.getMet_no()%>"><%=m.getMet_name()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="col-md-12">
														<div class="form-group">
															<label>详细说明</label>
															<textarea disabled="disabled" class="form-control border-input" rows="" cols="" id="brief" name="brief"><%=MethodDAO.getBriefByNo("1")%></textarea>
														</div>
													</div>
													<input type="hidden"
														value="<%=request.getParameter("room")%>" name="room">
													<input type="hidden" value="<%=rep.getRep_no()%>"
														name="rep_no">
													<div class="col-md-12">
														<div class="form-group">
															<label>支付账号</label> <input type="text"
																class="form-control border-input" placeholder="支付账号"
																name="account">
														</div>
													</div>
													<div class="text-center">
														<button type="submit" class="btn btn-info btn-fill btn-wd">提交</button>
													</div>
												</form>
											</div>

										</div>
										<div class="col-md-3"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%
			String mess = (String) session.getAttribute("message");
			if("success".equals(mess)){
		%>
		<script type="text/javascript">
			alert("修改成功！");
		</script>
		<%
			session.removeAttribute("message");
			}
		%>


		<%
			} else {
		%>
		<script type="text/javascript">
			alert("您还未登录，请重新登录！");
			window.location.href = "../login.jsp";
		</script>
		<%
			}
		%>

	</div>


</body>

<!--   Core JS Files   -->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/tether/1.4.0/js/tether.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="../public/javascripts/bootstrap-checkbox-radio.js"></script>


<!--  Notifications Plugin    -->
<script src="../public/javascripts/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="../public/javascripts/paper-dashboard.js"></script>

<script type="text/javascript">
	var method = document.getElementById("method");
	var brief = document.getElementById("brief");
	function changeBrief(){
		<%
		ArrayList<Method> al = MethodDAO.getAllMethod();
		for(Method m : al){
		%>
		if(method.value == <%=m.getMet_no() %>){
			brief.innerHTML = "<%=m.getMet_brief() %>";
		}
		<% }%>
	}
</script>

</html>
