<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%!int flag = 10000; %>
<%
  	request.setCharacterEncoding("utf-8");
  	response.setCharacterEncoding("utf-8");
  	flag = Integer.parseInt(session.getAttribute("flag").toString()); 	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- Vendor CSS-->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->
		<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />
		<link href="assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet" />
		<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />					
		
		<!-- Theme CSS -->
		<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/add-ons.min.css" rel="stylesheet" />
		<!-- end: CSS file-->	
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>	
		<!-- Head Libs -->
		<script src="assets/plugins/modernizr/js/modernizr.js"></script>
		
  </head>
  
  <body>
  <div class="container-fluid content">
		<!-- Start: Content -->
			<div class="row">
				<!-- Sidebar -->
				<div class="sidebar">
					<div class="sidebar-collapse">
						<div class="sidebar-menu">
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-sidebar">
									<li class="nav">
										<a href="buyitem.jsp" target="container" onclick="return check1()">
											<i class="fa fa-desktop" aria-hidden="true"></i><span>进货信息录入</span>
										</a>
										
									</li>
									<li class="nav">
										<a href="saleitem.jsp" target="container" onclick="return check2()">
											<i class="fa fa-th-list" aria-hidden="true"></i><span>卖出信息录入</span>
										</a>
										
									</li>
									<li class="nav">
										<a>
											<i class="fa fa-group" aria-hidden="true"></i><span>商品信息管理</span>
										</a>
										
										<ul class="nav nav-children">
											<li><a href="GoodsPageServ" target="container"  onclick="return check3()"><span class="text"  onclick="return check3()"> 现存商品信息表</span></a></li>
											<li><a href="PageServ" target="container"  onclick="return check1()"><span class="text"  onclick="return check1()"> 买入商品信息表</span></a></li>						
											<li><a href="SalePageServ" target="container"  onclick="return check2()"><span class="text"  onclick="return check2()"> 卖出商品信息表</span></a></li>
																					
										</ul>
									</li>																	
										<li class="nav">
										<a  href="authority.jsp" target="container" onclick="return check4()">
											<i class="fa fa-check-square-o" aria-hidden="true"></i><span>权限管理</span>
										</a>						
									</li>
									
								</ul>
							</nav>
						</div>
						<!-- End Sidebar Menu-->
					</div>
					<!-- Sidebar Footer-->
					<div class="sidebar-footer">
		
					</div>
					<!-- End Sidebar Footer-->
				</div>
				<!-- End Sidebar -->
			</div>
			</div><!--/container-->
			
	
		<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		
		<!-- Plugins JS-->
		<script src="assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	
		
		<!-- <!-- Theme JS -->		
		 <script src="assets/js/core.min.js"></script> 


<script >
			function check1(){
				if(<%=flag%> == 2||<%=flag%> == 3){
					alert("对不起，您没有权限！");
					return false;
				}
				return true;
			}
						function check2(){
				if(<%=flag%> == 1||<%=flag%> == 3){
					alert("对不起，您没有权限！");
					return false;
				}
				return true;
			}
						function check3(){
				if(<%=flag%> == 2||<%=flag%> == 1){
					alert("对不起，您没有权限！");
					return false;
				}
				return true;
			}
						function check4(){
				if(<%=flag%> == 1||<%=flag%> == 2||<%=flag%> == 3){
					alert("对不起，您没有权限！");
					return false;
				}
				return true;
			}
		</script>
			
			
  </body>
</html>