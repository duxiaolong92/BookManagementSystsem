<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<style type="text/css"></style>
<link href="/book-management-system/css/resetPassword.css" rel="stylesheet" type="text/css"/> 
<title>Insert title here</title>
</head>
<body id="resetpassword">
<div class="page">
<div id="page_form" class="r5px">
<img src="/book-management-system/images/li.jpg">
<h2>重设密码</h2>
<div class="page_form_wrap c">
<form method="post" action="/book-management-system/MailServlet?actionType=resetPassword">
<input type="hidden" name="_xsrf" value="39ab6dbf4fa04c62a716a681994cb8d3">
<p >
	<label style="color:red">&nbsp;<%
		String msg = null;
		msg = (String) request.getAttribute("email");
		if (msg != null) {
			out.println("您输入的邮箱不存在");
		}
		request.setAttribute("msg", null);
	%></label>

	<label for="login_email">&nbsp;邮 箱</label>
&nbsp;<input tabindex="1" id="login_email" type="text" class="s r3px" name="to">
</p>
<p class="fr">
<span> 
<input tabindex="4" class="button_blue r3px" type="submit" name="" value="重设密码">
</span>
</p>
<div class="c"></div>
</form>
</div>
</div>
</div> 
</html>