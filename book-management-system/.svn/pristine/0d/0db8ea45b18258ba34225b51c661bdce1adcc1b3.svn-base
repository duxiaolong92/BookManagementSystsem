<%@page import="edu.jxsd.x3510.bean.Book"%>
<%@page import="edu.jxsd.x3510.bean.Reader"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*" %>
<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/introduce.css" rel="stylesheet" type="text/css"/>
<SCRIPT src="/book-management-system/js/jquery.min.js"
		type=text/javascript></SCRIPT>
<script type="text/javascript" src="/book-management-system/js/introduce.js"></script>
<title>书本介绍</title>
</head>
<body style="background-color: #e4e4e4">
<div id="menu">
<div class="container">
  <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody><tr>
      <td><div style="width:430px; float:left"><img src="/book-management-system/images/top_01.jpg" width="430" height="129"></div>
        <div style="width:594px; float:left">
          <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="594" height="129">
            <param name="movie" value="/book-management-system/images/banner.swf">
            <param name="quality" value="high">
            <param name="wmode" value="opaque">
            <param name="swfversion" value="9.0.45.0">
            <param name="expressinstall" value="/Scripts/expressInstall.swf">
            <object type="application/x-shockwave-flash" data="/book-management-system/images/banner.swf" width="594" height="129">
              <param name="quality" value="high">
              <param name="swfversion" value="9.0.45.0">
              <param name="expressinstall" value="/Scripts/expressInstall.swf">
              <div>
                <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33"></a></p>
              </div>
            </object>
          </object>
        </div></td>
    </tr>
    </tbody>
  </table>
</div>

<table   width="1024px" border="0" align="center" cellpadding="0" cellspacing="0" style="height:34px;background-color: #0F73C1;border: 0px;margin: 0 auto;padding: 0px; font-size: 12px;">
  <tr>
    <td height="34" width="626" class="menu">
    <ul>
    <li><a href="/book-management-system/jsp/index.jsp">首页</a></li>
    <li><a href="/book-management-system/ReaderServlet?actionType=myLibrary">我的图书馆</a></li>
    <li><a href="/book-management-system/BookServlet?actionType=getHotBorrow">热门借阅</a></li>
    <li><a href="/book-management-system/BookServlet?actionType=getHotComment">热门评论</a></li>
    </ul>
    </td>
    <td>
					<ul class="menu1">
						<%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "注册");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "登录");
						%>
						<li><a href=<%if (session.getAttribute("login") == "登录") 
						             { out.print("/book-management-system/jsp/login.jsp");
			                           } else {  out.print("/book-management-system/jsp/myLibrary.jsp");
			                        }%> style="color: #FFF"> 
			                   <%  out.print(session.getAttribute("login"));%> &nbsp;&nbsp; 
			                 </a>
			            </li>
						<li><a href=<%if (session.getAttribute("register") == "注册") 
						            {  out.print("/book-management-system/jsp/register.jsp");
						              } else {out.print("/book-management-system/jsp/exit.jsp");
						                  }%> style="color: #FFF"> 
						               <% out.print(session.getAttribute("register")); %> &nbsp;&nbsp; 
						     </a>
						</li>
					</ul>
				</td>
    </tr>
  </table>
  </div>
