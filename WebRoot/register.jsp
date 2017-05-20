<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="models.Professional"%>
<%@page import="dao.ProfessionalDAO"%>
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

.form-control {
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<div class="container">
			<div class="container"
				style="width: 650px; height: auto; margin: 150px auto; padding: 20px;">
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
				<form class="form-horizontal" action="Register" method="POST"
					style="padding: 40px; background: rgba(255,255,255,0.5);border-radius:10px;"
					id="form">
					<div style="margin-bottom: 10px;font-size: 20px;">
						<b>用户注册</b>
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
							<input type="password" class="form-control" id="repassword"
								name="repassword" placeholder="确认密码">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="姓名">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<select class="form-control" id="sex" name="sex" placeholder="性别">
								<option value="男">性别：男</option>
								<option value="女">性别：女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="position"
								name="position" placeholder="职位">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<select class="form-control" id="professional"
								name="professional">
								<%
									ArrayList<Professional> al = ProfessionalDAO.getAllProfessional();
															int i = 1;
															for(Professional p : al){
								%>
								<option value="<%=p.getPro_no()%>">职称：<%=p.getPro_name()%></option>
								<%
									i++;}
								%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="IDnumber" name="IDnumber"
								placeholder="身份证号码">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="taxpay" name="taxpay"
								placeholder="纳税人识别号">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="company"
								name="company" placeholder="工作单位">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="电子邮箱">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="tel" name="tel"
								placeholder="电话号码">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="postcode"
								name="postcode" placeholder="邮编">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="text" class="form-control" id="qq" name="qq"
								placeholder="QQ号码">
						</div>
					</div>
					<div class="form-group">
						<div class="">
							<textarea rows="3" class="form-control" placeholder="研究领域"
								id="field" name="field"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<a href="login.jsp" class="btn btn-default" style="width: 100%;">已有账号，登录</a>
						</div>
						<div class="col-md-4">
							<button type="reset" class="btn btn-default" style="width: 100%;">重置</button>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-primary"
								style="width: 100%;" onclick="checkUsernamePost()">注册</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="footer.html"%>
	</div>
	<%@include file="mainjs.html"%>
	<script
		src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
	<script type="text/javascript">
		/* document.getElementById("form").onkeydown = function(event) {
			var e = event || window.event
					|| arguments.callee.caller.arguments[0];
			if (e && e.keyCode == 13) { // enter 键
				checkUsernamePost();
			}
		};

		function checkUsernamePost() {
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
						console.log(message + "1");
						$("form").submit();
					} else {
						console.log(message + "2");
						
						alert(message);
					}
				}
			};
			var username = document.getElementById("username");
			var url = "registerValidationServlet.do?username="
					+ escape(username.value);
			xmlhttp.open("GET", url, true);
			xmlhttp.send();
		} */

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
					username : {/*键名username和input name值对应*/
						message : 'The username is not valid',
						validators : {
							notEmpty : {/*非空提示*/
								message : '用户名不能为空'
							},
							stringLength : {/*长度提示*/
								min : 6,
								max : 20,
								message : '用户名长度必须在6到20之间'
							},
							threshold : 6, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
							remote : {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
								url : 'registerValidationServlet.do',//验证地址
								message : '用户已存在',//提示消息
								delay : 2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
								type : 'GET'//请求方式
							/**自定义提交数据，默认值提交当前input value
							 *  data: function(validator) {
							      return {
							          password: $('[name="passwordNameAttributeInYourForm"]').val(),
							          whatever: $('[name="whateverNameAttributeInYourForm"]').val()
							      };
							   }
							 */
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_\.]+$/,
								message : '用户名由数字字母下划线和.组成'
							}
						/*最后一个没有逗号*/
						}
					},
					password : {
						message : '密码无效',
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 20,
								message : '密码长度必须在6到20之间'
							},
							identical : {//相同
								field : 'password', //需要进行比较的input name值
								message : '两次密码不一致'
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
</body>
</html>