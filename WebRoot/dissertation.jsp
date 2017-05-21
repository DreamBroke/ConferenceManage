<%@page import="dao.RealmDao"%>
<%@page import="models.Realm"%>
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
.breadcrumbs-v1.img-dissertation {
	background: url("public/images/dissertation.jpg") no-repeat;
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
	color: #000;
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
			if (con != null) {
		%>
		<div class="breadcrumbs-v1 img-dissertation margin-bottom-30">
			<div class="container" style="text-align: center">
				<h1 class="pull-center"><%=con.getCon_name()%></h1>
			</div>
		</div>

		<div class="container" style="margin-bottom: 160px;">
			<div class="row">
				<div class="col-md-6">
					<div class="headline">
						<h2>投稿指南</h2>
					</div>
					<p><%=con.getCon_scopen()%></p>
				</div>
				<div class="col-md-6">
					<div class="headline">
						<h2>投稿时间</h2>
					</div>
					<p>
						投稿开始日期：<%=con.getCon_upstartdate()%></p>
					<p>
						投稿截止日期：<%=con.getCon_upenddate()%></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="headline">
						<h2>投稿范围</h2>
					</div>

					<%
					ArrayList<Realm> al = RealmDao.getAllFatherRealm();
					for(Realm r : al){
					%>
					<h2><%=r.getRea_name()%></h2>
					<p><% ArrayList<Realm> son = RealmDao.getSonRealmByNo(r.getRea_no()+""); for(Realm s : son){%><%=s.getRea_name()%>&nbsp&nbsp<%}%></p>
					<%} %>

				</div>
			</div>
		</div>
		<%
			}
		%>
		<%@include file="footer.html"%>
	</div>
	<%@include file="mainjs.html"%>
</body>
</html>
