<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/useroperate.css" type=text/css rel=stylesheet>
<title>用户信息</title>
</head>
<body  style="background-color: #e4e4e4">
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
            <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
            <param name="expressinstall" value="/Scripts/expressInstall.swf">
            <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="/book-management-system/images/banner.swf" width="594" height="129">
              <!--<![endif]-->
              <param name="quality" value="high">
              
			  aram name="wmode" value="opaque" /&gt;
              <param name="swfversion" value="9.0.45.0">
              <param name="expressinstall" value="/Scripts/expressInstall.swf">
              <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
              <div>
                <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33"></a></p>
              </div>
              <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
          </object>
        </div></td>
    </tr>
    </tbody>
  </table>
</div>
<table width="1024" height="21" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="34" width="626" class="menu">
    <ul>
     <li><a href="admin.jsp">首页</a></li>
    <li><a href="#">重新登录</a></li>
    <li><a href="#">安全退出</a></li>
    <li><a href="userguide.jsp">用户指南</a></li>
    </ul>
 
    </td>
    <td height="34" width="398" class="menu1"></td>
    </tr>
  </table>	
   
   <div id="box">
   <div id="wrap">
   <div id="space"></div>
   <div style="font-family:新宋体, 华文细黑;
	font-weight: bold;;font-size: 20px;color: #2173bf;text-align: left;">新用户信息</div>
	<form id="register" action="a.jsp" method="post">
	  <table  width="400" height="328" border="0" align="left" id="register_table">
        <tr>
          <td width="17" height="30"><div align="center" class="STYLE8">*</div></td>
          <td width="100" height="30"><div align="right" class="STYLE7">I&nbsp;&nbsp;D&nbsp;&nbsp;</div></td>
          <td height="30" width="183" colspan="2">
          <input class="a2" type="text" name="readerID" id="readerID"></td>
          <td width="150" height="30" align="left"><span class="post_error1"></span>
              <div class="info" id="info1"  style="display:none;">ID为学号<span class="dec"> <s class="dec1">◆</s><s class="dec2" >◆</s> </span> </div></td>
        </tr>
         <tr>
          <td width="17" height="30"><div align="center" class="STYLE8">*</div></td>
          <td width="100" height="30"><div align="right" class="STYLE7">姓&nbsp;&nbsp;名&nbsp;&nbsp;</div></td>
          <td height="30"width="183"  colspan="2">
          <input class="a2" type="text"name="readerName" id="readerName"></td>
          <td width="150" height="30" align="left"><span class="post_error2"></span>
          <div class="info" id="info2"  style="display:none;">使用真实姓名<span class="dec"> <s class="dec1">◆</s><s class="dec2" >◆</s> </span> </div></td>
        </tr>
        <tr>
          <td height="30"><div align="center" class="STYLE8">*</div></td>
          <td width="100" height="30"><div align="right" class="STYLE7">邮&nbsp;&nbsp;箱&nbsp;&nbsp;</div></td>
          <td height="30" width="183" colspan="2"><input class="a2" type="text" name="Email"
				id="Email"></td>
          <td width="300" height="30" align="left"><span class="post_error3" ></span>
              <div class="info" id="info3" style="display: none;">正确输入邮箱 <span class="dec"> <s class="dec1">◆</s> <s class="dec2" >◆</s> </span> </div></td>
        </tr>
        <tr>
          <td height="30"><div align="center" class="STYLE8">*</div></td>
          <td width="100" height="30"><div align="right" class="STYLE7">密&nbsp;&nbsp;码&nbsp;&nbsp;</div></td>
          <td height="30" width="183" colspan="2"><input class="a2" type="password"
				name="readerPassword" id="readerPassword"></td>
          <td width="150" height="30" align="left"><span
				class="post_error4"></span>
              <div class="info" id="info4" style="display: none;">至少6个字符<span class="dec"> <s class="dec1">◆</s> <s class="dec2" >◆</s> </span> </div></td>
        </tr>
        <tr>
          <td height="30"><div align="center" class="STYLE8">*</div></td>
          <td  width="100" height="30"><div align="right" class="STYLE7">确认密码</div></td>
          <td height="30" width="183" colspan="2"><input class="a2" type="password" name="readerPasswordConfirm" id="readerPasswordConfirm"></td>
          <td width="150" height="30" align="left"><span class="post_error5"></span>
              <div class="info" id="info5" style="display: none;">请确认密码<span class="dec"> <s class="dec1">◆</s> <s class="dec2" >◆</s></span></div></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td width="100" height="30"><div align="right" class="STYLE7">电&nbsp;&nbsp;话&nbsp;&nbsp;</div></td>
          <td height="30" width="183" colspan="2" ><input class="a2" type="text" name="tel"
				id="tel"></td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td width="100" height="30"><div align="right" class="STYLE7">图书借阅</div></td>
          <td height="30" width="183" colspan="2" ><input class="a2" type="text" name="tel"
				id="tel"></td>
        </tr>
        <tr>
          <td width="100" height="30" colspan="2" align="right"><div align="right" class="STYLE7">学&nbsp;&nbsp;院 &nbsp;&nbsp;</div></td>
          <td height="30"><select name="select">
              <option>软件学院</option>
              <option>数信学院</option>
              <option>传播学院</option>
              <option>音乐学院</option>
              <option>财政金融学院</option>
              <option>体育学院</option>
              <option>国教学院</option>
              <option>文旅学院</option>
              <option>美术学院</option>
              <option>商学院</option>
              <option>生命科学学院</option>
              <option>外国语学院</option>
              <option>文学院</option>
              <option>政法学院</option>
          </select></td>
          <td height="30" width="50"><div align="right" class="STYLE7">班&nbsp;&nbsp;级</div></td>
          <td height="30"><select name="select2">
              <option>一班</option>
              <option>二班</option>
              <option>三班</option>
              <option>四班</option>
              <option>五班</option>
              <option>六班</option>
              <option>七班</option>
          </select></td>
        </tr>
        <tr>
      <!--   <td>
            <p>验证码：<input type="text" name="safeCode" /></p>
            <p><img src="/10WebProject/SafeCode" id="safeCode" /></p>
         </td>
         </tr> -->
        <tr>
          <td height="60">&nbsp;</td>
          <td  align="center" height="60"></td>
          <td width="112" height="60"  align="center"><input name="submit" type="submit" class="button1" tabindex="3" value="增加">          </td>
          <td width="74"  align="center"><input name="reset" type="reset" class="button1" tabindex="3" value="返回"></td>
          <td  align="center" height="60">&nbsp;</td>
        </tr> 
      </table>
	</form>
	</div>
	</div>
	<div id="footer"></div>
	 <script src="/book-management-system/js/jquery-1.8.2.js" type="text/javascript"></script>
	  <script src="/book-management-system/js/useroperate.js" type="text/javascript"></script>

</body>
</html>