<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<frameset rows="62px,*" style="noresize;border:0px" frameborder="no">
<frame src="header.jsp" scrolling="no">
<frameset cols="240px,*" frameborder="no">
<frame src="left.jsp" scrolling="no">
<frame src="welcome.jsp" scrolling="no" name="container">
</frameset>
</frameset>

</html>