<div id="content">
      <div class="content1">
           <div class="s_c_left">
              <div class="table">
               
           <div id="con_one_1" style="display: block;margin-top: 20px;">
           <% Book book=new Book();
              book=(Book)session.getAttribute("book");  
             
           %>
     <table id="writting" width="700" height="200" border="0" cellpadding="5">
     <tbody valign="top">
      <tr>
        <td width="133"><div align="right" >图书编号：</div></td>
        <td width="619"><%=book.getISBN() %></td>
        <td width="150" rowspan="5"><img src="<%=book.getBookImage()%>">
        </td>
      </tr>
      <tr>
        <td><div align="right" >题名：</div></td>
        <td><%=book.getBookName() %></td>
      </tr>
       <tr>
        <td><div align="right" >出版发行项：</div></td>
        <td><%=book.getPress() %></td>
      </tr>
      <tr>
        <td><div align="right" >作者：</div></td>
        <td><%=book.getAuthor() %></td>
      </tr>
      <tr>
        <td><div align="right" >价格：</div></td>
        <td>￥<%=book.getPrice() %></td>
      </tr>
      <tr>
        <td><div align="right" >存入时间：</div></td>
        <td><%=book.getStorageTime() %></td>
      </tr>
      <tr>
        <td><div align="right" >图书类型：</div></td>
        <td><%=book.getBookTypeName() %></td>
      </tr>
      <tr>
        <td><div align="right" >藏馆地：</div></td>
        <td><%=book.getReadingRoomName() %></td>
      </tr>
       <tr>
        <td><div align="right" style="padding-top:11px;" >提要文摘附注：</div></td>
        <td><%=book.getSummargNote() %></td>
      </tr>
      </tbody>
    </table>
    </div>
    </div>
   </div>
 <div id="s_c_right"> 
  <div style="margin-bottom: 20px;padding-bottom: 20px;">
  <div id="title1" class="title_down">附加信息</div>
  <dl class="tablenewsdown" id="child1" style="display:block;padding-bottom: 10px;">
  <% String bookStatus = (String)session.getAttribute("bookStatus");
  	 String status = null;
  	 if(bookStatus.equals("0")){
  		 status = "可借";
  		 %>
  		 <dt class="grey" id="status">借阅状态：<%=status %></dt>
  		 <dt class="grey"><input id="reserve" type="button" style="color:#1E95E5;cursor: pointer" value="点击这里预约"></dt>
  		 <%
  	 }else if(bookStatus.equals("1")){
  	 	status = "借出";
  	 	%>
 		 <dt class="grey">借阅状态：<%=status %></dt>
 		 <%
  	 }else if(bookStatus.equals("2")){
  		 status = "已预约";
  		%>
		 <dt class="grey">借阅状态：<%=status %></dt>
		 <%
  	 }
  %>
<%--   <dt class="grey">借阅状态：<%=status %></dt>
  <dt class="grey"><a href="#">点击这里预约</a></dt> --%>
  
  </dl>
  </div>
   <div >
   <div id="title3" class="title_down" >相关借阅</div>
  <dl class="tablenewsdown" id="child3" style="display:block;padding-bottom: 10px;">
  <% String[] relateBookName = null;
  	 relateBookName = (String[])session.getAttribute("relateBookName");
  	 for(int i = 0;i < relateBookName.length;){
  %>
  <dt class="grey"><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=relateBookName[i++] %>"><%=relateBookName[i++] %></a></dt>
  <%} %>
  </dl>
  </div>
</div>     
     </div>
  <!--    <div class="content2">
       <div><input type="button" value="我要预约"></div>
     </div>  -->
  
      <div class="content3">
      	
         <div id="comment" >
         <p style="margin-left:59px;color: #000">书评</p>
         </div>
            <div class="attitude" style="display:block"> 
            	<table  style="border-bottom: 1px dotted #ABADB3;">
            		<tbody>
            			<%
            				ArrayList<Comment> bookAllComment = new ArrayList<Comment>();
            				bookAllComment = (ArrayList<Comment>)session.getAttribute("bookCommentList");
            				int length = bookAllComment.size();
            				for(int i = 0;i < length;i++){
            					Comment comment = bookAllComment.get(i);
            			%>
	            		<tr style="background-color:#ccc; color:#FF760B;width:500px;"> <strong style="color:#3377AA;"><%=comment.getReaderName() %> 发表于</strong>　<%=comment.getCommentTime() %></tr>
	            		<tr ><p style="margin-left: 20px; color:#000"><%=comment.getComment() %></p></tr>
	           		</tbody>
	           		<%} %>
	            </table>
            	<table  style="border-bottom: 1px dotted #ABADB3;">
            		<tr style="background-color:#ccc; width:500px;"> <strong id="myReaderName"style="color:#3377AA;"></strong><h id="myCommentTime" ><h></tr>
            		<tr ><p id="myComment"style="margin-left: 20px; color:#000"></p></tr>
            	</table>        		       		
        		<% 
        			Reader reader = new Reader();
	        		if (session.getAttribute("reader") == null){	
	        			reader.setReaderID(0);
	        		}else{
	        			reader = (Reader)session.getAttribute("reader");
	        		}        			
        		%>
        		<%-- <form action="/book-management-system/BookServlet?actionType=comment&bookID=<%=book.getBookID()%>&readerID=<%=reader.getReaderID() %>" method="post" onsubmit="">
				 --%> 	
		   			<h4 style="color:#FF760B">我要评论：</h4><br>
					<textarea name="r_content" id="r_content" rows="6" cols="30" style="width:600px;"> </textarea>
					<div class="holdon">
						<b><button id="book-comment" class="button" type="button">马上发表</button></b>
					</div>
				<!-- </form> -->
				<input id="bookID" type="text" value="<%=book.getBookID()%>" style="display: none">
				<input id="readerID" type="text" value="<%=reader.getReaderID()%>" style="display: none">
			</div>
       </div>      
</div>
<div class="footer"></div>
</body>
</html>


 