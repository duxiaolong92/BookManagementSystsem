<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<title>修改成功</title>
</head>
<body>
	<div style="margin-top: 200px; margin-left: 200px; font-size: 20px;">
		<img src="/book-management-system/images/xiugai.gif">
                       修改信息成功！ 正在跳转到登录页面……
	</div>
	<%
		session.invalidate();
		response.setHeader("refresh",
				"3;url=/book-management-system/jsp/login.jsp");
	%>
</body>
</html>