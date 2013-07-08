<%@page import="edu.jxsd.x3510.bean.Inform"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/informlist.css" rel="stylesheet"
	type="text/css" />
<title>通知列表</title>
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
						<li><a href="/book-management-system/ReaderServlet?actionType=myLibrary">我的图书馆</a>
						</li>
						<li><a href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a>
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
		<div id="right_content">
			<div class="menu_box">
                       <ul>
                           <li id="one1" class=""><a href="/book-management-system/InformServlet?actionType=moreInform">通知公告列表</a></li>
                          <li id="one2" class="hover"><a href="#">资源动态列表</a></li>
                          <li id="one3" class=""><a href="/book-management-system/InformServlet?actionType=moreNews">新闻列表</a></li>
                                 </ul>
               </div>
              <%--  <div id="inform_list" style="line-height: 30px; display: none;">
			<table class="table" width="700" border="0" cellspacing="0"
				cellpadding="5">
				<thead>
				<tr style="background-color: #efeefe;">
				    <td align="center" style="font-weight: bold;">编号</td>
					<td align="center" style="font-weight: bold;">公告内容</td>
					<td align="center" style="font-weight: bold;">发布时间</td>
				</tr>
				</thead>
				<tbody>
					<%
				ArrayList<Inform> informList=new ArrayList<Inform>();
				informList=(ArrayList<Inform>)session.getAttribute("informList");
				for(int i=0; i<informList.size();i++){
					Inform inform =informList.get(i);	
				%>
				<tr>
				   <td align="center"><%=inform.getInformID() %>、</td>
					<td class="left_col"><a href="/book-management-system/InformServlet?actionType=inform&informID=<%=inform.getInformID() %>"><%=inform.getTitle() %></a></td>
					<td class="right_col"><%=inform.getInformTime() %></td>
				</tr>
				</tbody>
					<%} %>
			</table>
		</div> --%>
		 <div id="resource_list" style="display: block;line-height: 30px;">
			<table class="table" width="700" border="0" cellspacing="0"
				cellpadding="5">
				<thead>
				<tr style="background-color: #efeefe;">
				    <td align="center" style="font-weight: bold;">编号</td>
					<td align="center" style="font-weight: bold;">公告内容</td>
					<td align="center" style="font-weight: bold;">发布时间</td>
				</tr>
				</thead>
				<tbody>
				<%
				ArrayList<Inform> sourceList=new ArrayList<Inform>();
				sourceList=(ArrayList<Inform>)session.getAttribute("sourceList");
				for(int i=0; i<sourceList.size();i++){
					Inform inform =sourceList.get(i);	
				%>
				<tr>
				   <td align="center"><%=inform.getInformID() %>、</td>
					<td class="left_col"><a href="/book-management-system/InformServlet?actionType=inform&informID=<%=inform.getInformID() %>"><%=inform.getTitle() %></a></td>
					<td class="right_col"><%=inform.getInformTime() %></td>
				</tr>
				</tbody>
				<%} %>
			</table>
					<div style="height: 20px;"></div>
				<div >
					<table  id="page_list" cellpadding="10px;" 
					 style=" border-collapse: collapse ; margin-left: 300px;">
						<tbody>
							<%
								int pageCount = ((Integer) (session.getAttribute("pageCount")))
										.intValue();
								int pageNow = ((Integer) (session.getAttribute("pageNow")))
										.intValue();
							%>
							<tr>
								<td>
								<div class="bg" onmouseover="this.className='bg_hover'" onmouseout="this.className='bg'" ><%
										out.print("<a href=/book-management-system/InformServlet?actionType=sourcePage&pageNow=1>1</a>");
									%></div>
								</td>

								<%
									for (int i = 1; i < pageCount; i++) {
								%>
								<td>
									<div class="bg" onmouseover="this.className='bg_hover'" onmouseout="this.className='bg'"><%
										out.print("<a href=/book-management-system/InformServlet?actionType=sourcePage&pageNow="
													+ (i + 1) + ">" + (i + 1) + "");
										}
									%></div>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="height: 10px;"></div>
					<form style="margin-left: 300px;"
						action="/book-management-system/InformServlet?actionType=readerPage"
						method="post">
						当前页：<font color="red"><%=pageNow%>/<%=pageCount%></font>
						<!-- 第：<input
							type="text" name="pageNow" size=3>页 <a
							href="javaScript:submitForm();">Go</a> -->
					</form>
				</div>
		</div>
		<%-- <div id="news_list" style="display: none;line-height: 30px;">
			<table class="table" width="700" border="0" cellspacing="0"
				cellpadding="5">
				<thead>
				<tr style="background-color: #efeefe;">
				    <td align="center" style="font-weight: bold;">编号</td>
					<td align="center" style="font-weight: bold;" >公告内容</td>
					<td align="center" style="font-weight: bold;">发布时间</td>
				</tr>
				</thead>
				<tbody>
				<%
				ArrayList<Inform> newsList=new ArrayList<Inform>();
				newsList=(ArrayList<Inform>)session.getAttribute("newsList");
				for(int i=0; i<newsList.size();i++){
					Inform inform =newsList.get(i);	
				%>
				<tr>
				   <td align="center"><%=i+1 %>、</td>
					<td class="left_col"><a href="/book-management-system/InformServlet?actionType=inform&informID=<%=inform.getInformID() %>"><%=inform.getTitle() %></a></td>
					<td class="right_col"><%=inform.getInformTime() %></td>
				</tr>
				</tbody>
				<%} %>
			</table>
		</div> --%>
		</div>
		<div style="width: 1024px; height: 10px;"></div>
		
	</div>
<div id="footer"></div>
<script type="text/javascript"
		src="/book-management-system/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="/book-management-system/js/informlist.js"></script>
</body>
</html>