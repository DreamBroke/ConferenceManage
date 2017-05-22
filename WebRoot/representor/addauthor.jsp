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

<title>广西大学会议管理中心 —— 添加作者</title>

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
					<li class="active"><a href="dissertation.jsp"> <i
							class="fa fa-file-word-o"></i>
							<p>管理论文</p>
					</a></li>
					<li><a href="check.jsp"> <i class="fa fa-rmb"></i>
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
						<div class="col-md-12">
							<div class="card">
								<div class="header" style="">
									<h3 class="title">添加作者</h3>
								</div>
								<p></p>
								<div class="content" id="content">
									<form action="AddAuthor" method="POST" class="form" style="padding: 20px;" id="form">
										<input type="hidden" value="<%=request.getParameter("dis_no")%>" name="dis_no">
										<div class="row">
											<div class="col-md-2">
												<div class="form-group">
													<label>姓名</label> <input type="text"
														class="form-control border-input" placeholder="姓名"
														name="name">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>类别</label> <select class="form-control"
														id="category" name="category">
														<option value="第一作者">第一作者</option>
														<option value="第二作者">第二作者</option>
														<option value="第三作者">第三作者</option>
														<option value="第四作者">第四作者</option>
														<option value="第五作者">第五作者</option>
														<option value="第六作者">第六作者</option>
														<option value="第七作者">第七作者</option>
														<option value="第八作者">第八作者</option>
														<option value="第九作者">第九作者</option>
														<option value="第十作者">第十作者</option>
														<option value="通讯作者">通讯作者</option>
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>联系电话</label> <input type="text"
														class="form-control border-input" placeholder="联系电话"
														name="tel">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>电子邮箱</label> <input type="text"
														class="form-control border-input" placeholder="电子邮箱"
														name="email">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>工作单位</label> <input type="text"
														class="form-control border-input" placeholder="工作单位"
														name="company">
												</div>
											</div>
											<div class="col-md-1">
												<div class="form-group" style="margin-top: 26px;">
													<button class="btn btn-info" type="submit">确认</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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
<script
	src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>

<script type="text/javascript">

	$(document)
			.ready(
					function() {
						/**
						 * 下面是进行插件初始化
						 * 你只需传入相应的键值对
						 * */
						$('.form')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {/*输入框不同状态，显示图片的样式*/
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {/*验证*/
												email : {
													validators : {
														notEmpty : {
															message : '电子邮箱地址不能为空'
														},
														emailAddress : {
															message : '请输入一个有效的邮箱地址'
														}
													}
												},
												name : {
													validators : {
														notEmpty : {
															message : '姓名不能为空'
														},
														stringLength : {
															min : 1,
															max : 10,
															message : '姓名长度必须在1到10之间'
														}
													}
												},
												taxpay : {
													validators : {
														stringLength : {
															min : 15,
															max : 20,
															message : '税号长度必须在15到20之间'
														}
													}
												},
												tel : {
													message : 'The phone is not valid',
													validators : {
														stringLength : {
															min : 11,
															max : 11,
															message : '请输入11位手机号码'
														},
														notEmpty : {
															message : '联系电话不能为空'
														},
														regexp : {
															regexp : /^1[3|5|8]{1}[0-9]{9}$/,
															message : '请输入正确的手机号码'
														}
													}
												}
											},
										});
					});
</script>

</html>
