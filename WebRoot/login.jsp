<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户登录</title>


    <link rel="stylesheet" type="text/css" href="assets/css/cloud-admin.css" >
	
	<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="assets/js/uniform/css/uniform.default.min.css" />
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="assets/css/animatecss/animate.min.css" />
	<!-- FONTS -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
	
	
</head>
<body>
	<%!
  		String username = "";	
  		String password = ""; 
  	%>
	<%
  		if(username == null){
  			username = "";
  		}
  		if(password == null){
  			password = "";
  		}
   	 %>
<%-- 	<form method="post" action="checkLogin.jsp">
		用户名：<input type="text" name="username" value="<%=username%>"><br>
		密&nbsp;&nbsp;码：<input type="password" name="password" value="<%=password%>"><br>
		<input type="submit" name="submit" value="登录">
	</form> --%>
	
	<section id="login_bg" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">Sign In</h2>
								<div class="divide-40"></div>
								<form method="post" action="checkLogin.jsp">
								  <div class="form-group">
									<label for="exampleInputEmail1">用户名</label>
									<i class="fa fa-envelope"></i>
									<input type="text" name="username"  class="form-control" value="<%=username%>">
									<!-- <input type="email" class="form-control" id="exampleInputEmail1" > -->
								  </div>
								  <div class="form-group"> 
									<label for="exampleInputPassword1">密  码</label>
									<i class="fa fa-lock"></i>
									<input type="password" name="password" class="form-control" value="<%=password%>">
									<!-- <input type="password" class="form-control" id="exampleInputPassword1" > -->
								  </div>
								  <div>			
									<button type="submit" class="btn btn-danger">登录</button>
								  </div>
								</form>
								<!-- SOCIAL LOGIN -->
								<div class="divide-20"></div>
								
								<div class="divide-20"></div>
								
							</div>
						</div>
					</div>
				</div>
			</section>
	
	
	<script src="assets/js/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	<!-- UNIFORM -->
	<script type="text/javascript" src=" assets/js/uniform/jquery.uniform.min.js"></script>
	<!-- BACKSTRETCH -->
	<script type="text/javascript" src=" assets/js/jquery.backstretch.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="js/script.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("login_bg");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<script type="text/javascript">
		function swapScreen(id) {
			jQuery('.visible').removeClass('visible animated fadeInUp');
			jQuery('#'+id).addClass('visible animated fadeInUp');
		}
	</script>
	
	
</body>
</html>
