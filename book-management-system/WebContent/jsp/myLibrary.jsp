<%@page import="edu.jxsd.x3510.bean.Comment"%>
<%@page import="edu.jxsd.x3510.bean.ReserveBook"%>
<%@page import="edu.jxsd.x3510.bean.GiveBackBook"%>
<%@page import="java.util.Iterator"%>
<%@page import="edu.jxsd.x3510.bean.BorrowBook"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.jxsd.x3510.bean.Reader"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/myLibrary.css" rel="stylesheet"
	type="text/css" />
<title>我的图书馆</title>
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
												alt="获取 Adobe Flash Player" width="112" height="33">
											</a>
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
						<li><a href="/book-management-system/jsp/myLibrary.jsp">我的图书馆</a>
						</li>
						<li><a
							href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a>
						</li>
						<li><a href="/book-management-system/BookServlet?actionType=getHotComment">热门评论</a>
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
		<div id="left">
			<div id="navsidebar">
				<ul id="nav_sidebar_content">
					<li id="reader" class=""><a href="#">证件信息</a>
					</li>
					<li id="borrow"><a href="#">书刊借阅</a>
					</li>
					<li id="illegal"><a href="#">违章缴款</a>
					</li>
					<li id="reserve"><a href="#">预约信息</a>
					</li>
					<li id="lost"><a href="#">书刊遗失</a>
					</li>
					<li id="myComment"><a href="#">我的书评</a>
					</li>

				</ul>
			</div>
		</div>
		<div id="right">
			<%
				Reader reader = new Reader();
				reader = (Reader) session.getAttribute("reader");
			%>
			<div id="reader_info">
				<p style="color: red; border-bottom: thin;"><%=reader.getReaderName()%>，您好
				</p>
				<table width="630px;" style="text-align: left;" cellpadding="5px;">
					<tr>
						<td width="230px;" height="40px">读者证件号：<%=reader.getReaderID()%></td>
						<td width="200px;" height="40px">姓名：<%=reader.getReaderName()%></td>
						<td width="200px;" height="40px">性别：<%=reader.getSex()%></td>
					</tr>
					<tr>
						<td width="200px;" height="40px">读者类型：本科生</td>
						<td width="200px;" height="40px">工作单位：<%=reader.getAcademy()%></td>
						<td width="200px;" height="40px">班级：<%=reader.getClassName()%></td>
					</tr>
					<tr>
						<td width="200px;" height="40px">电话：<%=reader.getTel()%></td>
						<td width="230px;" height="40px">邮箱：<%=reader.getEmail()%></td>
					</tr>
				</table>
				<div id="button">
					<p align="right" style="margin-right: 57px;">
						<input id="modify_psd" type="submit"
							onclick="window.location.href='/book-management-system/ReaderServlet?actionType=resetSelfPassword&email=<%=reader.getEmail()%>'"
							value="修改个人密码">&nbsp;<input id="modify_info"
							type="button"
							onclick="window.location.href='/book-management-system/ReaderServlet?actionType=changeemail&email=<%=reader.getEmail()%>'"
							value="修改联系电话">
					</p>
				</div>
				<table class="rule" width="700px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<tr style="background-color: #efeefe;" height="30px;">
						<td>规则名称</td>
						<td>适用馆藏地</td>
						<td>图书流通类型</td>
						<td>最大借阅册数</td>
						<td>借期</td>
						<td>预约</td>
						<td>续借</td>
						<td>其他</td>
					</tr>
					<tr height="30px;">
						<td>其他借阅规则</td>
						<td>所有馆藏地!</td>
						<td>所有流通类型</td>
						<td>5</td>
						<td>31</td>
						<td>不允许</td>
						<td>允许</td>
						<td>查看详细借阅规则</td>
					</tr>
				</table>
			</div>
			<div id="borrow_info">
				<div class="menu_box">
					<ul>
						<li id="one1" class="hover"><a href="#">当前借阅</a>
						</li>
						<li id="one2" class=""><a href="#">历史借阅</a>
						</li>
					</ul>
				</div>
				<div id="book1" style="display: block">
					<table class="book1" width="700px;" cellpadding="0px;"
						style="border-collapse: collapse">
						<thead>
							<tr style="background-color: #efeefe;" height="30px;">
								<td>图书ID</td>
								<td>图书题名</td>
								<td>借阅日期</td>
								<td>应还日期</td>
								<td>藏馆地</td>
								<td>续借</td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<BorrowBook> borrowList = new ArrayList<BorrowBook>();
								borrowList = (ArrayList<BorrowBook>) session
										.getAttribute("borrowList");
								for (int i = 0; i < borrowList.size(); i++) {
									BorrowBook borrowBook;
									borrowBook = borrowList.get(i);
							%>
							<tr height="30px;">
								<td><%=borrowBook.getBookID()%></td>
								<td><%=borrowBook.getBookName()%></td>
								<td><%=borrowBook.getBorrowTime()%></td>
								<td><%=borrowBook.getReturnTime()%></td>
								<td><%=borrowBook.getReadingRoomName()%></td>
								<td><input type="button" value="续借">
								</td>
								<%
									}
								%>
							
						</tbody>
					</table>
				</div>
				<div id="book2" style="display: none;">
					<table class="book1" width="700px;" cellpadding="0px;"
						style="border-collapse: collapse">
						<thead>
							<tr style="background-color: #efeefe;" height="30px;">
								<td>图书ID</td>
								<td>图书题名</td>
								<td>借阅日期</td>
								<td>归还日期</td>
								<td>藏馆地</td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<GiveBackBook> givebackList = new ArrayList<GiveBackBook>();
								givebackList = (ArrayList<GiveBackBook>) session
										.getAttribute("givebackList");
								for (int i = 0; i < givebackList.size(); i++) {
									GiveBackBook giveBackBook = null;
									giveBackBook = givebackList.get(i);
							%>
							<tr height="30px;">
								<td><%=giveBackBook.getBookID()%></td>
								<td><%=giveBackBook.getBookName()%></td>
								<td><%=giveBackBook.getBorrowTime()%></td>
								<td><%=giveBackBook.getReturnTime()%></td>
								<td><%=giveBackBook.getReadingRoomName()%></td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
			<div id="illegal_info" style="display: none;">
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">违规记录</a>
						</li>
						<li id="two2" class=""><a href="#">缴款记录</a>
						</li>
					</ul>
				</div>
				<div id="illegal_info1" style="display: block; margin-left: 30px;">
					<img src="/book-management-system/images/icon_err.jpg"
						align="middle">你的违规记录为空
				</div>
				<div id="illegal_info2" style="display: none;">
					<table class="book1" width="700px;" cellpadding="0px;"
						style="border-collapse: collapse">
						<thead>
							<tr style="background-color: #efeefe;" height="30px;">
								<td>图书ID</td>
								<td>图书题名</td>
								<td>作者</td>
								<td>借阅日期</td>
								<td>应还日期</td>
								<td>藏馆地</td>
								<td>应缴</td>
								<td>实缴</td>
								<td>处理状态</td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<GiveBackBook> fineList = new ArrayList<GiveBackBook>();
								fineList = (ArrayList<GiveBackBook>) session
										.getAttribute("fineList");
								for (int i = 0; i < fineList.size(); i++) {
									GiveBackBook fine = null;
									fine = (GiveBackBook) fineList.get(i);
							%>
							<tr height="30px;">
								<td><%=fine.getBookID()%></td>
								<td><%=fine.getBookName()%></td>
								<td><%=fine.getAuthor()%></td>
								<td><%=fine.getBorrowTime()%></td>
								<td><%=fine.getReturnTime()%></td>
								<td><%=fine.getReadingRoomName()%></td>
								<td><%=fine.getFine()%></td>
								<td><%=fine.getFine()%></td>
								<td>已处理</td>
							</tr>
						</tbody>
						<%
							}
						%>
					</table>

				</div>
			</div>
			<div id="reserve_info" style="display: none;">
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">预约信息</a>
						</li>
					</ul>
				</div>
				<!-- <img src="/book-management-system/images/icon_err.jpg" align="middle">你的预约记录为空 -->
				<table class="book1" width="700px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color: #efeefe;" height="30px;">
						    <td>读者ID</td>
							<td>图书ID</td>
							<td>图书题名</td>
							<td>预约日期</td>
							<td>藏馆地</td>
							<td>取消预约</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<ReserveBook> reservList = new ArrayList<ReserveBook>();
							reservList = (ArrayList<ReserveBook>) session
									.getAttribute("reserveList");
							System.out.print(reservList);
							for (int i = 0; i < reservList.size(); i++) {
								ReserveBook reserveBook = null;
								reserveBook = (ReserveBook) reservList.get(i);
						%>
						<tr height="30px;">
						    <td><%=reserveBook.getReaderID()%></td>
							<td><%=reserveBook.getBookID()%></td>
							<td><%=reserveBook.getBookName()%></td>
							<td><%=reserveBook.getReserveTime()%></td>
							<td><%=reserveBook.getReadingRoomName()%></td>
							<td><input type="button" value="取消预约" onclick="window.location.href='/book-management-system/ReaderServlet?actionType=deleteReserve&readerID=<%=reserveBook.getReaderID()%>&bookID=<%=reserveBook.getBookID() %>'"></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>


			</div>
			<div id="lost_info" style="display: none;">
				<!-- <hr size="1" width="100%" noshade="noshade" color="red"/> -->
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">遗失记录</a>
						</li>
					</ul>
				</div>
				<div style="height: 20px;"></div>
				<div style="margin-left: 30px;">
				<img src="/book-management-system/images/icon_err.jpg"
					align="middle">你的遗失记录为空</div>
					
			</div>
			<div id="myComment_info" style="display: none;">
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">我的书评</a>
						</li>
					</ul>
				</div>
				<div class="cm_content">
					<table id="cm_content_tab" width="700" cellpadding="1px;"
						style="border-collapse: collapse">
						<thead>
							<tr>
								<td id="left_col"></td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Comment> commentList = new ArrayList<Comment>();
								commentList = (ArrayList<Comment>) session
										.getAttribute("commentList");
								System.out.print(commentList);
								for (int i = 0; i < commentList.size(); i++) {
									Comment myComment = null;
									myComment = (Comment) commentList.get(i);
							%>
							<%-- <tr id="left_col" height="25">
								<td><div class="title">
										图书ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=myComment.getBookID()%></div>
								</td>
							</tr> --%>
							<tr id="left_col" height="20">
								<td><div class="title">
										 <a style="color:#107BFA;" href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=myComment.getBookID() %>" style="font-weight:bold;"><%=myComment.getBookName() %></a> 
									</div>
								</td>
							</tr>
							<tr id="left_col" height="25">
								<td><div class="title" style="color: #666666;line-height: 20px;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=myComment.getComment()%></div>
								</td>
							</tr>
							<tr id="right_col" height="25" style="border-bottom: thin;">
								<td>
								<a id="commentupdate" href="/book-management-system/BookServlet?actionType=delComment&readerID=<%=myComment.getReaderID()%>&bookID=<%=myComment.getBookID()%>">删除</a>
								<div class="title">
										发表时间：<%=myComment.getCommentTime()%></div>
								</td>
							</tr>
							<tr>
								<td><div style="border-bottom: dashed thin; color: #ccc"></div>
								</td>
							</tr>
						</tbody>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<div style="width: 1024px; height: 4px;"></div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript"
		src="/book-management-system/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="/book-management-system/js/myLibrary.js"></script>
</body>
</html>