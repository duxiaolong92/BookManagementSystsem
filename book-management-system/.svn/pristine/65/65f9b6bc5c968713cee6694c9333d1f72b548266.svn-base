<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/hotborrow.css"
	type=text/css rel=stylesheet>
<title>热门借阅</title>
</head>

<body style="background-color: #e4e4e4">
<%
	if(session.getAttribute("newBookList") == null){
%>
<jsp:forward page="../BookServlet?actionType=getHotBorrow"></jsp:forward>
<%}else {%>
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
									<!--<![endif]-->
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
	 <table  width="1024px" border="0" align="center" cellpadding="0" cellspacing="0" style="height:34px;background-color: #0F73C1;">
  <tbody><tr>
    <td  class="menu"> 
      <ul >
           <li><a href="/book-management-system/jsp/index.jsp">首页</a></li>
    		<li><a href="/book-management-system/ReaderServlet?actionType=myLibrary">我的图书馆</a></li>
   		 <li><a href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a></li>
    		<li><a href="/book-management-system/BookServlet?actionType=getHotComment">热门评论</a></li>
      </ul></td>
    <td  class="menu1"><ul>
      <%
      	if (session.getAttribute("register") == null)
      		session.setAttribute("register", "注册");
      	if (session.getAttribute("login") == null)
      		session.setAttribute("login", "登录");
      %>
      <li><a href=
		<%if (session.getAttribute("login") == "登录") {
				out.print("/book-management-system/jsp/login.jsp");
			} else {
				out.print("/book-management-system/jsp/myLibrary.jsp");
			}%>
		style="color:#FFF">
		<%
			out.print(session.getAttribute("login"));
		%>
		&nbsp;&nbsp;
		</a>
		</li>
      <li><a href=
		<%if (session.getAttribute("register") == "注册") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit.jsp");
			}%>
		style="color:#FFF">
		<%
			out.print(session.getAttribute("register"));
		%>
		&nbsp;&nbsp;
		</a>
		</li>
    </ul></td>
  </tr>
</tbody></table>
 
	<div id="content">
		<div id="space" style="height: 20px;"></div>
		<div id="left">
			<div id="nav_sidebar">
				<div id="nav_sidebar_content">
					<ul>
					    <li style="background-color:#efeefe"><a href="#">新书通报</a></li>
						<li ><a href="#">借阅排行</a></li>
						<li ><a href="#">文学</a></li>
						<li><a href="#">科技</a></li>
						<li><a href="#">生活</a></li>
						<li><a href="#">经营</a></li>
						<li><a href="#">历史</a></li>
						<li><a href="#">流行</a></li>
						
					</ul>
				</div>
			</div>
		</div>
		<div id="right">
		<!-- 新书 -->
		<div style="display: block;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
						
							ArrayList<Book> newBookList = new ArrayList<Book>();
							newBookList = (ArrayList<Book>)session.getAttribute("newBookList");
							for(int i = 0;i < newBookList.size()&&i<28;i++){
								Book book = newBookList.get(i);
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress() %></td>
							<td><%=book.getBookTypeName() %></td>
							<td><%=book.getReadingRoomName() %></td>
							<td><%=book.getBorrowedTimes() %></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		<!-- 热门 -->
		<div style="display: none;">
			<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
						
							ArrayList<Book> allHotBookList = new ArrayList<Book>();
							allHotBookList = (ArrayList<Book>)session.getAttribute("allHotBookList");
							for(int i = 0;i < allHotBookList.size()&&i<28;i++){
								Book book = allHotBookList.get(i);

						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress() %></td>
							<td><%=book.getBookTypeName() %></td>
							<td><%=book.getReadingRoomName() %></td>
							<td><%=book.getBorrowedTimes() %></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		<!-- 文学 --> 
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotLiteratureBookList = new ArrayList<Book>();
							hotLiteratureBookList = (ArrayList<Book>) session
									.getAttribute("hotLiteratureBookList");
							for (int i = 0; i < hotLiteratureBookList.size() && i < 28; i++) {
								Book book = hotLiteratureBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
								<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
		<!-- 科技 -->
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotTechBookList = new ArrayList<Book>();
							hotTechBookList = (ArrayList<Book>) session.getAttribute("hotTechBookList");
							for (int i = 0; i < hotTechBookList.size() && i < 28; i++) {
								Book book = hotTechBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>

			</div>
		<!-- 生活 -->
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotLifeBookList = new ArrayList<Book>();
						hotLifeBookList = (ArrayList<Book>) session.getAttribute("hotLifeBookList");
							for (int i = 0; i < hotLifeBookList.size() && i < 28; i++) {
								Book book = hotLifeBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>

			</div>
		<!-- 经管 -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotEconomyBookList = new ArrayList<Book>();
							hotEconomyBookList = (ArrayList<Book>) session.getAttribute("hotEconomyBookList");
							for (int i = 0; i < hotEconomyBookList.size() && i < 28; i++) {
								Book book = hotEconomyBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
	
			</div>
		<!-- 历史 -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotHistoryBookList = new ArrayList<Book>();
							hotHistoryBookList = (ArrayList<Book>) session.getAttribute("hotHistoryBookList");
							for (int i = 0; i < hotHistoryBookList.size() && i < 28; i++) {
								Book book = hotHistoryBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
	
			</div>
		<!-- 流行 -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>编号</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>出版社</td>
							<td>图书类型</td>
							<td>藏馆地</td>
							<td>借阅次数</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotPopularBookList = new ArrayList<Book>();
							hotPopularBookList = (ArrayList<Book>) session.getAttribute("hotPopularBookList");
							for (int i = 0; i < hotPopularBookList.size() && i < 28; i++) {
								Book book = hotPopularBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<%
					int i =0;
					if(session.getAttribute("i")!=null){
						i = Integer.parseInt(session.getAttribute("i").toString());
					}
				%>
			<input type="text" id="indexID" value="<%=i%>" style="display: none;">
			<%i=0; %>
			</div>
		</div>
	</div>

	<div id="footer"></div>
	<script src="/book-management-system/js/jquery-1.8.2.js"
		type="text/javascript"></script>
	<script src="/book-management-system/js/hotborrow.js"
		type="text/javascript"></script>
<%} session.removeAttribute("i");%>
</body>
</html>