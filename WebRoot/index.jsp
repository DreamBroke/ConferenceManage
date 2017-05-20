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

<title>广西大学会议管理中心 —— 首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="maincss.html"%>
<link rel="stylesheet" href="public/stylesheets/index.css">
<style type="text/css">
p {
	font-size: 18px;
}

.MsoListParagraph {
	margin-left: 36.0pt;
	text-indent: -36.0pt;
	mso-char-indent-count: 0;
	mso-list: l0 level1 lfo1;
}

span {
	white-space: pre;
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
		<div class="breadcrumbs-v1 img-index margin-bottom-30"
			style="height: ">
			<div class="container" style="text-align: center">
				<h1 class="pull-center"><%=con.getCon_name()%></h1>
			</div>
		</div>
		<div class="container margin-bottom-30">
			<div class="row">
				<div class="col-md-4">
					<div class="headline">
						<h3>主办单位</h3>
					</div>
					<%
						String[] host = con.getCon_host().split("&");
							for (String s : host) {
					%>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><%=s%></font>
					</p>
					<%
						}
					%>
				</div>
				<div class="col-md-4">
					<div class="headline">
						<h3>承办单位</h3>
					</div>
					<%
						String[] organizer = con.getCon_organizer().split("&");
							for (String s : organizer) {
					%>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><%=s%></font>
					</p>
					<%
						}
					%>
				</div>
				<div class="col-md-4">
					<div class="headline">
						<h3>协办单位</h3>
					</div>
					<%
						String[] co_organizer = con.getCon_co_organizer().split("&");
							for (String s : co_organizer) {
					%>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><%=s%></font>
					</p>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<div class="container margin-bottom-30">
			<div class="row">
				<div class="col-md-6">
					<div class="headline">
						<h2>会议内容</h2>
					</div>
					<p style="line-height: 45px;">
						<%=con.getCon_contents()%>
					</p>


				</div>

				<div class="col-md-6">
					<div class="headline">
						<h2>报到地点</h2>
					</div>
					<%
						String[] address = con.getCon_address().split("&");
							for (String s : address) {
					%>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><span
							class="Apple-tab-span"> </span><%=s%></font>
					</p>
					<%
						}
					%>
					<div class="headline" style="margin-top: 25px;">
						<h2>会议时间</h2>
					</div>
					<p>
						会议开始日期：<%=con.getCon_startdate()%></p>
					<p>
						会议结束日期：<%=con.getCon_enddate()%></p>
				</div>
			</div>
		</div>


		<div class="container margin-bottom-30" style="margin-bottom: 160px;">
			<div class="row">
				<div class="col-md-6">
					<div class="headline">
						<h3>组织委员会</h3>
					</div>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><b>主席：</b>鲁习文</font>
					</p>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><b>委员（按拼音顺序）：</b>韩中庚 
							吕跃进  吴孟达</font>
					</p>
				</div>
				<div class="col-md-6">
					<div class="headline">
						<h3>学术委员会</h3>
					</div>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><b>主席：</b>谢金星</font>
					</p>
					<p class="MsoListParagraph" style="">
						<font color="#333333" face="微软雅黑, sans-serif"><b>委员（按拼音顺序）：</b>蔡志杰
							 谈之奕  薛 毅  周义仓</font>
					</p>

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
