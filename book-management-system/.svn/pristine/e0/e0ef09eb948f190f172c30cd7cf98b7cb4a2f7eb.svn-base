<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<title>注册成功</title>
</head>
<body>
	<div style="margin-top: 200px; margin-left: 200px; font-size: 20px;">
		<img src="/book-management-system/images/16-111129230437.gif">恭喜您注册成功，确认信已经发到你的邮箱 ，你需要点击邮件中的确认链接来完成注册。
	</div>
	<%
		session.invalidate();
		response.setHeader("refresh",
				"3;url=/book-management-system/jsp/login.jsp");
	%>
</body>
</html>