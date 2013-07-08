<%@page import="edu.jxsd.x3510.bean.Inform"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/inform.css" rel="stylesheet"
	type="text/css" />
<title>公告</title>
</head>
<body style="background-color: #e4e4e4">
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
		cellspacing="0" style="height: 34px; background-color: #0F73C1;">
		<tbody>
			<tr>
				<td class="menu">
					<ul>
						<li><a href="/book-management-system/jsp/index.jsp">首页</a>
						</li>
						<li><a
							href="/book-management-system/ReaderServlet?actionType=myLibrary">我的图书馆</a>
						</li>
						<li><a
							href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a>
						</li>
						<li><a
							href="/book-management-system/BookServlet?actionType=getHotComment">热门评论</a>
						</li>
					</ul>
				</td>
				<td class="menu1"><ul>
						<%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "注册");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "登录");
						%>
						<li><a
							href=<%if (session.getAttribute("login") == "登录") {
				out.print("/book-management-system/jsp/login.jsp");
			} else {
				out.print("/book-management-system/jsp/myLibrary.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("login"));
 %> &nbsp;&nbsp; </a></li>
						<li><a
							href=<%if (session.getAttribute("register") == "注册") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("register"));
 %> &nbsp;&nbsp; </a></li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>

	<div id="content">
		<div style="width: 1024px; height: 10px;"></div>
		<div id="right_content">
			<div class="menu_box">
				<%
					Inform inform = new Inform();
					inform = (Inform) session.getAttribute("inform");
				%>
				<ul>
					<li id="one1" class="hover"><a href="#"><%=inform.getTitle()%></a>
					</li>
					<li id="time" class="hover"><a href="#">发布时间：<%=inform.getInformTime()%></a>
					</li>
				</ul>
			</div>
			<div>
				<div id="page">
					<a
						href="/book-management-system/InformServlet?actionType=inform&informID=<%=inform.getInformID() - 1%>">上一篇</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="/book-management-system/InformServlet?actionType=inform&informID=<%=inform.getInformID() + 1%>">下一篇</a>
				</div>
				<div>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;<%=inform.getInform()%></p>
					<p style="margin-left: 300px;">
						<a href="/book-management-system/InformServlet?actionType=moreInform">返回列表</a>
				</div>
			</div>
		</div>
		<div style="width: 1024px; height: 10px;"></div>
		<div id="footer"></div>
	</div>

</body>
</html>