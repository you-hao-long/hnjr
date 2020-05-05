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

		<title>产品管理</title>

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
		.table {
			margin-top: 15px;
		}
		
		#myModal label {
			font-size: 12px;
			font-weight: 100;
		}
		
		#myModal b {
			font-size: 14px;
		}
		
		.cont {
			margin-bottom: 40px;
			text-align: center;
		}
		
		.cont input,
		.cont span,
		.cont b {
			margin-right: 15px;
		}
		
		.row_tit,
		.row_tit1 {
			font-size: 16px;
			margin-bottom: 15px;
			margin-left: 15px;
		}
		
		.row_tit1 {
			color: #0000FF;
		}
		
		.margin {
			margin-bottom: 15px;
		}
		
		.tab_td,
		.tab_td tr {
			margin-top: 15px;
			margin-bottom: 5px;
		}
		
		.tab_td td {
			padding: 0;
			margin-right: 5px;
			text-align: center;
		}
		th,td{
			text-align: center;
		}
		.btn1 {
			background: #eee;
			padding: 3px 15px;
			color: #000;
		}
		.form-control{
			display: inline-block;
		    height: 30px;
			padding: 3px;
		}
		.form-group-sm .form-control {
		    padding: 3px;
		}
		
		#record .row,
		#check .row {
			margin-bottom: 15px;
		}
		
		.pad {
			padding: 0;
		}
		#profit .form-control,#profit1 .form-control{
		    width: 90%;
		}
	
		.marg{
			margin-right: 15px;
		}
		.form-control[readonly] {
		    background: #fff;
		}
		input[type=file] {
			display: inline-block; 
		}
		.table-bordered {
		    border-bottom: 0;
		    border-left: 0;
		    border-right: 0;
		}
		.tdinpt{
			border: 0;
			background: transparent;
		}
		.row{
			margin-left: 0;
		}
		.form-cont {
	    height: 30px;
	    padding: 0;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
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
						<div class="col-xs-6 col-sm-3"><b>基金产品ID：</b><span id="cpxx1"></span></div>
						<div class="col-xs-6 col-sm-3"><b>产品代码：</b><span id="cpxx2"></span></div>
						<div class="col-xs-6 col-sm-3"><b>项目ID：</b><span id="cpxx3"></span></div>
						<div class="col-xs-6 col-sm-3"><b>项目名称：</b><span id="cpxx4"></span></div>
					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>产品名称：</b><span id="cpxx5"></span></div>
						<div class="col-xs-6 col-sm-3"><b>产品类型：</b><span id="cpxx6"></span></div>

					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>融资方：</b><span id="cpxx7"></span></div>
						<div class="col-xs-6 col-sm-3"><b>预期募集金额：</b><span id="cpxx8"></span></div>
						<div class="col-xs-6 col-sm-3"><b>期限（月）：</b><span id="cpxx9"></span></div>
						<div class="col-xs-6 col-sm-3"><b>是否分期：</b><span id="cpxx10"></span></div>
					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>付息方式：</b><span id="cpxx11"></span></div>
						<div class="col-xs-6 col-sm-3"><b>托管银行：</b><span id="cpxx12"></span></div>
						<div class="col-xs-6 col-sm-3"><b>委贷银行：</b><span id="cpxx13"></span></div>
						<div class="col-xs-6 col-sm-3"><b>产品收益类型：</b><span id="cpxx14"></span></div>
					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6 col-sm-3"><b>产品经理：</b><span id="cpxx15"></span></div>
						<div class="col-xs-6 col-sm-3"><b>产品经理联系方式：</b><span id="cpxx16"></span></div>
						<div class="col-xs-6 col-sm-3"><b>对接人：</b><span id="cpxx17"></span></div>
						<div class="col-xs-6 col-sm-3"><b>对接人联系方式：</b><span id="cpxx18"></span></div>
					</div>
					<div class="row margin chanpinborder">
						<div class="col-xs-6"><b>投资期限：</b><span id="cpxx19"></span></div>
						<div class="col-xs-6"><b>认购起点：</b><span id="cpxx20"></span></div>

					</div>
					<div class="chanpinmarrgin">
						<ul class="nav nav-tabs chanpintab" id="nav-tabs">
							<li class="active">
								<a href="#t-state" data-toggle="tab">产品状态</a>
							</li>
							<li>
								<a href="#t-profit" data-toggle="tab">收益分配</a>
							</li>
							<li>
								<a href="#t-buylist" data-toggle="tab">产品申购</a>
							</li>
							<li>
								<a href="#t-payment" data-toggle="tab">产品本息支付</a>
							</li>
							<li>
								<a href="#t-report" data-toggle="tab">产品管理</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="t-state">
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>产品状态：</b><span id="zt1"></span></div>
									<div class="col-xs-6 col-sm-3"><b>实际成立日期：</b><span id="zt2"></span></div>
									<div class="col-xs-6 col-sm-3"><b>实际发行日期：</b><span id="zt3"></span></div>
									<div class="col-xs-6 col-sm-3"><b>实际募集金额：</b><span id="zt4"></span></div>
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>代销方式：</b><span id="zt5"></span></div>
									<div class="col-xs-6 col-sm-3"><b>投资顾问：</b><span id="zt6"></span></div>

								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>基金类型：</b><span id="zt7"></span></div>
									<div class="col-xs-6 col-sm-3"><b>基金管理人：</b><span id="zt8"></span></div>
									<div class="col-xs-6 col-sm-3"><b>募集对象：</b><span id="zt9"></span></div>
									<div class="col-xs-6 col-sm-3"><b>承销规模：</b><span id="zt10"></span></div>
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>管理费（%）：</b><span id="zt11"></span></div>
									<div class="col-xs-6 col-sm-3"><b>托管费（%）：</b><span id="zt12"></span></div>
									<div class="col-xs-6 col-sm-3"><b>认购费（%）：</b><span id="zt13"></span></div>
								</div>
								<div class="row margin chanpinborder">
									<div class="col-xs-6 col-sm-3"><b>参与方式：</b><span id="zt14"></span></div>
									<div class="col-xs-6 col-sm-3"><b>退出方式：</b><span id="zt15"></span></div>
									<div class="col-xs-6 col-sm-3"><b>税收类型：</b><span id="zt16"></span></div>
									<div class="col-xs-6 col-sm-3"><b>税率：</b><span id="zt17"></span></div>
								</div>
							</div>

							<div class="tab-pane fade " id="t-profit">

								<div class="table-responsive col-xs-6">
									<div class="row" style="margin-top: 10px;">
										<div class="col-xs-3">
											<shiro:hasPermission name="/productdetail/addIncomeDistribution">
												<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="xiugaisy()">添加收益分配</a>
											</shiro:hasPermission>
										</div>
										<div class="col-xs-3">
											<shiro:hasPermission name="/productdetail/setRoyaltyMode">
											<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="add()">设置提成方式</a>
											</shiro:hasPermission>
										</div>

									</div>

									<table class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>实际出资额（单位：万元）</th>
												<th>A类：12个月</th>
												<th>B类：6个月</th>
												<th>C类：3个月</th>
											</tr>
										</thead>
										<tbody id="syfp">
											
										</tbody>
									</table>
									<!--弹窗 wj-->
									<div class="modal fade" id="profit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 930px;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">设置提成方式</h4>
												</div>
												<div class="modal-body" style="height: 500px;overflow: scroll;">
													<form class="form-horizontal">
														<table class="table table-bordered table-striped">
															<thead>
																<tr>
																	<th>出资额（万）</th>
																	<th>购买期限</th>
																	<th>前端费用</th>
																	<th>后端费用</th>
																	<th></th>
																</tr>
																
															</thead>
															<tbody id="fscon">
																
																
																
															</tbody>
															<tr>
																	<td style="border: 0px;"><input class="form-control" placeholder="格式为100,300" type="text" id="tc1"></td>
																	<td  style="border: 0px;">
																		<select class="form-control" type="text" id="tc2">
																		<option value="3">3个月</option>
																		<option value="6">6个月</option>
																		<option value="12">12个月</option>
																		</select>	
																
																	</td>
																	<td  style="border: 0px;"><input class="form-control" placeholder="单位为%" type="text" id="tc3"></td>
																	<td  style="border: 0px;"><input class="form-control" placeholder="单位为%" type="text" id="tc4"></td>
																	<td style="border: 0px;"><input class="btn btn1" value="添加" type="button" style="padding: 1px 8px;margin-left: 0;" onclick="addtc(${productId})"></td>
																</tr>
														</table>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn " onclick="gbtc()">关闭</button>
													
												</div>
											</div>
										</div>
									</div>
									<div class="modal fade" id="shanchu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
												<h4 class="modal-title" id="myModalLabel">删除</h4>
											</div>
											<div class="modal-body">
												你确定要删除这条记录？
											</div>
											<div class="modal-footer" id="shanchucon">
												
												
											</div>
										</div>
									</div>
								</div>
									<div class="modal fade" id="profit1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 740px;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">设置收益分配</h4>
												</div>
												<div class="modal-body" style="height: 500px;overflow: scroll;">
													
													<form class="form-horizontal">
														<table class="table table-bordered table-striped">
															<thead>
																<tr>
																	<th>出资额（万）</th>
																	<th>购买期限</th>
																	<th>收益比例</th>
																	<th></th>
																</tr>
																
															</thead>
															<tbody id="sycon">
																
																
																
															</tbody>
															<tr>
																	<th style="border: 0px;"><input class="form-control" placeholder="格式为100，300" type="text" id="sy1"></th>
																	<th  style="border: 0px;">
																		<select class="form-control" type="text" id="sy2">
																		<option value="3">3个月</option>
																		<option value="6">6个月</option>
																		<option value="12">12个月</option>
																		
																		</select>
																	</th>
																	<th  style="border: 0px;"><input class="form-control" placeholder="单位为%" type="text" id="sy3"></th>
																	<th  style="border: 0px;"><input class="btn btn1" value="添加" type="button" style="padding: 1px 8px;" onclick="addsy(${productId})"></th>
																</tr>
														</table>
													
														
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn " onclick="gbsy()">确认</button>
													
												</div>
											</div>
										</div>
									</div>
									<div class="modal fade" id="scsy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
												<h4 class="modal-title" id="myModalLabel">删除</h4>
											</div>
											<div class="modal-body">
												你确定要删除这条记录？
											</div>
											<div class="modal-footer" id="scsycon">
												
												
											</div>
										</div>
									</div>
								</div>
									
									
								</div>
							</div>

							<div class="tab-pane fade " id="t-buylist">

								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0; margin-right: 8px;">
													<div class="">
														<shiro:hasPermission name="/productdetail/addPurchaseRecord">
															<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="list()" style="padding: 4px 12px;">添加申购记录</a>
														</shiro:hasPermission>
													</div>

												</div>
												<div class="col-xs-2 padding">
													<div class="input-group">
														<span class="input-group-addon">用户姓名</span>
														<input type="text" class="form-control" name="title" value="" placeholder="用户姓名">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">手机号</span>
														<input type="text" class="form-control" name="title" value="" placeholder="手机号">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">理财经理</span>
														<input type="text" class="form-control" name="title" value="" placeholder="理财经理">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">状态</span>
														<input type="text" class="form-control" name="title" value="" placeholder="状态">
													</div>
												</div>

											</div>
											<div class="row totalbtn">
												<div class="col-md-2" style="width: 11%; padding-right: 0;"></div>

												<div class="col-xs-5 padding">

													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												</div>
												<div class="clo-md-1 padding">
													<button type="button" class="btn btn-primary">查询</button>
												</div>
											</div>

										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped" data-height="350">
											<thead>
												<tr>
													<th>编号</th>
													<th>用户</th>
													<th>手机</th>
													<th>申购日期</th>
													<th>申购金额</th>
													<th>到款金额</th>
													<th>上次划款日期</th>
													<th>所属部门</th>
													<th>理财经理</th>
													<th>到期日期</th>
													<th>状态</th>

													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mytab"></tbody>
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
									<!--添加申购记录弹窗 wj-->
									<div class="modal fade" id="buylist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 65%;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加申购记录</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<div class="col-xs-6 col-sm-4">
																	<b>用户：</b>
																	<span id="username"></span>
																
																	<a class="btn btn1" href="javascript:sut()" style="padding: 0 12px;">设置</a>
																</div>
																<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="iphone"></span></div>
																<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="time"></span></div>

															</div>
															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="tuijian"></span></div>
																<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="bumen"></span></div>

															</div>

															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="bank"></span></div>
																<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="banknum"></span></div>

															</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">购买信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>购买产品：</b><span id="prdname"></span></div>
																<div class="col-xs-6 col-sm-4"><b>产品ID：</b><span id="cpid"></span></div>
																<input type="hidden" name="productId" value="${productId}" />
																<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="cplx"></span></div>

															</div>
															<div class="row margin">
																<div class="col-xs-6 col-sm-4">
																	<b>申购金额：</b>
																	<input type="text" class="form-control " id="sgje" name="applyMoney" style="width: 60%;">
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>申购期限：</b>
																<!--	<input type="text" class="form-control" id="sgqx" name="applyTime"  style="width: 60%;">-->
																	<select id="sgqx" class="form-control" name="applyTime" style="width: 60%;">
																		<option value="3">3个月</option>
																		<option value="6">6个月</option>
																		<option value="12">12个月</option>
																	</select>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>是否分期：</b>
																	<select id="sgfq" class="form-control" name="periodization" style="width: 45%;">
																		<option value="0">否</option>
																		<option value="1">是</option>
																	</select>
																</div>
															</div>
															<div class="row margin">
																<input type="hidden" value="1" name="creareID" />
																<input type="hidden"  value="" name="userId" id="userId" />
																<div class="col-xs-6 col-sm-4">
																	<b>付息方式：</b>
																<!--	<input type="text" class="form-control" id="sgfx" name="payingInterest" style="float: left; width: 60%;">-->
																	<select  class="form-control" name="payingInterest" style="width: 60%;">
																		<option value="1">定期</option>
																		<option value="2">不定期</option>
																		
																	</select>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>产品收益类型：</b>
																
																	<select  class="form-control" name="incomeType" style="width: 45%;">
																		<option value="1">固定</option>
																		<option value="2">浮动</option>
																		<option value="3">浮动加固定</option>
																	</select>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>附件：</b>
																	<input id="fileupload" type="file" name="file" style="width: 60%;">
																</div>
															</div>

														</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn " id="sub">确认</button>
													<button type="button" class="btn"  onclick="sgqx()">取消</button>
												</div>
											</div>
										</div>
									</div>
									
									
									<!--设置弹窗-->
									<div class="modal fade" id="sutup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 65%;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">用户选择</h4>
												</div>
												<div class="modal-body" style="height: 500px; overflow-y: scroll;">
													<form class="form-horizontal">
														<div class="row">
															<b class="col-xs-2">用户信息</b>
															<span class="col-xs-4"><span class="col-xs-3" style="padding: 0 5px 0 0;">姓名</span> <input class="form-control" style="width: 70%;"/></span>
															<span class="col-xs-4"><span class="col-xs-4"style="padding: 0 5px 0 0;">手机号</span> <input class="form-control" style="width: 60%;" /></span>

															<span class=" col-xs-2"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>
														</div>

														<table class="table table-bordered table-striped tab_td">
															<thead>
																<tr>
																	<td class=" col-xs-1">编号</td>
																	<td class=" col-xs-1">称呼</td>
																	<td class=" col-xs-1">性别</td>
																	<td class=" col-xs-2">联系电话</td>
																	<td class=" col-xs-1">类别</td>
																	<td class=" col-xs-1">业务员</td>
																	<td class=" col-xs-2">创建日期</td>
																	<!--<td class=" col-xs-2">投资记录</td>-->
																	<td class=" col-xs-1">操作</td>
																</tr>
															</thead>
															<tbody id="adduser">
																

															</tbody>

														</table>

													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn ">确认</button>
													<button type="button" class="btn ">取消</button>
												</div>
											</div>
										</div>
									</div>
									<!--添加付款记录-->
									<div class="modal fade" id="append" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width: 65%;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">付款记录</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal">
												<table class="table table-bordered table-striped tab_td">
														<thead>
															<tr>
																<td class="col-sm-2">付款金额</td>
																<td class="col-sm-2">添加时间</td>
																<td class="col-sm-2">添加人</td>
																<td class="col-sm-2">确认时间</td>
																<td class="col-sm-1">确认人</td>
																<td class="col-sm-3">操作</td>
															</tr>
															
														</thead>	
														<tbody id="apend_tbody">
															
														</tbody>
												</table>	
												<table class="tab_td mytab_td">
													<tr>
														<td class="col-sm-2">
															<input class="form-cont" type="text" name="" id="pay_money" placeholder="付款金额" style="width: 80%;"/>
														</td>
														<td class="col-sm-2">
															<input class="form-cont"  type="text" name="" id="pay_time" value=""  placeholder="添加时间" readonly="" style="width: 80%;"/></td>
														<td class="col-sm-2"></td>
														<td class="col-sm-2"></td>
														<td class="col-sm-1"></td>
														<td class="col-sm-3">
															<shiro:hasPermission name="/productdetail/addPaymentRecord">
															<a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="record()">添加付款记录</a></td>
															</shiro:hasPermission>
													</tr>
												</table>			
														
												</div>
											</form>
										<div class="modal-footer">
											<!--<button type="button" class="btn ">确定</button>-->
											<shiro:hasPermission name="/productdetail/paymentComplete">
											<button type="button" class="btn " onclick="allrecord()">付款完成</button>
											</shiro:hasPermission>
										</div>
										</div>
										
									</div>
								</div>
								</div>
								
								
								
								<div class="modal fade" id="buylistcon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">申购记录</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<div class="col-xs-6 col-sm-4">
																	<b>用户：</b>
																	<span id="sgcon1"></span>
																
																</div>
																<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="sgcon2"></span></div>
																<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="sgcon3"></span></div>

															</div>
															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="sgcon4"></span></div>
																<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="sgcon5"></span></div>

															</div>

															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="sgcon6"></span></div>
																<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="sgcon7"></span></div>

															</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">购买信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<div class="col-xs-6 col-sm-4"><b>购买产品：</b><span id="sgcon8"></span></div>
																<div class="col-xs-6 col-sm-4"><b>产品ID：</b><span id="sgcon9"></span></div>
															
																<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="sgcon10"></span></div>

															</div>
															<div class="row margin">
																<div class="col-xs-6 col-sm-4">
																	<b>申购金额：</b>
																	<span id="sgcon11"></span>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>申购期限：</b>
																	<span id="sgcon12"></span>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>是否分期：</b>
																	
																	<span id="sgcon13"></span>
																</div>
															</div>
															<div class="row margin">
																<input type="hidden" value="1" name="creareID" />
																<input type="hidden"  value="" name="userId" id="userId" />
																<div class="col-xs-6 col-sm-4">
																	<b>付息方式：</b>
																	<span id="sgcon14"></span>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>产品收益类型：</b>
																
																	<span id="sgcon15"></span>
																</div>
																<div class="col-xs-6 col-sm-4">
																	<b>附件：</b>
																	<shiro:hasPermission name="/productdetail/download">
																	<a href="#" id="xiazai1" target="_self">下载附件</a>
																	</shiro:hasPermission>
																</div>
															</div>

														</div>
													</form>
												</div>
												<div class="modal-footer">
													<shiro:hasPermission name="/productdetail/printFinancialAdvice">
													<button type="button" class="btn btn-primary" onclick="
finance()">打印合伙人财务通知书</button>
													</shiro:hasPermission>
													<shiro:hasPermission name="/productdetail/printInvestmentConfirmation">
													<button type="button" class="btn btn-primary" onclick="print()">打印出资确认书</button>
													</shiro:hasPermission>
													<button type="submit" class="btn " id="sub"  data-dismiss="modal" aria-label="Close">关闭</button>
													
												</div>
											</div>
										</div>
									</div>
									

							</div>
							<!--
                            	作者：784901633@qq.com
                            	时间：2017-09-27
                            	描述：产品本息支付
                            -->
							<div class="tab-pane fade " id="t-payment">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-md-3">
														<shiro:hasPermission name="/productdetail/batchConfirmation">
															<a class="btn btn-default" href="javascript:duopay()">批量确认</a>
														</shiro:hasPermission>	
													</div>
													
												</div>
												<div class="col-xs-2 padding">
													<div class="input-group">
														<span class="input-group-addon">用户姓名</span>
														<input type="text" class="form-control" name="title" value="" placeholder="用户姓名">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">手机号</span>
														<input type="text" class="form-control" name="title" value="" placeholder="手机号">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">理财经理</span>
														<input type="text" class="form-control" name="title" value="" placeholder="理财经理">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">状态</span>
														<input type="text" class="form-control" name="title" value="" placeholder="状态">
													</div>
												</div>

											</div>
											<div class="row totalbtn">
												<div class="col-md-2" style="width: 11%; padding-right: 0;"></div>

												<div class="col-xs-5 padding">

													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart1" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd1" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												</div>
												<div class="clo-md-1 padding">
													<button type="button" class="btn btn-primary">查询</button>
												</div>
											</div>

										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th></th>
													<th>编号</th>
													<th>用户</th>
													<th>手机</th>
													<th>申购日期</th>
													<th>申购金额</th>
													<th>支付类型</th>
													<th>应付金额</th>
													<th>应付日期</th>
													<th>所属部门</th>
													<th>理财经理</th>
													<th>到期日期</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mypayment"></tbody>
											
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
													<a href="javascript:fenpay()" aria-label="Previous">
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
									<!--查看-->
									<div class="modal fade" id="look_over" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">查看详细页</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
													<div class="row_tit">
														<b>用户信息</b>
													</div>
													<div class="row">
														<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>用户：</b>
															<span id="userName"></span>
														</div>
														<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="mobile_one"></span></div>
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="employeeName"></span></div>
														<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="organizationName"></span></div>
														
													</div>
													
													<div class="row margin">
														<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="bankName"></span></div>
														<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="bank_code"></span></div>
														
													</div>
													</div>
													<hr />
													<div style="margin-bottom: 15px;">
														<b class="row_tit1">产品信息</b>
													</div>
													<div class="row">
														<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>购买产品：</b><span id="productName"></span>
																											
														</div>
														<div class="col-xs-6 col-sm-4"><b>产品ID：</b><span id="productIdNum"></span></div>
														
														<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="type"></span></div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>申购日期：</b>
															<span id="createTime"></span>												
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>到期日期：</b>
															<span id="endTime"></span>																
														</div>
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>申购金额：</b>
															<span id="applyMoney"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>年化收益：</b>
															<span id="yield"></span>				
														</div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>本次期数：</b>
															<span id="applyTime"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>已还期数：</b>
															<span id="existingNum"></span>				
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>待还期数：</b>
															<span id="hlxuNum"></span>				
														</div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>本期还息：</b>
															<span id="incomeMoney"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>已还利息：</b>
															<span id="existing"></span>				
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>待还还息：</b>
															<span id="hlxu"></span>				
														</div>
														
													</div>
													
													</div>
												</form>
											</div>
											<div class="modal-footer" id="tail_print">
												
												<button type="button" class="btn btn-default" onclick="call_off()">确定</button>
												
												
											</div>
										</div>
									</div>
								</div>
							
								</div>
								
								
								<div class="modal fade" id="payqueren" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">付款</h4>
										</div>
										<div class="modal-body">
											确认已经给用户已经打款？
										</div>
										<div class="modal-footer" id="delpaycon">
											
											
										</div>
									</div>
								</div>
							</div>

							</div>
							<!--
                            	作者：784901633@qq.com
                            	时间：2017-09-27
                            	描述：产品管理
                            -->
							<div class="tab-pane fade " id="t-report">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<shiro:hasPermission name="/productdetail/addRecord">
													<a class="btn btn-default" role="button" onclick="recd()">添加记录</a>
													</shiro:hasPermission>
												</div>

											</div>

										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped" data-height="350">
											<thead>
												<tr>
													<th>序号</th>
													<th>标题</th>
													<th>添加日期</th>
													<th>添加人</th>
													<th>附件</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mytab1"></tbody>
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
													<a href="javascript:fenye()" aria-label="Previous">
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

								</div>
								<!--添加记录弹窗-->
								<div class="modal fade" id="record" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">添加产品报告记录</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" method="post" enctype="multipart/form-data"  id="form2" action="/product/insertProductManage">
													<div class="row">
														<span class="col-sm-2">标题</span>
														<input type="text" class="form-control" style="width: 60%;" name="title"/>
														<input type="hidden" name="employeeId" value="1" />
													</div>
													<input type="hidden" name="productId" value="${productId}" />
													<div class="row">

														<span class="col-sm-2">日期</span>
														<input type="text" class="form-control" style="width: 60%;"placeholder="当前日期" />
													</div>
													<div class="row">
														<span class="col-sm-2">添加人</span>
														<input type="text" class="form-control" style="width: 60%;" placeholder="当前用户（不可修改）" />
													</div>
													
													<div class="row">
														<span class="col-sm-2">附件：</span>
														<input id="fileupload1" type="file" name="file">
													</div>

													<div class="row">
														<p class="col-sm-12">说明</p>
														<div style="padding: 15px;">
														<textarea rows="10" cols="30" class="form-control" name="remark"></textarea>
													</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn " id="sub1">确定</button>
												<button type="button" class="btn " id="sub2">取消</button>
											</div>
										</div>
									</div>
								</div>
								<!--查看弹窗-->
								<div class="modal fade" id="check" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">查看/审批产品报告记录</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal">
													<div class="row">
														<div class="col-sm-12">
														<span class="marg">标题</span>
														<input type="text" class="form-cont" id="mtitle" readonly="" style="width:80%"/>
														</div>
													</div>
													<div class="row">
														<span class="col-sm-6">
														<span class="marg">日期</span>
														<input type="text" class="form-cont" placeholder="当前日期" readonly="" id="createtime" />
														</span>	
														<span class="col-sm-6">
														<span class="marg">添加人</span>
														<input type="text" class="form-cont" placeholder="当前用户（不可修改）" id="employeeId" readonly=""/>
														</span>
														
													</div>
													<div class="row">
														<span class="col-sm-2">附件：</span>
														<shiro:hasPermission name="/productdetail/management/download">
														<a href="#" class="col-sm-8" id="fileUrl"  target="_self">下载附件</a>
														</shiro:hasPermission>
													</div>

													<div class="row">
														<p class="col-sm-12">说明</p>
														<div style="padding: 15px;" >
														<textarea rows="10" cols="30" class="form-control" readonly="" id="remark"></textarea>
														</div>
													</div>

													<div class="row">
														<p class="col-sm-12">审批意见</p>
														<div style="padding: 15px;">
														<textarea rows="10" cols="30" class="form-control" readonly="" id="opinion"></textarea>
														</div>
													</div>
												</form>
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
	<script src="<%=product_host%>static/view/js/productdetail.js"></script>
	<script>
		var id = ${productId};

		$('#nav-tabs li a[href="#t-profit"]').click(function(e) {
			allfp(${productId});
		});

		$('#nav-tabs li a[href="#t-buylist"]').click(function(e) {

			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas, ${productId});
		});
		$('#nav-tabs li a[href="#t-report"]').click(function(e) {

			var clas = $('#ChangChart1 option:selected').attr('value');

			listload1(1, clas, ${productId});
		});
		
		$('#nav-tabs li a[href="#t-payment"]').click(function(e) {

			var clas = $('#ChangChart2 option:selected').attr('value');

			listload2(1, clas, ${productId});
		});


		function add() {

			$('#profit').modal('show')
			tcfs(${productId});
		}
		function gbtc(){
			$('#profit').modal('hide');
		}
		
		function xiugaisy(){
			$('#profit1').modal('show')
			syfsload(${productId});
			
		}
		function gbsy(){
			$('#profit1').modal('hide');
			
		}

	$("#sub").click(function () {
		var clas = $('#ChangChart option:selected').attr('value');
		    $("#form1").ajaxSubmit({
		    dataType: "json", //数据类型
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#buylist').modal('hide');
		         	listload(1, clas, ${productId});
		         }else{
		         	alert(data.msg);
		         	
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
		         	$('#record').modal('hide');
		         	listload1(1, clas, ${productId});
		         }else{
		         	alert(data.msg);
		         }
		    }
		    });
		});
		
		$("#sub2").click(function () {
			$('#record').modal('hide');
		 });
		
		function recd() {

			$('#record').modal('show')
		}
		$("#ChangChart2").change(function() {
			console.log('改变');
			var clas = $('#ChangChart2 option:selected').attr('value');

			listload2(1, clas, ${productId});

		});
		$("#ChangChart1").change(function() {
			console.log('改变');
			var clas = $('#ChangChart1 option:selected').attr('value');

			listload1(1, clas, ${productId});
		});
		$("#ChangChart").change(function() {
			console.log('改变');
			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas, ${productId});

		});
		loadxx(${productId});
