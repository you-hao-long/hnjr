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

		<title>项目管理</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/jquery-form.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		.chanpintab>li {
			margin-right: 10px;
		}
		
		.chanpintab>li>a {
			padding: 15px 20px;
		}
		.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		    border-top: none;
		}
		.row_tit,.row_tit1{
			font-size:16px ;
			margin-bottom: 15px;
		}
		.row_tit1{
			color: #0000FF;
		}
		.margin{
			margin-bottom: 15px;
		}
		.pad{
			padding: 0;
		}
		 .btn-sm {
		    padding: 4px 10px;
		    font-size: 12px;
		    line-height: 1.5;
		}
		 .table>thead>tr>th {
   			border-bottom:none;
		}
		#queding1 .form-control,#payment .form-control，#member .form-control{
			width: 50%;
			
		}
		.form-control{
			display: inline-block;
			height: 30px;
  			padding: 3px;
		}
		.btn1 {
		    background: #eee;
		    padding: 3px 15px;
		    color: #000;
		    text-align: center;
		}
		input[type=file] {
		    display: inline-block;
		}
		
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
					<h3 class="sub-header">基本信息</h3>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>项目编码：</b><span id="xxxi1"></span></div>
						<div class="col-xs-6 col-sm-3"><b>项目ID：</b><span id="xxxi2"></span></div>
						
						<div class="col-xs-6 col-sm-3"><b>项目名称：</b><span id="xxxi3"></span></div>
					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>项目新建时间：</b><span id="xxxi4"></span></div>
						<div class="col-xs-6 col-sm-3"><b>项目启动时间：</b><span id="xxxi5"></span></div>

					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>融资方：</b><span id="xxxi6"></span></div>
						<div class="col-xs-6 col-sm-3"><b>融资规模：</b><span id="xxxi7"></span></div>
						<div class="col-xs-6 col-sm-3"><b>融资期限（月）：</b><span id="xxxi8"></span></div>
						<div class="col-xs-6 col-sm-3"><b>融资类型：</b><span id="xxxi9"></span></div>
					</div>
					
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>项目经理：</b><span id="xxxi10"></span></div>
						<div class="col-xs-6 col-sm-3"><b>项目经理联系方式：</b><span id="xxxi11"></span></div>
						<div class="col-xs-6 col-sm-3"><b>对接人：</b><span  id="xxxi12"></span></div>
						<div class="col-xs-6 col-sm-3"><b>对接人联系方式：</b><span id="xxxi13"></span></div>
					</div>
					
					<div class="chanpinmarrgin">
						<ul class="nav nav-tabs chanpintab" id="nav-tabs">
							<li class="active">
								<a href="#t-state" data-toggle="tab">项目状态</a>
							</li>
							<!--<li>
								<a href="#t-profit" data-toggle="tab">项目进度</a>
							</li>-->
							<li>
								<a href="#t-buylist" data-toggle="tab">项目放款记录</a>
							</li>
							<li>
								<a href="#t-payment" data-toggle="tab">项目回款记录</a>
							</li>
							<li>
								<a href="#t-member" data-toggle="tab">项目成员管理</a>
							</li>
						</ul>
						<div class="tab-content">
							
							<div class="tab-pane fade in active" id="t-state">
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>项目状态：</b><span id="xxzt1"></span></div>
									<div class="col-xs-6 col-sm-3"><b>项目发起日期：</b><span id="xxzt2"></span></div>
									<div class="col-xs-6 col-sm-3"><b>合同方式：</b><span id="xxzt3"></span></div>
									<div class="col-xs-6 col-sm-3"><b>当前募集进度(%)：</b><span id="xxzt4"></span></div>
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>贷款利率(%)：</b><span id="xxzt5"></span></div>
									<div class="col-xs-6 col-sm-3"><b>处置利率(%)：</b><span id="xxzt6"></span></div>
									<div class="col-xs-6 col-sm-3"><b>财务顾问费率(%):</b><span id="xxzt7"></span></div>
									<div class="col-xs-6 col-sm-3"><b>收益方式:</b><span id="xxzt8"></span></div>
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>总计放款金额：</b><span id="xxzt9"></span></div>
									<div class="col-xs-6 col-sm-3"><b>执行放款时间：</b><span id="xxzt10"></span></div>
									<div class="col-xs-6 col-sm-3"><b>应付金额：</b><span id="xxzt11"></span></div>
									<div class="col-xs-6 col-sm-3"><b>确认到款时间：</b><span id="xxzt12"></span></div>
								</div>
								
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>回款状态：</b><span id="xxzt13"></span></div>
									
									<div class="col-xs-6 col-sm-3"><b>回款计划上传时间：</b><span id="xxzt14"></span></div>
									
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>预计回款时间：</b><span id="xxzt15"></span></div>
									<div class="col-xs-6 col-sm-3"><b>应收款金额：</b><span id="xxzt16"></span></div>
									<div class="col-xs-6 col-sm-3"><b>已收款金额：</b><span id="xxzt17"></span></div>
									<div class="col-xs-6 col-sm-3"><b>上一次收款时间：</b><span id="xxzt18"></span></div>
								</div>
							</div>

							

							<div class="tab-pane fade " id="t-buylist">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-xs-3">
														<shiro:hasPermission name="/project/addProjectfk">
														<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="list()">添加放款记录</a>
														</shiro:hasPermission>
													</div>
													
												</div>
											</div>
										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>

													<th>单位名称</th>
													<th>对接人</th>
													<th>联系方式</th>
													<th>项目经理</th>
													<th>支付类型</th>
													<th>放款金额</th>
													<th>放款日期</th>
													<th>银行</th>
													<th>账号</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mytab">
												
											</tbody>
										</table>
										<input type="hidden" id="now" value="" />
										<nav aria-label="Page navigation">
											<div class="col-md-2">
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
								</div>

								</div>
								<!--添加放款记录弹窗-->
								<div class="modal fade" id="queding1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											已和用户确认此笔款项已到账？
										</div>
										<div class="modal-footer" id="delcon">
											
											
										</div>
									</div>
								</div>
							</div>
								
								<div class="modal fade" id="buylist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加放款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/project/addProjectLoanRecord"  >
														<input type="hidden" name="type" value="1" />
														<input type="hidden" name="id" value="" id="projectId"/>
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="tcxx1">恒泰金融</span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="tcxx2">134****3254</span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="tcxx3">2017-08-24</span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span  id="tcxx4">ZOE</span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span  id="tcxx5">业务一部</span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="tcxx6">建设银行</span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="tcxx7">6220***********2455</span></div>
															<input type="hidden" name="bankId" id="bankId" />
															<input type="hidden" name="number" id="number" />
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">放款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="tcxx8">汇能一号</span></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span  id="tcxx9">13432545</span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span  id="tcxx10">债券型</span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>放款金额：</b>
																<input type="text" class="form-control" name="money" style="width: 50%" id="mon2">															
															</div>
															
															<div class="col-xs-6 col-sm-4">
																<b>支付类型：</b>
																<select name="payType" class="form-control" style="width: 50%">
																	<option value="1">银行代付</option>
																	<option value="2">企业打款</option>
																</select>															
															</div>
															<div class="col-xs-6 col-sm-4">
																<b>附件：</b>
																
																<input id="fileupload" type="file" name="file" style="width: 70%;">
															</div>
														</div>
														<!--<div class="row margin">
															
														</div>-->
														
														</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn " id="sub">确认</button>
													<button type="button" class="btn " data-dismiss="modal" aria-label="Close">取消</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal fade" id="buylistcon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">放款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  >
														
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="buyc1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="buyc2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="buyc3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span  id="buyc4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span  id="buyc5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="buyc6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="buyc7"></span></div>
														
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">放款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="buyc8"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span  id="buyc9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span  id="buyc10"></span></div>
															
														</div>
														<div class="row margin">
															
																<div class="col-xs-6 col-sm-4"><b>放款金额：</b><span  id="buyc11"></span></div>
																										
															
															
															<div class="col-xs-6 col-sm-4">
																<b >放款日期：</b>
																<span  id="buyc12"></span></div>													
															</div>
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>附件：</b>
																
																<a href="#"  id="xiazai"  target="_self">下载附件</a>
															</div>
															</div>
														</div>
														<!--<div class="row margin">
															
														</div>-->
														
													
													</form>
												</div>
												<div class="modal-footer">
													
													<button type="button" class="btn " onclick="colfan()">关闭</button>
												</div>
											</div>
										
										</div>
									</div>
							</div>
							
							<div class="tab-pane fade " id="t-payment">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-xs-3">
														<shiro:hasPermission name="/project/addProjecthk">
														<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="payment()">添加回款记录</a>
														</shiro:hasPermission>
													</div>
													
												</div>
											</div>
										</form>

									</div>
									<div class="panel-body">
											<table class="table table-bordered table-striped">
											<thead>
												<tr>

													<th>单位名称</th>
													<th>对接人</th>
													<th>联系方式</th>
													<th>项目经理</th>
													<th>回款类型</th>
													<th>回款金额</th>
													<th>回款日期</th>
													<th>银行</th>
													<th>账号</th>
												
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="myhui">
													
											</tbody>
										</table>
										<input type="hidden" id="now1" value="" />
										<nav aria-label="Page navigation">
											<div class="col-md-2">
												<div class="input-group" style="margin: 20px 0;">
													<span class="input-group-addon">显示条数</span>
													<select class="form-control" id="ChangChart1">
														<option value="10">10</option>
														<option value="20">20</option>
													</select>
												</div>
											</div>
											<ul class="pagination" id="page1">
												<input type="hidden" id="pagess1" value="" />
												<li>
													<a href="javascript:fenhui()" aria-label="Previous">
														<span aria-hidden="true">上一页</span>
													</a>
												</li>

												<li id="last1">
													<a href="#" aria-label="Next">
														<span aria-hidden="true">下一页</span>
													</a>
												</li>
											</ul>
										</nav>
										
										
										
							

								</div>
								<!--添加回款记录弹窗-->
								
								<div class="modal fade" id="queding2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel2">提示</h4>
										</div>
										<div class="modal-body">
											已和用户确认此笔款项已到账？
										</div>
										<div class="modal-footer" id="delcon2">
											
											
										</div>
									</div>
								</div>
							</div>
								<div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加回款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form2" action="/project/addProjectLoanRecord"> 
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<input type="hidden" name="type" value="2" />
														<input type="hidden" name="id" value="" id="projectId1"/>
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="hktk1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="hktk2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="hktk3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="hktk4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="hktk5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="hktk6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="hktk7"></span></div>
															<input type="hidden" name="bankId" id="bankId1" value="">
															<input type="hidden" name="number" id="number1" value="">
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">回款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="hktk8"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span id="hktk9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span id="hktk10"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>回款金额：</b>
																<input type="text" class="form-control" name="money" style="width: 50%" id="money">															
															</div>
															
															<div class="col-xs-6 col-sm-4">
																<b>支付类型：</b>
																<select name="payType" class="form-control" style="width: 50%">
																	<option value="1">银行代付</option>
																	<option value="2">企业打款</option>
																</select>														
															</div>
															<div class="col-xs-6 col-sm-4">
																<b>回款类型：</b>
																<select name="paymentType" class="form-control" style="width: 50%">
																	<option value="1">利息</option>
																	<option value="2">本金</option>
																	<option value="3">本息</option>
																</select>														
															</div>
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>附件：</b>
																<input id="fileupload1" type="file" name="file"style="width: 60%;">													
															</div>
														</div>
														
														</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn " id="sub1">确认</button>
													<button type="button" class="btn " data-dismiss="modal" aria-label="Close">取消</button>
												</div>
											</div>
										</div>
									</div>
									
									
									
									<div class="modal fade" id="payment1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">回款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal">
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="huicon1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="huicon2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="huicon3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="huicon4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="huicon5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="huicon6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="huicon7"></span></div>
															
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">回款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="huicon8"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span id="huicon9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span id="huicon10"></span></div>
															</div>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>回款金额：</b><span id="huicon11"></span></div>
															<div class="col-xs-6 col-sm-4"><b>回款日期：</b><span id="huicon12"></span></div>
															<div class="col-xs-6 col-sm-4"><b>支付类型：</b><span id="huicon13"></span></div>
															</div>
														</div>
														<div class="row">
															<div class="row margin">
															
																<div class="col-xs-6 col-sm-4"><b>回款类型：</b><span id="huicon14"></span></div>
																										
															
															
															
																<div class="col-xs-6 col-sm-4">
																	<b>附件：</b>
																	
																	<a href="#"  id="xiazai1"  target="_self">下载附件</a>
																</div>
															</div>
														
														</div>
														
													</form>
												</div>
												<div class="modal-footer">
												
													<button type="button" class="btn " data-dismiss="modal" aria-label="Close">取消</button>
												</div>
											</div>
										</div>
									</div>
