<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/login.css" rel="stylesheet"
	type="text/css" />
<title>登录</title>
</head>
<body>
	<div class="container">
		<table width="1024" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tbody>
				<tr>
					<td><div style="width: 430px; float: left">
							<img src="/book-management-system/images/top_01.jpg" width="430"
								height="129">
						</div>
						<div style="width: 594px; float: left">
							<object id="FlashID"
								classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="594"
								height="129">
								<param name="movie"
									value="/book-management-system/images/banner.swf">
								<param name="quality" value="high">
								<param name="wmode" value="opaque">
								<param name="swfversion" value="9.0.45.0">
								<param name="expressinstall" value="/Scripts/expressInstall.swf">
								<object type="application/x-shockwave-flash"
									data="/book-management-system/images/banner.swf" width="594"
									height="129">
									<param name="quality" value="high">
									<param name="swfversion" value="9.0.45.0">
									<param name="expressinstall"
										value="/Scripts/expressInstall.swf">
									<div>
										<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
										<p>
											<a href="http://www.adobe.com/go/getflashplayer"><img
												src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
												alt="获取 Adobe Flash Player" width="112" height="33"> </a>
										</p>
									</div>
								</object>
							</object>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0" style="height: 34px; background-color: #0F73C1">
		<tbody>
			<tr>
				<td class="menu">
					<ul>
						<li><a href="/book-management-system/jsp/index.jsp"
							style="color: #FFF; text-decoration: none;">首页</a></li>
						<li><a href="/book-management-system/ReaderServlet?actionType=myLibrary"
							style="color: #FFF; text-decoration: none;">我的图书馆</a></li>
					</ul></td>
				<td class="menu1"><ul>

						<li><a href="#" style="color: #FFF">登录</a></li>
						<li><a href="/book-management-system/jsp/register.jsp"
							style="color: #FFF">注册</a></li>
					</ul></td>
			</tr>
		</tbody>
	</table>
	<div id="content">
		<form id="login" method="post"
			action="/book-management-system/ReaderServlet?actionType=login"
			style="padding-left: 150px;">
			<table border="0" cellpadding="0" cellspacing="0" align="left"
				style="width: 550px;">
				<tr>

					<td width="108" height="49" valign="top" align="right"></td>
					<td width="210" valign="top" style="color: red">
						&nbsp;&nbsp;&nbsp; <%
 	String msg = null;
 	msg = (String) request.getAttribute("msg");
 	if (msg != null) {
 		out.println("您输入的账号或密码错误");
 	}
 	request.setAttribute("msg", null);
 %>
					</td>
					<td id="error"></td>
				</tr>
				<tr>
					<td width="108" height="49" valign="top" align="right">用户名</td>
					<td width="210" valign="top"><input id="user_name"
						name="user_name" type="text" class="text_input" value="用户名/邮箱">
					</td>
					<td width="234" valign="top"><span class="post_error1"
						style="color: red"></span></td>
				</tr>
				<tr>
					<td height="49" valign="top" align="right">密码&nbsp;&nbsp;&nbsp;</td>
					<td valign="top"><input id="password" name="password"
						type="password" class="text_input" value=""></td>
					<td width="234" valign="top"><span class="post_error2"
						style="color: red"></span></td>
				</tr>
				<tr>
					<td height="55" valign="top">&nbsp;</td>
					<td valign="top"><input class="button" type="submit"
						value="登录" id="loginButton" name="loginButton"> <a
						href="register.jsp" class="register">申请注册帐号</a></td>
					<td valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td height="15">&nbsp;</td>
					<td id="forget_password"><a
						href="/book-management-system/jsp/resetPassword.jsp"
						class="forget_password" style="visited: font-color:#1E95E5">
							忘记密码</a></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="footer"></div>
	<SCRIPT src="/book-management-system/js/jquery.min.js"
		type=text/javascript></SCRIPT>
	<SCRIPT src="/book-management-system/js/login.js" type=text/javascript></SCRIPT>
</body>
</html>