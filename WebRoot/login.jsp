<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>广西大学会议管理中心 —— 用户登录</title>
<%@include file="maincss.html"%>
<style type="text/css">
.wrapper {
	background-image: url("public/images/login.jpg");
}

input.form-control {
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="container">
			<div class="container"
				style="width: 650px; height: 300px; margin: 150px auto;">
				<!-- <form action="" method="post" name="test" style="background: #fff">
					<div class="form-group">
						<label for="exampleInputEmail1">用户名</label> <input type="text"
							class="form-control" id="exampleInputEmail1" placeholder="用户名">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">密码</label> <input type="password"
							class="form-control" id="exampleInputPassword1" placeholder="密码">
					</div>
					<div style="float: right;margin-bottom: 40px;margin-top: 15px;">
						<button type="submit" class="btn btn-default"
							style="margin-right: 40px;">确定</button>
						<button type="reset" class="btn btn-default"
							style="margin-right: 40px;">重置</button>
						<a class="btn btn-default" href="https://www.baidu.com">注册</a>
					</div>
				</form> -->
				<form class="form-horizontal" action="Login" method="post" id="form"
					style="padding: 40px; background: rgba(255,255,255,0.5);border-radius:10px;">
					<div style="margin-bottom: 10px;font-size: 20px;">
						<b>用户登录</b>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="用户名">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="密码">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<div class="checkbox" style="float: right;">
								<label> <input type="checkbox"> 记住我
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<a href="register.jsp" class="btn btn-default"
								style="width: 100%;">注册</a>
						</div>
						<div class="col-md-4">
							<button type="reset" class="btn btn-default" style="width: 100%;">重置</button>
						</div>
						<div class="col-md-4">
							<button type="button" class="btn btn-primary"
								style="width: 100%;" onclick="checkCodePost()">登录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="footer.html"%>
	</div>
	<%@include file="mainjs.html"%>
	<script type="text/javascript">
		document.getElementById("form").onkeydown = function(event) {
			var e = event || window.event
					|| arguments.callee.caller.arguments[0];
			if(e && e.keyCode==13){ // enter 键
                checkCodePost();
           }
		};

		function checkCodePost() {
			var xmlhttp;
			if (window.XMLHttpRequest) {
				// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				xmlhttp = new XMLHttpRequest();
			} else {
				// IE6, IE5 浏览器执行代码
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var message = xmlhttp.responseXML
							.getElementsByTagName("message")[0].firstChild.data;
					console.log(message);
					if (message == "success") {
						$("form").submit();
					} else {
						alert(message);
					}
				}
			};
			var username = document.getElementById("username");
			var password = document.getElementById("password");
			var url = "validation.do?username=" + escape(username.value)
					+ "&password=" + escape(password.value);
			xmlhttp.open("GET", url, true);
			xmlhttp.send();
			/* var username = $("username").val();
			var password = $("password").val();
			$.post("validation.do", {
				username : username,
				password : password
			}, function(data, status) {
				if ("success"==data){
					$("form").submit();
				}else if("用户名密码错误" == data){
					alert("用户名密码错误，请重新输入！");
				}
			}); */
		}
	</script>
</body>
</html>