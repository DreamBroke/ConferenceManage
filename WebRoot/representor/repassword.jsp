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

<title>广西大学会议管理中心 —— 密码服务</title>

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
					<li><a href="dissertation.jsp"> <i class="fa fa-file-word-o"></i>
							<p>管理论文</p>
					</a></li>
					<li><a href=""> <i class="fa fa-rmb"></i>
							<p>预订房间</p>
					</a></li>
					<li class="active"><a href="repassword.jsp"> <i class="fa fa-cog"></i>
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
									<h4 class="title">修改密码</h4>
								</div>
								<div class="content">
									<form action="../Repasssword" method="POST" id="form">
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-6">
												<div class="form-group">
													<label>旧密码</label> <input type="password"
														class="form-control border-input" name="oldpassword">
												</div>
											</div>
											<div class="col-md-3"></div>
										</div>
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-6">
												<div class="form-group">
													<label>新密码</label> <input type="password" name="password"
														class="form-control border-input">
												</div>
											</div>
											<div class="col-md-3"></div>
										</div>
										<input type="hidden" name="no" value="<%=rep.getRep_no()%>">
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-6">
												<div class="form-group">
													<label>确认密码</label> <input type="password"
														name="repassword" class="form-control border-input">
												</div>
											</div>
											<div class="col-md-3"></div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-info btn-fill btn-wd">提交</button>
										</div>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%
				String message = (String) session.getAttribute("message");
				if ("failed".equals(message)) {
		%>
		<script type="text/javascript">
			alert("旧密码输入错误，请重新输入！");
		</script>
		<%
				} else if("success".equals(message)) {
		%>
		<script type="text/javascript">
			alert("修改成功！");
		</script>
		<%
				}
		%>
		<%
				session.removeAttribute("message");
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
	$(document).ready(function() {
		/**
		 * 下面是进行插件初始化
		 * 你只需传入相应的键值对
		 * */
		$('#form').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {/*输入框不同状态，显示图片的样式*/
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {/*验证*/
				password : {
					message : '新密码无效',
					validators : {
						notEmpty : {
							message : '新密码不能为空'
						},
						stringLength : {
							min : 6,
							max : 20,
							message : '新密码长度必须在6到20之间'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '密码由数字字母下划线和.组成'
						}
					}
				},
				repassword : {
					message : '确认密码无效',
					validators : {
						notEmpty : {
							message : '确认密码不能为空'
						},
						stringLength : {
							min : 6,
							max : 20,
							message : '确认密码长度必须在6到20之间'
						},
						identical : {//相同
							field : 'password', //需要进行比较的input name值
							message : '两次密码不一致'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_\.]+$/,
							message : '确认密码由数字字母下划线和.组成'
						}
					}
				},
			},
		});
	});
</script>

</html>
