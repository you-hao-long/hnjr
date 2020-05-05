<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>用户管理</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">

		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">

		<link rel="stylesheet" href="<%=product_host%>static/view/css/style.css">

		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script src="<%=product_host%>static/view/js/modernizr.js"></script>

		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		.table>tbody>tr>td {
		line-height: 2.42857143;
	    }
	</style>

	<body>

		<jsp:include page="/static/view/top.jsp" flush="true"></jsp:include>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">

					<jsp:include page="/static/view/left.jsp" flush="true"></jsp:include>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

					<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">

							<form method="get" class="form-horizontal form-inline">
								<div class="row">
									<div class="col-md-2" style="width: 11%; padding-right: 0;">
										<a class="btn btn-default" href="javascript:add()" role="button">添加</a>
									</div>

								</div>

							</form>

						</div>
						<div class="panel-body">
							<div class="row">
								
								<div class="col-md-2">
									<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
								</div>
								<div class="col-md-10">
										<table class="table table-bordered table-striped" data-height="350">
								<thead>
									<tr>
										<th>登录名</th>
										<th>姓名</th>
										<th>所属部门</th>
										<th>创建时间</th>
										<th>性别</th>
										<th>年龄</th>
										<th>电话</th>
										<th>角色</th>
										<th>用户类型</th>
										<th>状态</th>
										

										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mytab"></tbody>
							</table>
							<input type="hidden" id="bmid" value=""/>
							<input type="hidden" id="now" value="" />
							<nav aria-label="Page navigation">
								<div class="col-md-3">
									<div class="input-group" style="margin: 20px 0;">
										<span class="input-group-addon">显示条数</span>
										<select class="form-control" id="ChangChart">
											<option value="10">10</option>
											<option value="20">20</option>
										</select>
									</div>
								</div>
								<ul class="pagination" id="page">
									<input type="hidden" id="pagess" value="" />
									<li>
										<a href="javascript:fenye()" aria-label="Previous">
											<span aria-hidden="true">上一页</span>
										</a>
									</li>

									<li id="last">
										<a href="#" aria-label="Next">
											<span aria-hidden="true">下一页</span>
										</a>
									</li>
								</ul>
							</nav>
							
							
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="background: none;">
									
									
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">添加</h4>
										</div>
									<iframe id="add" src="/user/addPage" width="600" height="420" frameborder="0"></iframe>
								<!--<iframe src="addusers.jsp" width="600" height="700" frameborder="0"></iframe>-->
								</div>
								</div>
							</div>
							
							
								<div class="modal fade" id="myModaledit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="background: none;">
									
									
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">修改</h4>
										</div>
									<iframe id="edit" src="" width="600" height="420" frameborder="0"></iframe>
								<!--<iframe src="addusers.jsp" width="600" height="700" frameborder="0"></iframe>-->
								</div>
								</div>
							</div>

							<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">删除</h4>
										</div>
										<div class="modal-body">
											你确定要删除这条记录？
										</div>
										<div class="modal-footer" id="delcon">
											
											
										</div>
									</div>
								</div>
							</div>
							
							
							
							

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
	</body>

	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!--	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery-1.4.4.min.js"></script>-->
	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="<%=product_host%>static/view/js/user.js"></script>
	<script>
		var clas = $('#ChangChart option:selected').attr('value');

		listload(1, clas);
		
		
	</script>
	
	

</html>