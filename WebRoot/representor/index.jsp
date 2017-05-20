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

<title>广西大学会议管理中心 —— 个人中心</title>

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
					<li class="active"><a href="index.jsp"> <i class="ti-user"></i>
							<p>个人信息</p>
					</a></li>
					<li><a href="dissertation.jsp"> <i class="fa fa-file-word-o"></i>
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
									<h4 class="title">修改个人信息</h4>
								</div>
								<div class="content">
									<form action="../ModifyRep" method="POST" id="form">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>用户名</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="Company"
														name="username" value="<%=rep.getRep_username()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>姓名</label> <input type="text"
														class="form-control border-input" placeholder="姓名"
														value="<%=rep.getRep_name()%>" name="name">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>性别</label> <select class="form-control" name="sex">
														<%
															String s1 = rep.getRep_sex();
														%>
														<option value="男" <%if(s1.equals("男")){%>
															selected="selected" <%}%>>男</option>
														<option value="女" <%if(s1.equals("女")){%>
															selected="selected" <%}%>>女</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>身份证号码</label> <input type="text" name="IDnumber"
														class="form-control border-input" placeholder="身份证号码"
														value="<%=rep.getRep_IDnumber()%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>职位</label> <input type="text" name="position"
														class="form-control border-input" placeholder="职位"
														value="<%=rep.getRep_position()%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>职称</label> <select class="form-control"
														id="professional" name="professional">
														<%
															ArrayList<Professional> al = ProfessionalDAO.getAllProfessional();
																																																																																							int i = 1;
																																																																																							for(Professional p : al){
														%>
														<option value="<%=p.getPro_no()%>"
															<%if(rep.getRep_professional() == p.getPro_no()){%>
															selected="selected" <%}%>><%=p.getPro_name()%></option>
														<%
															i++;}
														%>
													</select>
												</div>
											</div>
										</div>
										<input type="hidden" name="no" value="<%=rep.getRep_no()%>">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>工作单位</label> <input type="text" name="company"
														class="form-control border-input" placeholder="工作单位"
														value="<%=rep.getRep_company()%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>纳税人识别号</label> <input type="text" name="taxpay"
														class="form-control border-input" placeholder="纳税人识别号"
														value="<%=rep.getRep_taxpay()%>">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>邮编</label> <input type="text" name="postcode"
														class="form-control border-input" placeholder="邮编"
														value="<%=rep.getRep_postcode()%>">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>电子邮箱</label> <input type="text" name="email"
														class="form-control border-input" placeholder="电子邮箱"
														value="<%=rep.getRep_email()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>联系电话</label> <input type="text" name="tel"
														class="form-control border-input" placeholder="联系电话"
														value="<%=rep.getRep_tel()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>QQ号码</label> <input type="text" name="qq"
														class="form-control border-input" placeholder="QQ号码"
														value="<%=rep.getRep_qq()%>">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>国家</label> <input name="country" type="text"
														class="form-control border-input" placeholder="国家"
														value="<%=rep.getRep_country()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>省份</label> <input name="province" type="text"
														class="form-control border-input" placeholder="省份"
														value="<%=rep.getRep_province()%>">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>城市</label> <input name="city" type="text"
														class="form-control border-input" placeholder="城市"
														value="<%=rep.getRep_city()%>">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>研究领域</label>
													<textarea rows="5" class="form-control border-input"
														name="field" placeholder="研究领域"><%=rep.getRep_field()%></textarea>
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
			if("success".equals(mess)){
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
			IDnumber:{
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
