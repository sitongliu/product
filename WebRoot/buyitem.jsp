<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buyitem.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- Vendor CSS-->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->
		<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />	
		<link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-datepicker/css/datepicker-theme.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
		
		<!-- Theme CSS -->
		<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->
		<link href="assets/css/style.css" rel="stylesheet" />		
		
		<!-- end: CSS file-->	
	    
		
		<!-- Head Libs -->
		<script src="assets/plugins/modernizr/js/modernizr.js"></script>

  </head>
  
          <body>
                          <div class="col-md-12" style="margin-top:10px;">
							<div class="panel">
								<div class="panel-heading bk-bg-primary" style="height:36px;">
									<h6><i class="fa fa-indent red"></i>进货商品录入</h6>							
								</div>
								<div class="panel-body">
									<form  id="fom" action="BuyItemServ" method="post"  class="form-horizontal" >
										
										
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_name">商品名称</label>
											<div class="col-md-9">
												<input type="text" id="good_name" name="good_name" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="buy_price">商品单价</label>
											<div class="col-md-9">
												<input type="text" id="buy_price" name="buy_price" class="form-control">
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label" for="buy_time">购买时间</label>
											<div class="col-md-9">
												<input type="text" id="buy_time" name="buy_time" class="form-control" >
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_num">购买数量</label>
											<div class="col-md-9">
												<input type="text" id="good_num" name="good_num" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_producter">生产厂商</label>
											<div class="col-md-9">
												<input type="text" id="good_producter" name="good_producter" class="form-control" >
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_type">商品类型</label>
											<div class="col-md-9">
												<select id="select" id= "good_type" name="good_type" class="form-control" size="1">
													<option value="0">请选择</option>
													<option value="1">服 装</option>
													<option value="2">食 品</option>
													<option value="3">药 品</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="description">商品描述</label>
											<div class="col-md-9">
												<textarea id="textarea-input" id="description" name="description" rows="9" class="form-control"></textarea>
											</div>
										</div>
										
										<div style="width:300px;margin-left:400px">
										   <input type="reset"  class="btn" value="重置数据">
										   <input type="submit"  class="btn" style="margin-left:50px;" value="保存数据" onclick="tijiao()">
										</div>
										
										
										
										
									</form>
								</div>	
							</div>	
						</div>
  </body>
  
  <!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/vendor/skycons/js/skycons.js"></script>	
		
		<!-- Plugins JS-->
		<script src="assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
		<script src="assets/plugins/touchpunch/js/jquery.ui.touch-punch.min.js"></script>		
		<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script src="assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>
		<script src="assets/plugins/maskedinput/js/jquery.maskedinput.js"></script>

		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="assets/js/pages/form-elements.js"></script>
		
		<!-- end: JavaScript-->
		
	<!-- 	<script type="text/javascript">
			function tijiao(){
			  var good_name = document.getElementById("good_name").value;
	          /*  var buy_price = document.getElementById("buy_price").value;
	            var good_num = document.getElementById("good_num").value;
	             var good_producter = document.getElementById("good_producter").value;
	              var good_type = document.getElementById("good_type").value;
	               var description = document.getElementById("description").value; */
		  if(!"".equals(good_name)){
			  alert("插入成功");
			}else{
			alert("插入失败");
			}
			
			} </script>
  -->
		
</html>
