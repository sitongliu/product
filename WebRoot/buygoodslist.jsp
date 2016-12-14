<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buygoodslist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />		
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	
  </head>
  
  <body style="margin-top:20px">		
                      <div class="row">	
						<div class="col-lg-12">
							<div class="panel">
							   <h3 style="margin-left:400px;">买入商品信息表</h3>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-bordered table-striped table-condensed table-hover">
											<thead>
												<tr>
													<th>商品名称</th>
													<th>生产厂商</th>
													<th>商品类别</th>
													<th>买入数量</th>  
													<th>买入价格</th>                                         
												</tr>
											</thead>   
											<tbody>
											<c:forEach var="goods" items="${page.list}"> 
												<tr>
													<td>${goods.good_name }</td>
													<td>${goods.good_producter }</td>
													<td><c:if test="${goods.good_type==1 }">食品</c:if>
													 <c:if test="${goods.good_type==2 }">药品</c:if>
													 <c:if test="${goods.good_type==3 }">服装</c:if>
													</td>
													<td>${goods.vo.good_num }</td>    
													<td>${goods.vo.buy_price }</td>                                   
												</tr>
										</c:forEach>
									</tbody>
								</table>
						      </div>
						   </div>
					  </div>
				  </div>
	          </div>	
	           <a href="PageServ?pageNo=1">首页</a>		   
	           <c:if test="${page.pageNo>1}">
                    <a href="PageServ?pageNo=${page.pageNo-1}">上一页</a>
               </c:if>
               <c:if test="${page.pageNo<page.pageCount}">
                    <a href="PageServ?pageNo=${page.pageNo+1}">下一页</a>
               </c:if>
               <a href="PageServ?pageNo=${page.pageCount}">尾页</a>
                总页数${page.pageCount}
							
  </body>
        <script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/pages/table.js"></script>
</html>
