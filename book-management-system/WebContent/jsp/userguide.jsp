<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/inform.css" rel="stylesheet" type="text/css"/>
<title>用户指南信息</title>
</head>
<body style="background-color: #e4e4e4">
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
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0" style="height: 34px; background-color: #0F73C1;border: 0px;margin: 0 auto;padding: 0px;">
		<tbody>
		<tr>
			<td class="menu">
				<ul>
					<li><a href="admin.jsp">首页</a>
					</li>
					<li><a href="exit1.jsp">重新登录</a>
					</li>
					<li><a href="userguide.jsp">用户指南</a>
					</li>
					<li><a href="index.jsp">读者首页</a>
					</li>
				</ul></td>
			<td class="menu1"><ul>
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
			                    <%  out.print(session.getAttribute("login")); %> &nbsp;&nbsp; 
			                </a>
						</li>
						<li><a href=<%if (session.getAttribute("register") == "注册") 
						                {  out.print("/book-management-system/jsp/register.jsp");
			                            } else { out.print("/book-management-system/jsp/exit1.jsp");
			                        }%> style="color: #FFF"> 
			                    <%  out.print(session.getAttribute("register")); %> &nbsp;&nbsp; 
			                </a>
						</li>
					</ul>
				</td>
		</tr>
		</tbody>
	</table>
<div id="content" style="font-size: 12px;">
<div style="width: 1024px;height: 10px;"></div>
<!-- <div id="left_content"><img src="/book-management-system/image/lmdh_bg.gif"></div>  -->
<div id="right_content">

<div ><p align="center" style="font-size: 18px;font-weight: bold;">图书管理系统用户指南</p>     
<p>一.用户使用说</p>

<p>
A、学院资料员管理登陆页面地址：http://192.168. 208.23：8081</p>
<p>1、 登录（由图书馆分配给各个二级学院图书资料员的管理权限）</p> 

<p>2、 选择教师姓名</p> 

<p>3、 查看批次状态</p> 

<p>状态1：资料室未验收，登陆后，选择文种：中文 外文，自动分配条形码，输入发票号，选择通过验收</p> 

<p>状态2：图书馆未验收 联系图书馆进行验收</p> 

<p>状态3：资料室和图书馆全部通过验收 打印送编清单和验收单</p> 

    <p>注意：打印时需按规定进行“页面设置”，在规定的纸张（按照财务处的要求）上打印。</p> 


<p>C、图书馆管理登陆页面地址：（略）</p> 

<p>1、 登录</p> 

<p>2、 选择已通过学院资料员验收，但未通过图书馆验收的资料，进行验收。</p> 

<p>3、 选择已通过图书馆验收的资料，打印图书清单，以存档入库。</p> 
<p align="center" style="color: red;"><a href="admin.jsp">返回</a></p>
</div>
</div>
<div style="width: 1024px;height: 10px;"></div>
<div id="footer"></div>
</div>

</body>
</html>