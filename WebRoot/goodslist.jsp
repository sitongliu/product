<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet" />
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />

</head>

<body style="margin-top:20px">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel">
				<h3 style="margin-left:400px;">现存商品信息表</h3>
				<form name="searchform" method="post" action="GoodsFindServ">
<div style="width:400px;margin-left:720px">
<tr bgcolor="lightgrey">
						<td align="center" colspan="5">
						请选择类型： <select name="subsql">
								<option value="good_name">商品名</option>
								<option value="good_producter">生产厂商</option>
						</select> <input type="text" name="subsqlvalue" size="17"> 
						<input type="submit"  name="searchpart" value="查询" onclick="return check()">
						</td>
					</tr>

</div>
					

				</form>
				<div class="panel-body">
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed table-hover">
							<thead>
								<tr>
									<th>商品名称</th>
									<th>生产厂商</th>
									<th>商品类别</th>
									<th>商品数量</th>
									<th>商品描述</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="nowgoods" items="${goodspage.list}">
									<tr>
										<td>${nowgoods.good_name }</td>
										<td>${nowgoods.good_producter }</td>
										<td><c:if test="${nowgoods.good_type==1 }">食品</c:if> <c:if
												test="${nowgoods.good_type==2 }">药品</c:if> <c:if
												test="${nowgoods.good_type==3 }">服装</c:if></td>
									    <td>${nowgoods.saled}</td>
										<td>${nowgoods.description }</td>
										<td><a href="DeleteGoods?good_id=${nowgoods.good_id}">删除</a></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div style="width:500px;margin-left:720px">
	<a href="GoodsPageServ?pageNo=1">首页      &nbsp; &nbsp;    </a>
	<c:if test="${goodspage.pageNo>1}">
		<a href="GoodsPageServ?pageNo=${goodspage.pageNo-1}">上一页       &nbsp; &nbsp;   </a>
	</c:if>
	<c:if test="${goodspage.pageNo<goodspage.pageCount}">
		<a href="GoodsPageServ?pageNo=${goodspage.pageNo+1}">下一页   &nbsp;  &nbsp;       </a>
	</c:if>
	<a href="GoodsPageServ?pageNo=${goodspage.pageCount}">尾页      &nbsp;    &nbsp;       </a>
	              &nbsp; &nbsp;  总页数${goodspage.pageCount}
</div>
</body>
<script src="assets/vendor/js/jquery.min.js"></script>
<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/pages/table.js"></script>

<script language="javascript">
	function check() {
		if (searchform.subsqlvalue.value==null||searchform.subsqlvalue.value == "") {
			alert("请输入查询的条件");
			searchform.subsqlvalue.focus();
			return false;
		}
	}
</script>

</html>
