<%@page import="dao.RealmDao"%>
<%@page import="models.Realm"%>
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

<title>广西大学会议管理中心 —— 论文上传</title>

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
<link href="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/css/fileinput.css"
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
						<div class="col-md-12">
							<div class="card">
								<div class="header" style="">
									<h3 class="title">论文上传</h3>
								</div>
								<form action="../Updissertation" method="POST" id="form"
									enctype="multipart/form-data" style="padding: 20px;">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>论文标题</label> <input type="text"
													class="form-control border-input" placeholder="论文标题"
													name="title">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>关键词</label> <input type="text"
													class="form-control border-input" placeholder="关键词"
													name="keyword">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>一级领域</label>
												<%
													ArrayList<Realm> al = new ArrayList<Realm>();
													al = RealmDao.getAllFatherRealm();
												%>
												<select class="form-control" id="realm1" name="realm1"
													onchange="clickOpt()">
													<%
														for(Realm r : al){
													%>
													<option value="<%=r.getRea_no()%>"><%=r.getRea_name()%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>二级领域</label> <select class="form-control" id="realm2"
													name="realm2">
													<%
														ArrayList<Realm> al2 = new ArrayList<Realm>();
																									al2 = RealmDao.getSonRealmByNo(1+"");
																									for(Realm r : al2){
													%>
													<option value="<%=r.getRea_no()%>"><%=r.getRea_name()%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									</div>
									<input hidden value="<%=rep.getRep_no()%>" name="no">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>论文摘要</label>
												<textarea rows="5" class="form-control border-input"
													name="field" placeholder="论文摘要"></textarea>
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
		<%
				if(session.getAttribute("message") != "" && session.getAttribute("message") != null){
		%>
		<script type="text/javascript">
			
			alert("<%=session.getAttribute("message")%>");
			
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
	var realm2 = document.getElementById("realm2");
	var realm1 = document.getElementById("realm1");

	function addOption(val, txt) {
		var opt = document.createElement("option");
		opt.text = txt;
		opt.value = val;
		realm2.options.add(opt);
	}

	function clickOpt() {
		var r1_value = realm1.value;
		var r2_length = realm2.options.length;
		if (r2_length > 0) {
			for (var i = 0; i < r2_length; i++) {
				realm2.options.remove(0);
			}
		}
		<%ArrayList<Realm> al = new ArrayList<Realm>();
			al = RealmDao.getAllFatherRealm();
			for(Realm r : al){
				ArrayList<Realm> al2 = new ArrayList<Realm>();
				al2 = RealmDao.getSonRealmByNo(r.getRea_no()+"");				
				for(Realm r2 : al2){%>
		if (r1_value == <%=r2.getRea_father()%>) {
			addOption(<%=r2.getRea_no()%>,"<%=r2.getRea_name()%>");
		}
<%}}%>
	}
</script>

</html>
