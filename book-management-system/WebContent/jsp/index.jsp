<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="edu.jxsd.x3510.bean.Reader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/index.css" rel="stylesheet"
	type="text/css" />
<title>ͼ�����ҳ</title>
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
										value="/Scripts/expressInstall.swf"><div>
										<p>
											<a href="http://www.adobe.com/go/getflashplayer"><img
												src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
												alt="��ȡ Adobe Flash Player" width="112" height="33">
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

	<%
		String readerName = (String) session.getAttribute("login");
	%>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0" style="height: 34px; background-color: #0F73C1">
		<tbody>
			<tr>
				<td>
					<ul class="menu">
						<li><a href="#" style="color: #FFF; text-decoration: none;">��ҳ</a>
						</li>
						<li><a
							href="/book-management-system/ReaderServlet?actionType=myLibrary"
							style="color: #FFF; text-decoration: none;">�ҵ�ͼ���</a>
						<li><a href="/book-management-system/BookServlet?actionType=getHotBorrow"style="color: #FFF; text-decoration: none;">���Ž���</a></li>
    					<li><a href="/book-management-system/BookServlet?actionType=getHotComment"style="color: #FFF; text-decoration: none;">��������</a></li>
						
						
					</ul></td>
				<td>
					<ul class="menu1">
						<%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "ע��");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "��¼");
						%>
						<li><a href=<%if (session.getAttribute("login") == "��¼") 
						             { out.print("/book-management-system/jsp/login.jsp");
			                           } else {  out.print("/book-management-system/jsp/myLibrary.jsp");
			                        }%> style="color: #FFF"> 
			                   <%  out.print(session.getAttribute("login"));%> &nbsp;&nbsp; 
			                 </a>
			            </li>
						<li><a href=<%if (session.getAttribute("register") == "ע��") 
						            {  out.print("/book-management-system/jsp/register.jsp");
						              } else {out.print("/book-management-system/jsp/exit.jsp");
						                  }%> style="color: #FFF"> 
						               <% out.print(session.getAttribute("register")); %> &nbsp;&nbsp; 
						     </a>
						</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>

	<div id="content">
		<div id="content1">
			<div id="search">
				<div class="tab1">
					<div class="menu_box">
						<ul>
							<li id="one1" class="hover"><a href="#">�鿯��ѯ</a>
							</li>
							<!-- <li id="one2" class=""><a href="#">��վ����</a>
							</li> -->
						</ul>
					</div>

					<div id="con_one_1" style="display: block;">
						<form class="form_con" id="form_con" method="post" action="/book-management-system/BookServlet?actionType=search&pageNow=0">
							<select class="form_select" name="form_select">
								<option selected="selected" value="0">����</option>
								<option value="1">ͼ��ID</option>
								<option value="2">ISBN</option>
								<option value="3">ͼ������</option>
								<option value="4">����</option>
								<option value="5">���</option>
							</select> <input name="search_text" type="text" id="search_text">
							<input name="search_submit" type="submit" id="search_submit"
								value="">
						</form>

					</div>


					<!-- <div id="con_one_2" style="display: none;">
						<form class="form_con" id="form_con" method="post">
							<label>�ؼ���</label> <input name="search_text" type="text"
								id="search_text"> <input name="search_submit"
								type="submit" id="search_submit" value="">
						</form>
					</div>
 -->
					<div id="con_one_3"
						style="width: 500px; height: 20px; padding-top: 7px;">
						<table style="width: 500px;">
							<tbody>
								<tr align="center">
									<td><a href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=0"
										target="_blank" style="color: #ef5500;"> <img
											src="/book-management-system/images/d.jpg" width="12"
											height="8">����ͨ��</a></td>
									<td><a href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=1"
										target="_blank" style="color: #ef5500;"><img
											src="/book-management-system/images/d.jpg" width="12"
											height="8">��������</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p style="color: #999; margin: 0; padding-top: 10px;">ͼ������Ƴ�����ѧ����������ʵ�ֶ�ͼ����鿯����վ��Դ��һվʽ��������ӭ��������.</p>
				</div>

			</div>

			<div class="inform">
				<div class="inform_title" id="inform_title">
					<div class="inform_title02">
						<a href="#" class="tab_1" class="over">֪ͨ����</a>
					</div>
					<div class="inform_title02">
						<a href="#" class="tab_1" class="">��Դ��̬</a>
					</div>
					<div class="inform_title02">
						<a href="#" class="tab_1" class="">����</a>
					</div>
				</div>

				<div class="inform_content" id="inform_content">
					<div class="inform_content_1"
						style="display: block; padding-left: 15px;">
						<marquee onmouseover="this.stop();" onmouseout="this.start();"
							scrollamount="1" scrolldelay="1" direction="up" height="120">
							<table border="0" style="width: 235px;">
								<tbody valign="top">
		
								</tbody>
							</table>
						</marquee>
					</div>

					<div class="inform_content_1"
						style="display: none; padding-left: 25px;">
						<marquee onmouseover="this.stop();" onmouseout="this.start();"
							scrollamount="1" scrolldelay="1" direction="up" height="120">
							<table border="0" style="width: 235px;">
								<tbody valign="top">

								</tbody>
							</table>
						</marquee>
					</div>

					<div class="inform_content_1"
						style="display: none; padding-left: 25px;">
						<marquee onmouseover="this.stop();" onmouseout="this.start();"
							scrollamount="1" scrolldelay="1" direction="up" height="120">
							<table border="0" style="width: 235px;">
								<tbody valign="top">

								</tbody>
							</table>
						</marquee>
					</div>

					<div align="right">
						<a href="/book-management-system/InformServlet?actionType=moreInform"
							style="text-decoration: none;">����&gt;&gt;</a>
					</div>
				</div>
			</div>

		</div>

		<div id="content2">
			<div id="content2_list">
				<table align="center" cellpadding="0" cellspacing="0"
					style="width: 1024px; height: 172px; border-top: 1px solid; border-bottom: 1px solid; border-color: #B0D8FF;">
					<tbody>
						<tr align="center">
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_13.jpg">
							</td>
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_14.jpg">
							</td>
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_15.jpg">
							</td>
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_16.jpg">
							</td>
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_17.jpg">
							</td>
							<td width="150px;"><img class="tp"
								src="/book-management-system/images/dsb_index1101yyc_18.jpg">
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- �����鼮 - ��ѧ�� -->
			<div class="content2_book" style="display: block;">
				<h2>
					�����鼮 - ��ѧ��&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						onclick=clickLeftLableIndex(2)
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=2"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- �����鼮 - �Ƽ��� -->
			<div class="content2_book">
				<h2>
					�����鼮 - �Ƽ���&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=3"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src="">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- �����鼮 - ������ -->
			<div class="content2_book">
				<h2>
					�����鼮 - ������&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=4"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- �����鼮 - ������ -->
			<div class="content2_book">
				<h2>
					�����鼮 - ������&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=5"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- �����鼮 - ��ʷ�� -->
			<div class="content2_book">
				<h2>
					�����鼮 - ��ʷ��&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=6"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>
				</div>
			</div>
			<!-- �����鼮 - ������ -->
			<div class="content2_book">
				<h2>
					�����鼮 - ������&nbsp; &nbsp; <span class="pl"> (&nbsp;<a
						href="/book-management-system/BookServlet?actionType=indexDirectHotBorrow&i=7"
						style="color: #006600">�鿴����</a>&nbsp;) </span> <span class="fright"
						style="float: right;"> <a href="javascript:void(0)"
						title="����"></a> </span> <span class="fleft" style="float: right;">
						<a href="javascript:void(0)" title="ǰ��"></a> </span>

					<ul class="switch_dot" name="switch_dot"
						style="float: right; margin: 0px;">
						<li class="dof_1"></li>
						<li class="dof_2"></li>
						<li class="dof_3"></li>
						<li class="dof_4"></li>
					</ul>
				</h2>
				<div id="glide1" class="glide1">

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 964px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>

					<ul class="cover_list" style="left: 0px;">
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>
						<li><a><img
								src=" ">
						</a>
						</li>

					</ul>
				</div>
			</div>


		</div>

		
	</div>
<div id="content3">

</div>



	<SCRIPT src="/book-management-system/js/jquery.min.js"
		type=text/javascript></SCRIPT>
	<SCRIPT src="/book-management-system/js/index.js" type=text/javascript></SCRIPT>
</body>
</html>