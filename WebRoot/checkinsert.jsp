<%@ page language="java" import="java.util.*,com.product.dao.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		if (username.equals("")) {
			out.println("<script type='text/javascript'>alert('请输入用户名！');window.location='authority.jsp'</script>");
		} else if (password.equals("")) {
			out.println("<script type='text/javascript'>alert('请输入密码');window.location='authority.jsp'</script>");
		} else {
			User user = new User();
			if(role!=""){
				boolean flag = user.insert(username, password, Integer.parseInt(role));
				if(flag == true){
					out.println("<script type='text/javascript'>alert('添加成功');window.location='authority.jsp'</script>");
				}else{
					out.println("<script type='text/javascript'>alert('添加失败');window.location='authority.jsp'</script>");
				}
			}
		}
	%>
	
</body>
</html>
