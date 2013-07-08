<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/spider.css"
	type=text/css rel=stylesheet>
<title>信息搜索</title>
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
						<li><a href="/book-management-system/jsp/index.jsp">首页</a></li>
						<li><a href="/book-management-system/jsp/myLibrary.jsp">我的图书馆</a>
						</li>
						<li><a href="/book-management-system/jsp/hotborrow.jsp">热门借阅</a>
						</li>
						<li><a href="/book-management-system/jsp/hotcomment.jsp">热门评论</a>
						</li>
					</ul></td>
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
 						%> &nbsp;&nbsp; </a>
						</li>
						<li><a
								href=<%if (session.getAttribute("register") == "注册") {
								out.print("/book-management-system/jsp/register.jsp");
								} else {
								out.print("/book-management-system/jsp/exit.jsp");
								}%>
								style="color: #FFF"> <%
	 						out.print(session.getAttribute("register"));
						 %> &nbsp;&nbsp; </a>
							</li>
					</ul></td>
			</tr>
		</tbody>
	</table>

	<div id="content">
		<div style="height: 20px;"></div>
		<form method="post"
			action="/book-management-system/SpiderServlet?actionType=spider">
			<div id="search">
				<div
					style="font-size: 20px; font-family: 黑体; margin-left: 150px; color: #1E95E5;">
					搜索图书 <input type="text" name="search"
						style="width: 100px; margin-left: 30px;"><input
						class="button" type="submit" value="搜索">
				</div>
			</div>
		</form>
		
		<div id="result">
			<p style="text-align: right; width: 700px; height: 20px;">搜索结果:1-15</p>
			<table width="720" height="50" border="0" cellspacing="0"
				cellpadding="0">
				<tbody>
					<%
						ArrayList<Book> bookList = new ArrayList<Book>();
						if (session.getAttribute("bookList") == null
								|| session.getAttribute("bookList").equals("")) {
							%><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><% 

						} else {
							bookList = (ArrayList<Book>) session.getAttribute("bookList");
						}
						for (int i = 0; i < bookList.size(); i++) {
							Book book = bookList.get(i);
					%>
					<tr>
						<td width="100"><img src="<%=book.getBookImage()%>"
							height="100" width="70">
							<div style="margin: 10px;">
								<p class="ul"></p>
							</div></td>
						<td width="580">
							<div class="text1"><%=book.getBookName()%>
							</div>
							<div class="text2"><%=book.getAuthor()%>
								/
								<%=book.getPress()%>
								/
								<%=book.getPrice()%></div>
							<div class="text2">
								<a href="/book-management-system/SpiderServlet?actionType=removeBook&i=<%=i%>">删除</a>
							</div>
							<div style="margin: 10px;">
								<p class="ul"></p>
							</div>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<form method="post"	action="/book-management-system/SpiderServlet?actionType=saveBook">
					<div id="save" style="width: 100px;">
						<input class="button" type="submit" value="保存"
							style="width: 40; margin-bottom: 50px;">
					</div>
			</form>
		</div>
	</div>
	
	<div id="footer"></div>
	<script src="/book-management-system/js/jquery-1.8.2.js"
		type="text/javascript"></script>

</body>
</html>