//		var creareID=${creareID};
//		chancan(creareID);

function hqtime() {
	   var date = new Date();
    var seperator1 = "-";
   
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    console.log(currentdate);
    $('#pay_time').val(currentdate);
}
hqtime();
	function listload(page, rows,id) {
	
	$('#page').html('');
	$('#mytab').html('');
	$('#now').val(page);
	$.ajax({
		url: '/product/getAllProductOrder', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			"productId":id
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

				var html = '';

				if(allList[i].state == 1) {
					var state = '未审核';
						html += '<tr><td>' + allList[i].orderId + '</td><td scope="row">' + allList[i].name + '</td><td>' + allList[i].mobile_one + '</td><td>' + allList[i].createTime + '</td><td>' + allList[i].applyMoney + '</td><td>' + allList[i].paidMoney + '</td><td>' + allList[i].updateTime + '</td><td>' + allList[i].organization_name + '</td><td>' + allList[i].employee_name + '</td><td>' + allList[i].endTime + '</td><td>' + state + '</td><td><shiro:hasPermission name="/productdetail/apply/payment"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+','+allList[i].userId+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="lookcon('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';
				} else if(allList[i].state == 2) {
					var state = '已审核';
						html += '<tr><td>' + allList[i].orderId + '</td><td scope="row">' + allList[i].name + '</td><td>' + allList[i].mobile_one + '</td><td>' + allList[i].createTime + '</td><td>' + allList[i].applyMoney + '</td><td>' + allList[i].paidMoney + '</td><td>' + allList[i].updateTime + '</td><td>' + allList[i].organization_name + '</td><td>' + allList[i].employee_name + '</td><td>' + allList[i].endTime + '</td><td>' + state + '</td><td><shiro:hasPermission name="/productdetail/apply/payment"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+','+allList[i].userId+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="lookcon('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				} else if(allList[i].state == 3) {
					var state = '审核不通过';
						html += '<tr><td>' + allList[i].orderId + '</td><td scope="row">' + allList[i].name + '</td><td>' + allList[i].mobile_one + '</td><td>' + allList[i].createTime + '</td><td>' + allList[i].applyMoney + '</td><td>' + allList[i].paidMoney + '</td><td>' + allList[i].updateTime + '</td><td>' + allList[i].organization_name + '</td><td>' + allList[i].employee_name + '</td><td>' + allList[i].endTime + '</td><td>' + state + '</td><td><shiro:hasPermission name="/productdetail/apply/payment"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+','+allList[i].userId+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="lookcon('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				}else if(allList[i].state == 4) {
					var state = '付款完成';
						html += '<tr><td>' + allList[i].orderId + '</td><td scope="row">' + allList[i].name + '</td><td>' + allList[i].mobile_one + '</td><td>' + allList[i].createTime + '</td><td>' + allList[i].applyMoney + '</td><td>' + allList[i].paidMoney + '</td><td>' + allList[i].updateTime + '</td><td>' + allList[i].organization_name + '</td><td>' + allList[i].employee_name + '</td><td>' + allList[i].endTime + '</td><td>' + state + '</td><td><shiro:hasPermission name="/productdetail/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="lookcon('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				}else{
					var state = '';
						html += '<tr><td>' + allList[i].orderId + '</td><td scope="row">' + allList[i].name + '</td><td>' + allList[i].mobile_one + '</td><td>' + allList[i].createTime + '</td><td>' + allList[i].applyMoney + '</td><td>' + allList[i].paidMoney + '</td><td>' + allList[i].updateTime + '</td><td>' + allList[i].organization_name + '</td><td>' + allList[i].employee_name + '</td><td>' + allList[i].endTime + '</td><td>' + state + '</td><td><shiro:hasPermission name="/productdetail/apply/payment"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+','+allList[i].userId+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="lookcon('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';
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

var order='';
var userid='';
function append(orderId,index) {
	
	order=orderId;
	userid=index;
	
	$('#apend_tbody').html('');
	$.ajax({
			url: '/product/getPaymentRecordList', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'orderId':orderId,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			$('#append').modal('show')	
			console.log(data)
			var allList = data.obj;
			for(var i = 0; i < allList.length; i++) {
				var html = '';
				
				if(allList[i].state==2){
						
				html += '<tr><td class="col-sm-2">'+allList[i].money+'</td><td class="col-sm-2">'+allList[i].createTime+'</td><td class="col-sm-2">'+allList[i].createName+'</td><td class="col-sm-2">'+allList[i].endTime+'</td><td class="col-sm-1">'+allList[i].name+'</td><td class="col-sm-3"></td></tr>';
				}else{
				
				html += '<tr><td class="col-sm-2">'+allList[i].money+'</td><td class="col-sm-2">'+allList[i].createTime+'</td><td class="col-sm-2">'+allList[i].createName+'</td><td class="col-sm-2">'+allList[i].endTime+'</td><td class="col-sm-1">'+allList[i].name+'</td><td class="col-sm-3"><shiro:hasPermission name="/productdetail/confirmToParagraph"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="confirm('+allList[i].id+','+allList[i].orderId+')" style="margin-right: 5px;">确认到款</a></shiro:hasPermission><shiro:hasPermission name="/productdetail/delete"><a id = "btn_cle"class="btn btn1" href="#" role="button" data-toggle="modal" onclick="delfukj('+allList[i].id+')">删除</a></shiro:hasPermission></td></tr>';}
				$('#apend_tbody').append(html);
//				userid=allList[0].userId;
				
			}
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
}	
function listload2(page, rows,id) {
	
	$('#page2').html('');
	$('#mypayment').html('');
	$('#now2').val(page);
	$.ajax({
		url: '/product/getAllPaymentPrincipal', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			"productId":id
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {			
				if(allList[i].payingInterest == 1){
					var payingInterest='本息';
				}else if(allList[i].payingInterest == 2){
					var payingInterest='本金加本息';
				}else{
					var payingInterest='';
				}
				var html = '';
				if(allList[i].state == 0) {
					var state = '未付款';
					
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].applyMoney+'</td><td>'+payingInterest+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+allList[i].organizationName+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].endTime+'</td><td>'+state+'</td><td><shiro:hasPermission name="/productdetail/principal/payment"><button type="button" class="btn btn-default btn-sm" onclick="paysuccess('+allList[i].id+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/Principal/see"><button type="button" class="btn btn-default btn-sm" onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				} else if(allList[i].state ==1) {
					var state = '审核中';
					
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].applyMoney+'</td><td>'+payingInterest+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+allList[i].organizationName+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].endTime+'</td><td>'+state+'</td><td><shiro:hasPermission name="/productdetail/principal/payment"><button type="button" class="btn btn-default btn-sm" onclick="paysuccess('+allList[i].id+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/productdetail/Principal/see"><button type="button" class="btn btn-default btn-sm" onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';


				} else if(allList[i].state == 2) {
					var state = '已付款';
					
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].applyMoney+'</td><td>'+payingInterest+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+allList[i].organizationName+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].endTime+'</td><td>'+state+'</td><td><shiro:hasPermission name="/productdetail/Principal/see"><button type="button" class="btn btn-default btn-sm"onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';


				}
                 console.log(html);
				$('#mypayment').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess2" value="" /><li><a href="javascript:fenpay(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last2"><a href="javascript:fenpay(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page2').append(page);
			$('#pagess2').val(data.obj.total);
			pagess2();

		},
		error: function() {

		}
	});

}
function listload1(page, rows,id) {
	$('#page1').html('');
	$('#mytab1').html('');
	$('#now1').val(page);
	$.ajax({
		url: '/product/getAllProductManageByProductId', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			"productId":id
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

			

				if(allList[i].fileUrl =='' || allList[i].fileUrl ==null) {
					var fileUrl = '无';
				} else{
					var fileUrl = '有';

				}

				var html = '';

				html += '<tr><td>1</td><td>'+allList[i].title+'</td><td>'+allList[i].createTime+'</td><td>黄XX</td><td>'+fileUrl+'</td><td><shiro:hasPermission name="/productdetail/management/see"><button type="button" class="btn btn-default btn-sm" onclick="check('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				$('#mytab1').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess1" value="" /><li><a href="javascript:fen1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last1"><a href="javascript:fen1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page1').append(page);
			$('#pagess1').val(data.obj.total);
			pagess1();

		},
		error: function() {

		}
	});

}
	</script>

</html>