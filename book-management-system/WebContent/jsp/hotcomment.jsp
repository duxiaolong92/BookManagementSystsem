<%@page import="java.util.ArrayList"%>
<%@page import="edu.jxsd.x3510.bean.Comment"%>
<%@page import="edu.jxsd.x3510.bean.Book" %>
<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/hotcomment.css"
	type=text/css rel=stylesheet>
<title>热门评论</title>
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
						<li><a href="#">热门评论</a>
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
		<div id="article">
		<% ArrayList<Comment> commentList=new ArrayList<Comment>();
		   commentList=(ArrayList<Comment>)session.getAttribute("commentList");
		   for(int i=0;i<commentList.size()&&i<20;i++){
			   Comment comment=commentList.get(i);
		%>
		<table
				style="margin: auto; border-bottom: 1px dashed; border-color: #d7d7d7"
				width="760" border="0" cellspacing="3" cellpadding="5">
				<tr>
					<td width="200" rowspan="4"><img
						src="<%=comment.getBookImage()%>"
						style="border: 1px solid ; width: 60px;height: 80px;"></td>
					<td width="800"><a href="#"></a></td>
				</tr>
				<tr>
					<td><%=comment.getReaderName() %>&nbsp;&nbsp;评论：<a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=comment.getBookID() %>" style="font-weight: bold;"><%=comment.getBookName() %></a></td>
				</tr>
				<tr>
					<td> <div class="short_introduce" style="color: #666666;line-height: 20px;" >
							&nbsp;&nbsp;&nbsp;&nbsp;<% String  source=comment.getComment();
							                            int length = 50;
							                            if(source.length()<50){
							                            	length=source.length();
							                            }
							                            else{
							                            	String newString =source.substring(0,length);
							                            	out.print(newString+"……");
							                            }
							                        %> <span
								class="see_more" style="cursor: pointer;"> 查看更多</span>
						</div>
						<div class="more" style="display: none; color: #666666;line-height: 20px;">
							&nbsp;&nbsp;&nbsp;&nbsp;<%=comment.getComment() %> <span class="close" 
															style="text-align: right; cursor: pointer;">收起</span> 
						</div>
					</td>
				</tr>
				<tr style="text-align: right;">
								<td><div class="title">
										发表时间：<%=comment.getCommentTime()%></div>
								</td>
							</tr>
			</table>
			<div style="height: 20px;"></div>
			<% } %>
		</div>
	</div>
	<div id="footer"></div>
	<script src="/book-management-system/js/jquery-1.8.2.js"
		type="text/javascript"></script>
	<script src="/book-management-system/js/hotcomment.js"
		type="text/javascript"></script>

</body>
</html>