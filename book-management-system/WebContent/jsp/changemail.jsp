<%@page import="java.beans.IntrospectionException"%>
<%@page import="edu.jxsd.x3510.bean.Reader"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<style type="text/css"></style>
<link href="/book-management-system/css/resetPassword.css"
	rel="stylesheet" type="text/css" />
<title>修改联系信息</title>
</head>
<body id="changeemail">
	
	<%  
	    String email=(String)session.getAttribute("email");
	   
		
	%>
	<div class="page">
		<div id="page_form" class="r5px">
			<img src="/book-management-system/images/li.jpg">
			<h2>修改个人信息</h2>
			<div class="page_form_wrap c">
				<form id="resetForm" method="post"
					action="/book-management-system/ReaderServlet?actionType=resetTel&email=<%=email%>">
					<input type="hidden" name="_xsrf"
						value="39ab6dbf4fa04c62a716a681994cb8d3">
					<div style="height: 100px;">
						<div style="height: 100px;">
							<p>
								<label for="tel">请输入联系电话</label> <input tabindex="1"
									id="tel" type="text" class="s r3px" name="tel">
							</p>
							<span style="float: right; color: #ed1c24" class="post_error1"></span>
						</div>
					<%-- 	<div style="height: 100px;">
							<p>
								<label for="email">请输入联系邮箱</label> <input tabindex="1"
									id="email" type="text" class="s r3px"
									name="email">
							</p>
							<span style="float: right; color: #ed1c24" class="post_error2"><%  
																						 	   if (email .equals(request.getParameter("email"))) {
																						 	   out.println("您输入的邮箱已被注册");}%></span>
						</div> --%>
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
<script src="/book-management-system/js/changeemail.js"
	type="text/javascript"></script>
</html>