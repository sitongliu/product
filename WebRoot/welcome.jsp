<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	if (session.getAttribute("flag") == null){
		out.println("<script type='text/javascript'>alert('请您登陆');window.location='login.jsp'</script>");
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用商品管理系统</title>
  </head>
  
  <body >
    <div style="position:relative; width:100%; display:table; *position:absolute; *top:50%; *left:0;">
    	<font size="8" >
			<p style="position:absolute; top:50%; left:0; text-align:center; width:100%; *top:0;">欢迎使用商品管理系统！</p>
		</font>
	</div>
  </body>
</html>
