<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT src="/book-management-system/js/jquery.min.js"
		type=text/javascript></SCRIPT>
<script type="text/javascript" src="/book-management-system/js/search.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/search.css" rel="stylesheet"
	type="text/css" />
<title>搜索</title>
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
										<p>
											<a href="http://www.adobe.com/go/getflashplayer"><img
												src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
												alt="获取 Adobe Flash Player" width="112" height="33"> </a>
										</p>
									</div>
								</object>
							</object>
						</div></td>
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
						<li><a href="/book-management-system/ReaderServlet?actionType=myLibrary">我的图书馆</a>
						</li>
						<li><a href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a>
						</li>
						<li><a href="/book-management-system/BookServlet?actionType=getHotComment">热门评论</a>
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
		<div id="header"></div>
		<div id="right">
			<div style="height: 10px;"></div>
			<div id="serach_box">
				<div
					style="font-size: 18px; font-family: 黑体; color: #1E95E5; height: 50px;">
					<form method="post" action="/book-management-system/BookServlet?actionType=search&pageNow=0">
							<select class="form_select" name="form_select">
								<option selected="selected" value="0">标题</option>
								<option value="1">图书ID</option>
								<option value="2">ISBN</option>
								<option value="3">图书类型</option>
								<option value="4">作者</option>
								<option value="5">简介</option>
							</select>
							<input id="search_in_result" name="search_text" type="text" style="color: #888888;" value="重新搜索">
							<input name="search_submit" type="submit" id="search_submit"
								value="">
						</form>
					<!-- <form action="" method="post">
						
						<input class="button" type="submit" value="搜索">
					</form> -->
				</div>
			</div>
			<%
			int bookListSize = 0;
			int pageNow = 0;
			int PAGESIZE = 15;
			int readerID = 0;
			Reader reader = null;
			String keywords = null;
			String type = null;
			bookListSize = Integer.parseInt(session.getAttribute("bookListSize").toString());
			pageNow = Integer.parseInt(session.getAttribute("pageNow").toString());	
			
			if(session.getAttribute("reader")==null||session.getAttribute("reader")==""){
				readerID = 0;
			}else{
				reader = (Reader)(session.getAttribute("reader"));
				readerID = reader.getReaderID();
			}
			%>
			<div class="space">
			<%if(bookListSize < 15){
				out.write("<span style='font-size: 12px; margin-left: 550px;'>搜索结果 共"+bookListSize+"条 </span>");
			}else{
				out.write("<span style='font-size: 12px; margin-left: 550px;'>搜索结果"+(pageNow*PAGESIZE+1)+"-"+(pageNow+1)*PAGESIZE+" 共"+bookListSize+" 条</span>");
			}
				%>
					</div>
			<div id="search_content">
				<table width="720" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<%
						
						
						int pageCount = bookListSize/PAGESIZE;
						
						ArrayList<Book> bookList = new ArrayList<Book>();
						if (session.getAttribute("searchBookList") == null
								|| session.getAttribute("searchBookList").equals("")) {
							%>
							<% 

						} else {
							bookList = (ArrayList<Book>) session.getAttribute("searchBookList");
						}
						for (int i = 0; i < bookList.size(); i++) {
							Book book = bookList.get(i);
					%>
							<td width="100"><a
								href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><img
									src="<%=book.getBookImage()%>" height="100" width="70">
							</a>
								<div style="margin: 10px;">
									<p class="ul"></p>
								</div></td>
							<td width="580"><a
								href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><div
										class="text1"><%=book.getBookName()%></div>
							</a>
								<div class="text2"><%=book.getAuthor()%>
									/
									<%=book.getPress()%>
									/
									<%=book.getPrice()%>
									/<%=book.getISBN() %>
								</div>
								<div class="text2">
									<span class="status">图书状态：<%=book.getStatus() %></span>
									<input class="bookID" value="<%=book.getBookID()%>" style="display: none">
									<input class="readerID" value="<%=readerID%>"style="display: none">
									<% if(book.getStatus().equals("可借")){
										out.write("<input type='button' class='reserve' value='预&nbsp;&nbsp;约'>");
									}									
										%>
								</div>
								<div style="margin: 10px;">
									<p class="ul"></p>
								</div>
							</td>
						</tr>
					</tbody>
					<%} %>
				</table>
				<%
				if(bookList.size() < 3){
					out.write("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
				}
				%>
			</div>
			<div class="paginator"
				style="margin-left: 242px; margin-bottom: 30px;">
				<%if(pageCount != 0){			
				%>
				<span class="prev">  <a href="/book-management-system/BookServlet?actionType=search&pageNow=<%=pageNow-1%>&search_text=<%=keywords%>&form_select=<%=type%>"> &lt;前页</a> </span> 
					<%
					
					for(int i = 0;i < pageCount+1;i++){		
						%>
						<a href="/book-management-system/BookServlet?actionType=search2&pageNow=<%=i%>"><%=i+1%></a>
						<%} %>
				<span> <a href="/book-management-system/BookServlet?actionType=search2&pageNow=<%=pageNow+1%>">后页&gt;</a>
				</span>
				<%} %>
			</div>
		</div>
		<input id="pageNow" value="<%=pageNow%>" style="display:none">
		<input id="bookListSize" value="<%=bookListSize%>" style="display:none">
		<div style="width: 1024px; height: 4px;"></div>
	</div>

	<div id="footer"></div>
	<script type="text/javascript"
		src="/book-management-system/js/jquery.min.js"></script>
</body>
</html>


