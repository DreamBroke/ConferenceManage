<%@page import="dao.AuthorDAO"%>
<%@page import="models.Author"%>
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
									<form action="" method="POST" id="form">
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
							<div class="card">
								<div class="header">
									<h4 class="title">作者管理</h4>
									<p style="height: 38px;margin-bottom: 0;"><a class="btn btn-info" style="float: right;display:inline-block;" href="addauthor.jsp?dis_no=<%=request.getParameter("dis_no")%>">增加</a></p>
								</div>
								<div class="content">
								<%
									ArrayList<Author> al = AuthorDAO.getAuthorByDissertation(request.getParameter("dis_no"));
									for(Author aut : al){
								%>
								
									<form action="" method="POST" id="form2">
										<input type="hidden" value="<%=request.getParameter("dis_no")%>" name="dis_no">
										<div class="row">
											<div class="col-md-2">
												<div class="form-group">
													<label>姓名</label> <input type="text" value="<%=aut.getAut_name() %>"
														class="form-control border-input" placeholder="姓名"
														name="name">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>类别</label> <select class="form-control"
														id="category" name="category">
														<option value="第一作者" <%if(aut.getAut_category().equals("第一作者")){ %> selected <%}%>>第一作者</option>
														<option value="第二作者" <%if(aut.getAut_category().equals("第二作者")){ %> selected <%}%>>第二作者</option>
														<option value="第三作者" <%if(aut.getAut_category().equals("第三作者")){ %> selected <%}%>>第三作者</option>
														<option value="第四作者" <%if(aut.getAut_category().equals("第四作者")){ %> selected <%}%>>第四作者</option>
														<option value="第五作者" <%if(aut.getAut_category().equals("第五作者")){ %> selected <%}%>>第五作者</option>
														<option value="第六作者" <%if(aut.getAut_category().equals("第六作者")){ %> selected <%}%>>第六作者</option>
														<option value="第七作者" <%if(aut.getAut_category().equals("第七作者")){ %> selected <%}%>>第七作者</option>
														<option value="第八作者" <%if(aut.getAut_category().equals("第八作者")){ %> selected <%}%>>第八作者</option>
														<option value="第九作者" <%if(aut.getAut_category().equals("第九作者")){ %> selected <%}%>>第九作者</option>
														<option value="第十作者" <%if(aut.getAut_category().equals("第十作者")){ %> selected <%}%>>第十作者</option>
														<option value="通讯作者" <%if(aut.getAut_category().equals("通讯作者")){ %> selected <%}%>>通讯作者</option>
													</select>
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>联系电话</label> <input type="text" value="<%=aut.getAut_tel()%>"
														class="form-control border-input" placeholder="联系电话"
														name="tel">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>电子邮箱</label> <input type="text" value="<%=aut.getAut_email() %>"
														class="form-control border-input" placeholder="电子邮箱"
														name="email">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group">
													<label>工作单位</label> <input type="text" value="<%=aut.getAut_company() %>"
														class="form-control border-input" placeholder="工作单位"
														name="company">
												</div>
											</div>
											<div class="col-md-2">
												<div class="form-group" style="margin-top: 26px;">
													<button class="btn btn-info" type="submit">确认</button>
													<a class="btn btn-danger" href="DeleteAuthor?aut_no=<%=aut.getAut_no()%>&dis_no=<%=request.getParameter("dis_no")%>" onclick="return deleteAut();">删除</a>
													<%-- <a class="btn btn-danger" href="DeleteAuthor?aut_no=<%=i%>&dis_no=<%=request.getParameter("dis_no")%>">删除</a> --%>
												</div>
											</div>
										</div>
									</form>
									<%} %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%
				String mess = (String) request.getAttribute("message_author");
				if (mess != null && !mess.equals("")) {
		%>
		<script type="text/javascript">
			alert("<%=mess%>");
			window.location.href="modifydissertation.jsp?dis_no=<%=request.getParameter("dis_no")%>";
		</script>
		<%
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
	src="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/js/fileinput.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-fileinput/4.3.9/js/locales/zh.js"></script>
<script type="text/javascript">
function deleteAut(){
	var flag = confirm("确定删除吗？");
	return flag;
}

$('#file').fileinput({language: 'zh',allowedFileExtensions:["doc", "pdf", "docx"]});
</script>

</html>
