<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if (session.getAttribute("flag") == null){
		out.println("<script type='text/javascript'>alert('请您登陆');window.location='login.jsp'</script>");
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>权限管理</title>
</head>
<body style="margin-top:20px;">
<div style="width:800px;">
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/productsale", "root",
					"root");
			pstmt = conn
					.prepareStatement("SELECT * FROM users");
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	%>
	<table style="margin-left:100px;">
		<tr align="center">
			<th>用户名</th>
			<th>密 码</th>
			<th>权 限</th>
			<td colspan="2"></td>
		</tr>
		<form method="post" action="checkinsert.jsp">
			<tr>
				<td><input type="text" name="username"></td>
				<td><input type="text" name="password"></td>
				<td><select name="role">
						<option value="0">管理员</option>
						<option value="1">买入管理</option>
						<option value="2">卖出管理</option>
						<option value="3">信息管理</option>
				</select></td>
				<td><input type="submit" name="submit" value="添加"></td>
			</tr>
		</form>
	</table>
	<hr>
	<table style="margin-left:100px;">
		<%
			while (rs.next()) {
				int f1=rs.getInt(1);
				String f2 = rs.getString(2);
				String f3 = rs.getString(3);
				int f4 = rs.getInt(4);
		%>
		<form method="post" action="checkdelete.jsp">
		<tr>
			<td><input type="text" name="username" value="<%=f2%>"></td>
			<td><input type="text" name="password" value="<%=f3%>"></td>
			<c:set var="f4" value="<%=f4%>"></c:set>
			<td><select name="role">
					<option value="0" <c:if test="${f4==0}">selected</c:if>>
						<c:out value="管理员"></c:out>
					</option>
					<option value="1" <c:if test="${f4==1}">selected</c:if>>
						<c:out value="买入管理"></c:out>
					</option>
					<option value="2" <c:if test="${f4==2}">selected</c:if>>
						<c:out value="卖出管理"></c:out>
					</option>
					<option value="3" <c:if test="${f4==3}">selected</c:if>>
						<c:out value="信息管理"></c:out>
					</option>
			</select></td>
			<input type="hidden" name="user_id" value="<%=f1%>">
			<td><input type="button" name="modify" value="修改"
				onclick="this.form.action='checkmodify.jsp';this.form.submit()"></td>
			<td><input type="submit" name="delete" value="删除"></td>
		</tr>
		</form>
		<%
			}
		%>
	</table>
</div>
</body>
</html>
