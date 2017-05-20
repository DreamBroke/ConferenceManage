<%@page import="dao.RealmDao"%>
<%@page import="dao.DissertationDAO"%>
<%@page import="models.Dissertation"%>
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

<title>广西大学会议管理中心 —— 论文修改</title>

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
<link
	href="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/css/fileinput.css"
	rel="stylesheet">
<style type="text/css">
select.form-control {
	border: 1px solid #CCC5B9;
}

.btn.btn-default.fileinput-upload.fileinput-upload-button {
	display: none;
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
					<li><a href=""> <i class="fa fa-rmb"></i>
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
									<h4 class="title">论文修改</h4>
								</div>
								<div class="content">
									<%
										Dissertation dis = DissertationDAO.getDissertationByNo(request
													.getParameter("dis_no"));
									%>
									<form action="../ModifyRep" method="POST" id="form">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>标题</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="Company"
														name="title" value="<%=dis.getDis_title()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>关键词</label> <input type="text"
														class="form-control border-input" placeholder="关键词"
														value="<%=dis.getDis_keyword()%>" name="keyword">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>领域</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="Company"
														name="title"
														value="<%=RealmDao.getNameByNo("" + dis.getDis_realm())%>">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>摘要</label>
													<textarea rows="5" class="form-control border-input"
														name="field" placeholder="摘要"><%=dis.getDis_abstract()%></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="control-label">论文上传</label> <input id="file"
														type="file" name="file">
												</div>
											</div>
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
			String mess = (String) session.getAttribute("message");
				if ("success".equals(mess)) {
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
<script
	src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/js/fileinput.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/js/locales/zh.js"></script>
<script type="text/javascript">
$('#file').fileinput({language: 'zh',allowedFileExtensions:["doc", "pdf", "docx"]});
	$(document)
			.ready(
					function() {
						/**
						 * 下面是进行插件初始化
						 * 你只需传入相应的键值对
						 * */
						$('#form')
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
														regexp : {
															regexp : /^1[3|5|8]{1}[0-9]{9}$/,
															message : '请输入正确的手机号码'
														}
													}
												},
												postcode : {
													message : 'The postcode is not valid',
													validators : {
														stringLength : {
															min : 6,
															max : 6,
															message : '请输入6位邮编'
														},
														regexp : {
															regexp : /^[1-9][0-9]{5}$/,
															message : '请输入正确的邮编'
														}
													}
												},
												IDnumber : {
													message : 'The IDnumber is not valid',
													validators : {
														stringLength : {
															min : 15,
															max : 18,
															message : '请输入15或18位身份证号码'
														},
														regexp : {
															regexp : /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
															message : '请输入正确的身份证号码'
														}
													}
												},
												qq : {
													message : 'The qq is not valid',
													validators : {
														stringLength : {
															min : 4,
															max : 12,
															message : '请输入4-12位QQ号码'
														},
														regexp : {
															regexp : /^[1-9]\d{4,8}$/,
															message : '请输入正确的QQ号码'
														}
													}
												}
											},
										});
					});
</script>

</html>
