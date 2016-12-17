<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%> 
<%@ page import="java.sql.*"%>
<%  String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>   
<head>      
   <base href="<%=basePath%>">          
   <title>修改页面</title>       
   <meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">      
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
<meta http-equiv="description" content="This is my page">      
</head>       
<body>      
<%request.setCharacterEncoding("gb2312");     
String good_id1=request.getParameter("good_id");     
String good_name1=request.getParameter("good_name");     
String good_type1=request.getParameter("good_type");     
String c1=request.getParameter("good_price");     
String description1=request.getParameter("description");     
Connection conn=null;      
Statement stat=null;       
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");      
String url="jdbc:sqlserver://localhost:3306;DatabaseName=Test";       
String user="user";
String password="";       
conn=DriverManager.getConnection(url,user,password);      
stat=conn.createStatement();      
stat.execute("update goods set good_id="+good_id1+",good_name='"+good_name1+"',good_type="+good_type1+",description='"+description1+"',good_type='"+good_type1+"'where good_id="+good_id1+"");       
ResultSet rs=stat.executeQuery("select * from goods where good_id="+good_id1+"");
%>
<br>
<h3>修改成功</h3> <br>           
<h3>修改后的信息为：</h3>          
<hr>     
<br>     
<br>  
<table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">
<tr>      
<td>good_id</td>
<td>good_name</td>     
<td>good_type</td>     
<td>good_price</td>     
<td>description</td>     
</tr>     
<%       
while(rs.next()){      
out.print("<tr>");     
out.print("<td>"+rs.getInt("good_id")+"</td>");      
out.print("<td>"+rs.getString("good_name")+"</td>");     
out.print("<td>"+rs.getInt("good_type")+"</td>");     
out.print("<td>"+rs.getInt("good_price")+"</td>");     
out.print("<td>"+rs.getString("description")+"</td>");     
out.print("</tr>");     
}     
%>        
</table> <br><br>        
<h3>
<a href=index.jsp>返回信息输入页面</a></h3>       
<h3><a href=layout.jsp>返回信息查询页面</a></h3>       
<% if(rs!=null){  
rs.close();     
}       
if(stat!=null) {         
 stat.close();     
}
if(conn!=null){         
 conn.close();     
}     
%>   
</body>
</html>
 