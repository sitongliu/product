<%@ page language="java" import="java.util.*,com.product.dao.User"
	pageEncoding="utf-8"%>
<%
	boolean num = false; 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username.equals("")) {
		out.println("<script type='text/javascript'>alert('请输入用户名！');window.location='login.jsp'</script>");
	} else if (password.equals("")) {
		out.println("<script type='text/javascript'>alert('请输入密码');window.location='login.jsp'</script>");
	} else {
		User user = new User();
		int flag = user.login(username, password);
		session.setAttribute("flag", flag);
		switch (flag) {
		case 0:
		num = true;
%>
<jsp:forward page="index.jsp">
	<jsp:param value="0" name="flag" />
</jsp:forward>
<%
	break;
		case 1:
		num = true;
%>
<jsp:forward page="index.jsp">
	<jsp:param value="1" name="flag" />
</jsp:forward>
<%
	break;
		case 2:
		num = true;
%>
<jsp:forward page="index.jsp">
	<jsp:param value="2" name="flag" />
</jsp:forward>
<%
	break;
		case 3:
		num = true;
%>
<jsp:forward page="index.jsp">
	<jsp:param value="3" name="flag" />
</jsp:forward>
<%
	break;
		case -1:
			out.println("<script type='text/javascript'>alert('用户不存在！');window.location='login.jsp'</script>");
			break;
		case 998:
			out.println("<script type='text/javascript'>alert('密码错误！');window.location='login.jsp'</script>");
			break;
		}
%>
<%
	}
%>
<%
	session.setAttribute("num", num);
 %>

