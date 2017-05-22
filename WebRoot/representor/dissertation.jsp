<%@page import="dao.ConditionDAO"%>
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

<title>广西大学会议管理中心 —— 论文管理</title>

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
									<h3 class="title">管理论文</h3>
									<a href="updissertation.jsp"
										class="btn btn-info btn-fill btn-wd" style="float: right;">发布新论文</a>
								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<th>论文标题</th>
											<th>关键词</th>
											<th>领域</th>
											<th>状态</th>
											<th></th>
										</thead>
										<tbody>
											<%
												ArrayList<Dissertation> al = new ArrayList<Dissertation>();
												al = DissertationDAO.getDissertationByAuthor(rep.getRep_no()+"");
												for(Dissertation dis : al){
											%>
											<tr>
												<td><%=dis.getDis_title() %></td>
												<td><%=dis.getDis_keyword() %></td>
												<td><%=RealmDao.getNameByNo("" + dis.getDis_realm())%></td>
												<td><%=ConditionDAO.getNameByNo("" + dis.getDis_condition())%></td>
												<td><a class="btn btn-default btn-sm" href="modifydissertation.jsp?dis_no=<%=dis.getDis_no()%>">修改</a>&nbsp&nbsp<a class="btn btn-danger btn-sm" href="DeleteDissertationServlet?dis_no=<%=dis.getDis_no() %>" onclick="return deleteDissertation();">删除</a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>

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
	<%String str = (String)session.getAttribute("message");
		if(null != str && str != ""){%>
	alert("<%=str%>");
<%session.removeAttribute("message");
		}%>
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
	
	function deleteDissertation(){
		var flag = confirm("确定删除该篇论文吗？");
		return flag;
	}
</script>

</html>
