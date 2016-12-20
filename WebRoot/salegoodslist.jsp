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
							   <h3 style="margin-left:400px;">卖出商品信息表</h3>
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-bordered table-striped table-condensed table-hover">
											<thead>
												<tr>
													<th>商品名称</th>
													<th>生产厂商</th>
													<th>商品类别</th>
													<th>卖出数量</th>
													<th>卖出价格</th>                                          
												</tr>
											</thead>   
											<tbody>
												<c:forEach var="salegoods" items="${saleitemvo.list}"> 
												<tr>
													<td>${salegoods.good_name }</td>
													<td>${salegoods.good_producter }</td>
													<td><c:if test="${salegoods.good_type==2 }">食品</c:if>
													 <c:if test="${salegoods.good_type== 2}">药品</c:if>
													 <c:if test="${salegoods.good_type==1 }">服装</c:if>
													</td>
													<td>${salegoods.saleitemvo.sale_num }</td>    
													<td>${salegoods.saleitemvo.sale_price }</td>                                   
												</tr>
										</c:forEach>		                                   
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>		
		<div style="width:500px;margin-left:720px;">	
			   <a href="SalePageServ?pageNo=1">首页 &nbsp; &nbsp;&nbsp;</a>		   
	           <c:if test="${saleitemvo.pageNo>1}">
                    <a href="SalePageServ?pageNo=${saleitemvo.pageNo-1}">上一页&nbsp;&nbsp;&nbsp;</a>
               </c:if>
               <c:if test="${saleitemvo.pageNo<saleitemvo.pageCount}">
                    <a href="SalePageServ?pageNo=${saleitemvo.pageNo+1}">下一页&nbsp;&nbsp;&nbsp;</a>
               </c:if>
               <a href="SalePageServ?pageNo=${saleitemvo.pageCount}">尾页 &nbsp;&nbsp;&nbsp;</a>
                                                          总页数&nbsp;&nbsp;&nbsp;${saleitemvo.pageCount}   
             </div>
							
  </body>
        <script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/js/pages/table.js"></script>
</html>
