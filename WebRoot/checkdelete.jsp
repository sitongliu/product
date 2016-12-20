<%@ page language="java" import="java.util.*,com.product.dao.*"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("user_id");
		User user = new User();
		boolean flag = user.delete(Integer.parseInt(id));
		if (flag == true) {
			out.println("<script type='text/javascript'>alert('删除成功');window.location='authority.jsp'</script>");
		} else {
			out.println("<script type='text/javascript'>alert('删除失败');window.location='authority.jsp'</script>");
		}
	%>

</body>
</html>