<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<style type="text/css"></style>
<link href="/book-management-system/css/resetPassword.css"
	rel="stylesheet" type="text/css" />

<title>修改个人密码</title>
</head>
<body id="resetpassword">
	
	<%
		String email=(String)session.getAttribute("email");
		
	%>
	<div class="page">
		<div id="page_form" class="r5px">
			<img src="/book-management-system/images/li.jpg">
			<h2>重设密码</h2>
			<div class="page_form_wrap c">
				<form id="resetForm" method="post"
					action="/book-management-system/ReaderServlet?actionType=resetPassword&email=<%=email%>">
					<input type="hidden" name="_xsrf"
						value="39ab6dbf4fa04c62a716a681994cb8d3">
					<div style="height: 200px;">
						<div style="height: 100px;">
							<p>
								<label for="password">密码</label> <input tabindex="1"
									id="password" type="password" class="s r3px" name="password">
							</p>
							<span style="float: right; color: #ed1c24" class="post_error1"></span>
						</div>
						<div style="height: 100px;">
							<p>
								<label for="confirmPassword">密码确认</label> <input tabindex="1"
									id="confirmPassword" type="password" class="s r3px"
									name="confirmPassword">
							</p>
							<span style="float: right; color: #ed1c24" class="post_error2"></span>
						</div>
					</div>
					<p class="fr">
						<span> <input tabindex="4" class="button_blue r3px"
							type="submit" name="" value="提交"> </span>
					</p>
					<div class="c"></div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="/book-management-system/js/jquery-1.8.2.js"
	type="text/javascript"></script>
<script src="/book-management-system/js/resetForm.js"
	type="text/javascript"></script>
</html>