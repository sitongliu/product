<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP saleitem.jsp' starting page</title>
    
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
		<link href="assets/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		
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
									<h6><i class="fa fa-indent red"></i>卖出商品录入</h6>							
								</div>
								<div class="panel-body">
									<form action="" method="post"  class="form-horizontal ">
									
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_name">商品名称</label>
											<div class="col-md-9">
												<input type="text" id="good_name" name="good_name" class="form-control" placeholder="请输入商品名称">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="good_producter">生产厂商</label>
											<div class="col-md-9">
												<input type="text" id="good_producter" name="good_producter" class="form-control" placeholder="请输入商品生产厂商">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="sale_price">卖出商品单价</label>
											<div class="col-md-9">
												<input type="text" id="sale_price" name="sale_price" class="form-control" placeholder="请输入商品卖出单价">
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label" for="sale_time">卖出时间</label>
										    <input type="hidden" id="dtp_input2" value="" />
											<div class="col-md-9 controls input-append date form_date">
												<input type="text" id="datetimepicker" name="sale_time"  class="form-control" placeholder="请选择商品的卖出时间">
						                        <span class="add-on"><i class="icon-remove"></i></span>
											    <span class="add-on"><i class="icon-th"></i></span>
											</div>
											
											
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="sale_num">卖出数量</label>
											<div class="col-md-9">
												<input type="text" id="sale_num" name="sale_num" class="form-control" placeholder="请输入商品本次卖出的数量">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="select">商品类型</label>
											<div class="col-md-9">
												<select id="select" name="select" class="form-control" size="1">
													<option value="0">请选择商品类型</option>
													<option value="1">服 装</option>
													<option value="2">食 品</option>
													<option value="3">药 品</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label" for="sale_bz">商品卖出备注</label>
											<div class="col-md-9">
												<textarea id="sale_bz" name="sale_bz" rows="9" class="form-control" placeholder="Content.."></textarea>
											</div>
										</div>
										
										<div style="width:300px;margin-left:400px">
										   <input type="button"  class="btn" value="重置数据">
										   <input type="button"  class="btn" style="margin-left:50px;" value="保存数据">
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
		<script type="text/javascript" src="assets/other/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
        <script type="text/javascript" src="assets/other/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="assets/js/pages/form-elements.js"></script>
		
		<!-- end: JavaScript-->
		
		<script type="text/javascript"> 
       $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
        </script> 
  
</html>
