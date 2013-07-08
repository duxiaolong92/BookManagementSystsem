<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/changepassword.css" rel="stylesheet" type="text/css"/> 
<title>修改个人密码</title>
</head>
<body>
<div id="main">修改密码</div>
<div style="height: 20px;"></div>
<div id="content">
<div id="left_content">
<!-- <form style="width: 380px;" action="" method="post"> -->
<table width="290px;" style="text-align: left; font-size: 13px;" cellpadding="0px; ">
<tr>
<td width="90px;" style="text-align: right;">原密码：</td>
<td width="200px;"><input type="password" id="old_password"></td>
</tr>
<tr>
<td width="90px;" style="text-align: right;">新密码：</td>
<td width="200px;"><input type="password" id="new_password"></td>
</tr>
<tr>
<td width="90px;" style="text-align: right;">确认新密码：</td>
<td width="200px;"><input type="password" id="new_password_confirm"></td>
</tr>
<tr height="10px;">
      
</tr>
<tr>
<td></td>
<td><input type="submit" value="提交" >&nbsp;&nbsp;<input type="reset" value="重设" ></td>
</tr>
</table>
<!-- </form> -->
</div> 
<div id="right_content">
<div id="tab"><img src="/book-management-system/images/2.gif">温馨提醒</div>
<p>在这里您可以修改您的密码（口令），在设置或修改密码时，请注意以下几点：
<p>1、密码只能是字母和数字。
<p>2、密码（口令）不能是空格或为空值。
<p>3、密码（口令）不能输入"#"、"%"、"&"标点符号等字符
<p>4、密码（口令）最好不要使用您的生日、电话号码、房间号等信息。
</div>
</div>
</body>
</html>