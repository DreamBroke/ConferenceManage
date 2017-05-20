<%@page import="dao.RelatedDAO"%>
<%@page import="models.Related"%>
<%@page import="dao.ConferenceDAO"%>
<%@page import="models.Conference"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>广西大学会议管理中心 —— 论文要求</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="maincss.html"%>

<style type="text/css">
.breadcrumbs-v1.img-academy {
	background: url("public/images/academy.jpg") no-repeat;
	background-size: cover;
	background-position: center center;
	height: 400px;
	padding-top: 150px;
}

p {
	font-size: 18px;
	line-height: 45px;
}

.breadcrumbs-v1 h1,.pull-center {
	float: none;
	color: #ffffff;
	font-weight: bold;
	font-style: normal;
	font-size: 45px;
}
</style>
</head>

<body class="header-fixed header-fixed-space-v2" data-spy="scroll"
	data-target="#main-nav" data-offset="150">
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<%
			Conference con = null;
			ConferenceDAO condao = new ConferenceDAO();
			con = condao.getConference();
			Related rel = null;
			rel = RelatedDAO.getRelatedById(2);
			if (con != null && rel != null) {
		%>
		<div class="breadcrumbs-v1 img-academy margin-bottom-30">
			<div class="container" style="text-align: center">
				<h1 class="pull-center"><%=con.getCon_name()%></h1>
			</div>
		</div>
		<div class="container" style="margin-bottom: 100px;">
			<div class="headline"><h2 style="font-size: 28px"><%=rel.getRel_name() %></h2></div>
			<p><%=rel.getRel_brief() %></p>
		</div>
		<%
			}
		%>
		<%@include file="footer.html"%>
	</div>
	<%@include file="mainjs.html"%>
</body>
</html>
