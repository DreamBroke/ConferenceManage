<%@page import="models.Teacher"%>
<%@page import="dao.TeacherDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.ScheduleDAO"%>
<%@page import="models.Schedule"%>
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

<title>广西大学会议管理中心 —— 日程安排</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@include file="maincss.html"%>
<style type="text/css">
p {
	font-size: 18px;
}

.breadcrumbs-v1.img-schedule {
	background: url("public/images/schedule.jpg") no-repeat;
	background-size: cover;
	background-position: center center;
	height: 400px;
	padding-top: 150px;
}

.breadcrumbs-v1 h1,.pull-center {
	float: none;
	color: #ffffff;
	font-weight: bold;
	font-style: normal;
	font-size: 45px;
}

.row h4 {
	font-weight: bold;
}

.time div {
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 16px;
}
.time1{
	background-color: #f9f9f9;
	border-color: rgb(128, 128, 128);
	border-collapse: collapse;
	border-bottom-style: solid;
	border-top-style: solid;
	border-width: 1px;
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
		<div class="breadcrumbs-v1 img-schedule margin-bottom-30"
			style="height: ">
			<div class="container" style="text-align: center">
				<h1 class="pull-center"><%=con.getCon_name()%></h1>
			</div>
		</div>
		<div class="container" style="margin-bottom: 30px;">
			<%
				ArrayList<Schedule> al = new ArrayList<Schedule>();
					ScheduleDAO scdao = new ScheduleDAO();
					al = scdao.getAllSchedule();
					String str = null;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
					int n =0;
					for (Schedule s : al) {
						n++;
						String date = sdf.format(s.getSche_date());
						if (!date.equals(str)) {
							str = sdf.format(s.getSche_date());
			%>

			<div class="headline">
				<h2><%=str%></h2>
			</div>
			<div class="row time" style="border-bottom-style: solid;">
				<div class="col-md-2">
					<h4>开始时间</h4>
				</div>
				<div class="col-md-2">
					<h4>结束时间</h4>
				</div>
				<div class="col-md-1">
					<h4>报告人</h4>
				</div>
				<div class="col-md-2">
					<h4>内容</h4>
				</div>
				<div class="col-md-4">
					<h4>地点</h4>
				</div>
				<div class="col-md-1">
					<h4>类别</h4>
				</div>
			</div>

			<%
				}
				SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
				Date d = s.getSche_starttime();
			%>
			<div class="row time <%if(n%2 == 0){%>time1<%}%>" style="">
				<div class="col-md-2"><%= sdf2.format(d)%></div>
				<div class="col-md-2"><%=s.getSche_endtime()%></div>
				<div class="col-md-1">
					<%
						if (s.getSche_speaker() == 0) {
					%>无<%
						} else {
							int i = s.getSche_speaker();
							Teacher t = TeacherDAO.getTeacherByNo(i);
					%><%=t.getTea_name()%>
					<%
						}
					%>
				</div>
				<div class="col-md-2"><%=s.getSche_content()%></div>
				<div class="col-md-4"><%=s.getSche_address()%></div>
				<div class="col-md-1"><%=s.getSche_category()%></div>
			</div>
			<%
				}
				}
			%>
		</div>
		<%@include file="footer.html"%>
	</div>
	<%@include file="mainjs.html"%>
</body>
</html>