</div>
							</div>
							
							<div class="tab-pane fade " id="t-member">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-xs-3">
														<shiro:hasPermission name="/project/addProjectuser">
														<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="member()">添加项目成员</a>
														</shiro:hasPermission>
													</div>
													
												</div>
											</div>
										</form>

									</div>
									<div class="panel-body">
									
										
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>姓名</th>
													<th>手机</th>
													<th>角色</th>
													<th>操作</th>
													
												</tr>
											</thead>
											<tbody id="myuser">
													<tr>
													<td>黄志良</td>
													<td>13145141313</td>
													<td>项目经理</td>
													<td>
														<button type="button" class="btn btn-primary btn-sm">修改</button>
														<button type="button" class="btn btn-default btn-sm">删除</button>
													</td>
												</tr>
											</tbody>
										</table>
										<input type="hidden" id="now2" value="" />
										<nav aria-label="Page navigation">
											<div class="col-md-2">
												<div class="input-group" style="margin: 20px 0;">
													<span class="input-group-addon">显示条数</span>
													<select class="form-control" id="ChangChart2">
														<option value="10">10</option>
														<option value="20">20</option>
													</select>
												</div>
											</div>
											<ul class="pagination" id="page2">
												<input type="hidden" id="pagess2" value="" />
												<li>
													<a href="javascript:fenuser()" aria-label="Previous">
														<span aria-hidden="true">上一页</span>
													</a>
												</li>

												<li id="last2">
													<a href="#" aria-label="Next">
														<span aria-hidden="true">下一页</span>
													</a>
												</li>
											</ul>
										</nav>
								</div>

								</div>
								<!--添加回款记录弹窗-->
								<div class="modal fade" id="deluser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">删除</h4>
										</div>
										<div class="modal-body">
											你确定要删除这条记录？
										</div>
										<div class="modal-footer" id="delusercon">
											
											
										</div>
									</div>
								</div>
							</div>
								<div class="modal fade" id="member" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加项目成员</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal">
															<table class="table">
																<thead>
																	<tr>
																		<th>姓名</th>
																		<th></th>
																		<th>手机</th>
																		<th>角色</th>
																		<th></th>
																	</tr>
																</thead>
																<tbody>
																	
																	<tr>
																		<td>
																			<input class="form-control" id="empname" readonly=""/>
																			<input type="hidden" value="" id="empId" />
																			
																		</td>
																		<td>
																			<button type="button" class="btn btn1" onclick="chanpian()">选择</button>
																		</td>
																		<td>
																			<input class="form-control" id="empiphone" readonly=""/>
																		</td>
																		<td>
																			
																			<select id="role" class="form-control">
																				<option value="1">项目经理</option>
																				<option value="2">项目成员</option>
																			</select>
																		</td>
																		<td>
																			<button type="button" class="btn btn1" onclick="empadd()">添加</button>
																		</td>
																	</tr>
																</tbody>
															</table>	
														
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn " onclick="cloemp()">关闭</button>
													
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="modal fade" id="member1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">修改项目成员</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal">
															<table class="table">
																<thead>
																	<tr>
																		<th>姓名</th>
																		<th></th>
																		<th>手机</th>
																		<th>角色</th>
																		<th></th>
																	</tr>
																</thead>
																<tbody>
																	
																	<tr>
																		<td>
																			<input class="form-control" id="empname1" readonly="" />
																			<input type="hidden" value="" id="empId1" />
																			
																		</td>
																		<td>
																			<button type="button" class="btn btn1" onclick="chanpian()">选择</button>
																		</td>
																		<td>
																			<input class="form-control" id="empiphone1" readonly=""/>
																		</td>
																		<td>
																			
																			<select id="role1" class="form-control">
																				<option value="1">项目经理</option>
																				<option value="2">项目成员</option>
																			</select>
																		</td>
																		<td>
																			<button type="button" class="btn btn1" onclick="empeidx()">修改</button>
																		</td>
																	</tr>
																</tbody>
															</table>	
														
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn " onclick="cloemp1()">关闭</button>
													
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="modal fade" id="sutup1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document" style="width: 65%;">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目经理</h4>
									</div>
									<div class="modal-body" style="height: 500px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-3">
													<span class="col-xs-3" style="padding: 5px 5px 0 0;">名称</span> 
													<input class="form-control" style=" width: 70%;" /></span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 5px 5px 0 0;">手机</span><input class="form-control" style=" width: 70%;" />
											
												</span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 5px 5px 0 0;">部门</span> 
												<input class="form-control" style=" width: 70%;" />
													
												</span>

												<span class=" col-xs-3"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>
											</div>
											<table class="table table-bordered table-striped tab_td">
												<thead>
													<tr>
														<td class=" col-xs-1">姓名</td>
														<td class=" col-xs-1">电话</td>
														<td class=" col-xs-1">部门</td>
														<td class=" col-xs-2">角色</td>
													
														<td class=" col-xs-1">操作</td>
													</tr>
												</thead>
												<tbody id="addxmxz1">
														
													
												</tbody>
											
											</table>

										</form>
									</div>
									
								</div>
							</div>
						</div>

							</div>
						</div>

					</div>
					
					
					<div class="modal fade" id="dellist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											是否删除此条记录？
										</div>
										<div class="modal-footer" id="dellistcon">
											
											
										</div>
									</div>
								</div>
							</div>

				</div>
			</div>
		</div>
	</body>
	<script src="<%=product_host%>static/view/js/projectdetail.js"></script>
	<script>
		var id = ${projectId};
		loadxx(id);
		
		$(function() {
			$('#nav-tabs li a[href="#t-state"]').click(function(e) {
			});
		});
		
		$('#nav-tabs li a[href="#t-buylist"]').click(function(e) {

			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas, id, 1);
		});
		
		$('#nav-tabs li a[href="#t-payment"]').click(function(e) {

			var clas = $('#ChangChart1 option:selected').attr('value');

			listload1(1, clas, id, 2);
		});
		
		$('#nav-tabs li a[href="#t-member"]').click(function(e) {

			var clas = $('#ChangChart2 option:selected').attr('value');

			listload2(1, clas, id);
		});
		
		

		
		
		
		$("#sub").click(function () {
		var clas = $('#ChangChart option:selected').attr('value');
		    $("#form1").ajaxSubmit({
		    dataType: "json", //数据类型
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#buylist').modal('hide');
		         	listload(1, clas, id, 1);
		         }else{
		         	alert(data.msg);
		         	$('#buylist').modal('hide');
		         }
		    }
		    });
		});
		
		
		$("#sub1").click(function () {
			var clas = $('#ChangChart1 option:selected').attr('value');
		    $("#form2").ajaxSubmit({
		    dataType: "json", //数据类型
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#payment').modal('hide');
		         	listload1(1, clas, id, 2);
		         }else{
		         	alert(data.msg);
		         }
		    }
		    });
		});
		
		
		
		function listload(page, rows, id,type) {
	$('#page').html('');
	$('#mytab').html('');
	$('#now').val(page);
	$.ajax({
		url: '/project/findProjectLoanRecord', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			'projectId':id,
			'type':type
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

				if(allList[i].payType==1){
					var payType='银行代付'
				}else if(allList[i].payType==2){
					var payType='企业打款'
				}
				if(allList[i].payType==1){
					var payType='银行代付';
				}else if(allList[i].payType==2){
					var payType='公司打款';
				}
				
			

				var html = '';
				if(allList[i].state==1){
					var state='已支付,待确定';
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/project/Projectfkdz"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+')">到账确认</button></shiro:hasPermission><shiro:hasPermission name="/project/Projectfkck"><button type="button" class="btn btn-default btn-sm" onclick="fankan('+allList[i].id+','+id+')">查看</button></shiro:hasPermission><shiro:hasPermission name="/project/Projectfksc"><button type="button" class="btn btn-default btn-sm" onclick="shanchu('+allList[i].id+',1)">删除</button></shiro:hasPermission></td></tr>';
				}else if(allList[i].state==2){
					var state='转账成功';
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/project/Projectfkck"><button type="button" class="btn btn-default btn-sm" onclick="fankan('+allList[i].id+','+id+')">查看</button></shiro:hasPermission></td></tr>';
				}

				

				$('#mytab').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
			$('#pagess').val(data.obj.total);
			pagess();

		},
		error: function() {

		}
	});

}
		
		
		
		function listload1(page, rows, id,type) {
	$('#page1').html('');
	$('#myhui').html('');
	$('#now1').val(page);
	$.ajax({
		url: '/project/findProjectLoanRecord', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			'projectId':id,
			'type':type
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

				if(allList[i].paymentType==1){
					var payType='利息'
				}else if(allList[i].paymentType==2){
					var payType='本金'
				}else if(allList[i].paymentType==2){
					var payType='本息'
				}
				
			

				var html = '';
				if(allList[i].state==1){
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td><shiro:hasPermission name="/project/Projecthkqd"><button type="button" class="btn btn-default btn-sm" onclick="hkqd('+allList[i].id+')">到账确认</button></shiro:hasPermission><shiro:hasPermission name="/project/Projecthkck"><button type="button" class="btn btn-default btn-sm" onclick="payment1('+allList[i].id+','+id+')">查看</button></shiro:hasPermission><shiro:hasPermission name="/project/Projecthksc"><button type="button" class="btn btn-default btn-sm" onclick="shanchu('+allList[i].id+',2)">删除</button></shiro:hasPermission></td></tr>';
				}else{
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td><shiro:hasPermission name="/project/Projecthkck"><button type="button" class="btn btn-default btn-sm" onclick="payment1('+allList[i].id+','+id+')">查看</button></shiro:hasPermission></td></tr>';
					
				}

				$('#myhui').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess1" value="" /><li><a href="javascript:fenhui(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last1"><a href="javascript:fenhui(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page1').append(page);
			$('#pagess1').val(data.obj.total);
			pagess1();

		},
		error: function() {

		}
	});

}




function listload2(page, rows, id) {
	$('#page2').html('');
	$('#myuser').html('');
	$('#now2').val(page);
	$.ajax({
		url: '/project/queryProjectMenberList', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			'projectId':id,
		
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

					if(allList[i].role==1){
						var role='项目经理';
					}else if(allList[i].role==2){
						var role='项目成员';
					}
			
	
				var html = '';
				
					html += '<tr><td>'+allList[i].name+'</td><td>'+allList[i].phone+'</td><td>'+role+'</td><td><shiro:hasPermission name="/project/Projectuserxg"><button type="button" class="btn btn-default btn-sm" onclick="userxg('+allList[i].id+')">修改</button></shiro:hasPermission><shiro:hasPermission name="/project/Projectuserdel"><button type="button" class="btn btn-default btn-sm" onclick="deluser('+allList[i].id+')">删除</button></shiro:hasPermission></td></tr>';

				$('#myuser').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess2" value="" /><li><a href="javascript:fenuser(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last2"><a href="javascript:fenuser(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page2').append(page);
			$('#pagess2').val(data.total);
			pagess2();

		},
		error: function() {

		}
	});

}



function shanchu(index,num) {
//	alert(num);
	$('#dellistcon').html('');
	$('#dellist').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" data-dismiss="modal">否</button><button type="button" class="btn btn-primary" onclick="shanchucon(' + index + ','+num+')">是</button>';
	$('#dellistcon').append(html);
}

function shanchucon(index,num) {
	
	$.ajax({
		url: '/project/deleteProjectPayment', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'projectLoanRecordId': index,
			
		},
		dataType: "json", //返回结果格式
		success: function(data) {

			alert(data.msg);
			$('#dellist').modal('hide');
//			listload(now, clas);
if(num==1){
			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas, id, 1);}
else if(num==2){
	var clas = $('#ChangChart1 option:selected').attr('value');

			listload1(1, clas, id, 2);
	
}

		},
		error: function() {
			// view("异常！");
			//				$.alert("异常！");
		}
	});

}

	</script>

</html>