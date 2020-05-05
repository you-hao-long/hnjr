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

		<title>客户管理</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		.modal-dialog{
			width: 80%;
		}
		#personal label,#myModal label {
			font-size:12px ;
			font-weight: 100;
			text-align: left;
		}
		#myModal b{
			font-size:16px ;
		}
		.form-group-sm .col-sm-3{
			padding-right: 0;
		}
		.form-group-sm .col-sm-2{
			padding-right: 0;
		}
		.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
		    border-top: none;
		}
		.table>thead>tr>th {
   			border-bottom:none;
   			
		}
		.form-group-sm .form-control {
		    padding: 5px;
		}
		.form-control{
			height: 30px;
  			padding: 3px;
		}
		.btn1 {
		    background: #eee;
		    padding: 3px 15px;
		    color: #000;
		    text-align: center;
		}
		
		.form-horizontal .form-group-sm .control-label {
		    width: 84px;
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
					<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">
							<form method="get" class="form-horizontal form-inline">
								<div class="row">
									<div class="col-md-2" style="width: 11%; padding-right: 0;">
										
											<shiro:hasPermission name="/customer/addClient">
												<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="add()">添加客户</a>
											</shiro:hasPermission>	
										
									</div>

									<div class="col-xs-5 padding">

										<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
										<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
									</div>

								</div>
								<div class="row totalbtn">
									<div class="col-xs-2">
										<div class="input-group">
											<span class="input-group-addon">用户姓名</span>
											<input type="text" class="form-control" name="title" value="" placeholder="用户姓名" id="total_name">
										</div>
									</div>
									<div class="col-md-2 padding">
										<div class="input-group">
											<span class="input-group-addon">手机号</span>
											<input type="text" class="form-control" name="title" value="" placeholder="手机号" id="total_phone">
										</div>
									</div>
									<div class="col-md-2 padding">
										<div class="input-group">
											<span class="input-group-addon">理财经理</span>
											<input type="text" class="form-control" name="title" value="" placeholder="理财经理" id="total_manager">
										</div>
									</div>
									<div class="col-md-2 padding">
										<div class="input-group">
											<span class="input-group-addon">状态</span>
											<input type="text" class="form-control" name="title" value="" placeholder="状态" id="total_state">
										</div>
									</div>
									<div class="clo-md-1 padding">
										<button type="button" class="btn btn-primary" onclick="query(1, clas)">查询</button>
									</div>

								</div>

							</form>

						</div>
						<div class="panel-body">
							
							<table class="table table-striped table-bordered table-hover" id="tableL02"></table>
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>联系电话</th>
										<th>类别</th>
										<th>业务员</th>
										<th>创建日期</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mytbody">
									<!--<tr>
										<td>100125</td>
										<td>张三</td>
										<td>男</td>
										<td>131****1234</td>
										<td>个人</td>
										<td>李四</td>
										<td>2018-08-23</td>
										<td>
											<div class="col-md-5">
											<shiro:hasPermission name="/customer/investmentRecord">
											<a class="btn btn-default btn-sm" onclick="investment()">投资记录</a>
											</shiro:hasPermission>
											</div>
											<div class="col-md-5">
											<shiro:hasPermission name="/customer/personalDetails">
											<a class="btn btn-default btn-sm" onclick="personal()">个人详细信息</a>
											</shiro:hasPermission>
											</div>
										</td>
									</tr>-->
									

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
										<a href="javascript:fenye1()" aria-label="Previous">
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
					<!--添加客户弹窗-->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="chongz()"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">添加客户</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal">
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">姓名</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="addname" placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">性别</label>
														<div class="col-sm-6">
															<!--<input class="form-control" type="text" id="sex"  placeholder="必填">-->
															<select class="form-control" id="sex">
																<option value="0">男</option>
																<option value="1">女</option>
																<option value="2">不明</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">证件类型</label>
														<div class="col-sm-6">
															<select id="idtype" class="form-control">
																<option value="0">身份证</option>
																<option value="1">护照</option>
																<option value="2">港澳通行证</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">证件号码</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="idcode"  placeholder="必填">
															
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">省</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="province"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">市</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="city"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group form-group-sm">
														<label class="col-sm-2 control-label" for="formGroupInputSmall">详细地址</label>
														<div class="col-sm-8" >
															<input class="form-control" type="text" id="address"  placeholder="必填">
														</div>
													</div>
												</div>
												
											</div>
											
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">邮箱</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="email"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">QQ</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="qq"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">微信</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="weixin"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">手机1</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="mobileone"  placeholder="选填">
														</div>
													</div>
												</div>
												
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall" >手机2</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="mobiletwo" placeholder="选填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall" >座机号</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="phone" placeholder="选填">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label  class="col-sm-3 control-label" for="formGroupInputSmall">客户类别</label>
														<div class="col-sm-6">
															<select id="usertype" class="form-control">
																<option value="0">个人</option>
																<option value="1">机构</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label  class="col-sm-3 control-label" for="formGroupInputSmall">开户行</label>
														<div class="col-sm-6" style="display: inline-block;">
															<select id="bankdeposit" class="form-control" >
																<option value="1">光大银行</option>
																<option value="2">兴业银行</option>
																<option value="3">广发银行</option>
																<option value="4">浦发银行</option>
																<option value="5">建设银行</option>
																<option value="6">杭州银行</option>
																<option value="7">重庆银行</option>
																<option value="8">宁波银行</option>
																<option value="9">平安银行</option>
																<option value="10">工商银行</option>
																<option value="11">交通银行</option>
																<option value="12">招商银行</option>
																<option value="13">中国银行</option>
																<option value="14">莱商银行</option>
																<option value="15">上海银行</option>
																<option value="16">江苏银行</option>
																<option value="17">华夏银行</option>
																<option value="18">中信银行</option>
																<option value="19">民生银行</option>
																<option value="20">中国邮政储蓄银行</option>
																<option value="21">广州银行</option>
																<option value="22">北京银行</option>
																<option value="23">临商银行</option>
																<option value="24">农业银行</option>
																</select>
														</div>
														
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">开户名</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="bankname"  placeholder="必填">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group form-group-sm">
														<label class="col-sm-2 control-label" for="formGroupInputSmall">银行账号</label>
														<div class="col-sm-8" >
															<input class="form-control" type="text" id="bankcode" placeholder="必填">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">推荐人</label>
														<div class="col-sm-6" style="display: inline-block;">
															<input class="form-control" type="text" id="refereeid" placeholder="必填"  disabled="">
															<input type="hidden" id="refeid" />
														</div>
														<button type="button" class="btn btn1" onclick="xzcon()">添加</button>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">推荐人部门</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="department" placeholder="必填" disabled="">
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group form-group-sm">
														<label class="col-sm-2 control-label" for="formGroupInputSmall">备注</label>
														<div class="col-sm-8">
															<input class="form-control" type="text" id="remarks" placeholder="必填">
														</div>
													</div>
												</div>
											</div>
											<button style="display: none;" type="reset" class="reset">重置</button>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn" onclick="addUser()">确认添加</button>
										<button type="button" class="btn" onclick="addcancel()">取消</button>
									</div>
								</div>
							</div>
						</div>
					<!--投资记录弹窗-->						
					<div class="modal fade" id="investment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document" style="width：60%">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">投资详情页</h4>
							</div>
							<div class="modal-body" style="height: 500px; overflow-y: scroll;">
							<form class="form-horizontal">
							<table class="table  table-bordered table-striped">
								<thead>
									<tr>
										<th>投资产品</th>
										<th>产品类型</th>
										<th>投资时间</th>
										<th>投资期限</th>
										<th>投资金额</th>
										<th>年化收益率</th>
										<th>推荐人</th>
									</tr>
								</thead>
								<tbody id="invastab">
									<tr>
										<td>汇能一号</td>
										<td>债券型</td>
										<td>2017-9-13</td>
										<td>A类-12个月</td>
										<td>2,000,000</td>
										<td>11.5%</td>
										<td>ZOE</td>
									</tr>
								</tbody>
							</table>
							</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn" onclick="invescancel()">关闭</button>
							</div>
						</div>
					</div>
				</div>
					<!--个人详细信息-->
					<div class="modal fade" id="personal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">客户详情页</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">姓名</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="pername">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">性别</label>
														<div class="col-sm-6">
															<!--<input class="form-control" type="text" id="persex">-->
															<select class="form-control" id="persex">
																<option value="0">男</option>
																<option value="1">女</option>
																<option value="2">不明</option>
															</select>
															
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">证件类型</label>
														<div class="col-sm-6">
															<select class="form-control"  id="perid_type">
																<option value="0">身份证</option>
																<option value="1">护照</option>
																<option value="2">港澳通行证</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">证件号码</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perid_code">
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">省</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perprovince">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">市</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="percity">
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-2 control-label" for="formGroupInputSmall">详细地址</label>
														<div class="col-sm-8" >
															<input class="form-control" type="text" id="peraddress">
														</div>
													</div>
												</div>
												
											</div>
											
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">邮箱</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="peremail">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">QQ</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perqq">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">微信</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perweixin">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">手机1</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="permobile_one">
														</div>
													</div>
												</div>
												
											</div>
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">手机2</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="permobile_two">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">座机号</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perphone">
														</div>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">客户类别</label>
														<div class="col-sm-6">
															
															<select class="form-control" id="peruser_types">
																<option value="0">个人</option>
																<option value="1">机构</option>
															</select>
															<input type="hidden" value="" id="peruser_types" />
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">开户行</label>
														<div class="col-sm-6" style="display: inline-block;">
															
															<select class="form-control" id="perdeposit">
																<option value="1">光大银行</option>
																<option value="2">兴业银行</option>
																<option value="3">广发银行</option>
																<option value="4">浦发银行</option>
																<option value="5">建设银行</option>
																<option value="6">杭州银行</option>
																<option value="7">重庆银行</option>
																<option value="8">宁波银行</option>
																<option value="9">平安银行</option>
																<option value="10">工商银行</option>
																<option value="11">交通银行</option>
																<option value="12">招商银行</option>
																<option value="13">中国银行</option>
																<option value="14">莱商银行</option>
																<option value="15">上海银行</option>
																<option value="16">江苏银行</option>
																<option value="17">华夏银行</option>
																<option value="18">中信银行</option>
																<option value="19">民生银行</option>
																<option value="20">中国邮政储蓄银行</option>
																<option value="21">广州银行</option>
																<option value="22">北京银行</option>
																<option value="23">临商银行</option>
																<option value="24">农业银行</option>
																</select>
														</div>
														
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">开户名</label>
														<div class="col-sm-6">
															<input class="form-control" type="text" id="perbank_name">
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">银行账号</label>
														<div class="col-sm-6" >
															<input class="form-control" type="text" id="perbank_code">
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">推荐人</label>
														<div class="col-sm-6" style="display: inline-block;">
															<input class="form-control" type="text" id="perid" readonly="">
															<input type="hidden" id="pid" />
														</div>
														<button type="button" class="btn btn1" onclick="mod()">修改</button>
													</div>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-3 control-label" for="formGroupInputSmall">推荐人部门</label>
														<div class="col-md-6 col-sm-6 col-xs-10">
															<input class="form-control" type="text" id="perdepartment" readonly="">
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-10">
													<div class="form-group form-group-sm">
														<label class="col-sm-2 control-label" for="formGroupInputSmall">备注</label>
														<div class="col-sm-8">
															<input class="form-control" type="text" id="perremarks">
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<shiro:hasPermission name="/customer/modifyCustomerDetails">
										<button type="button" class="btn " onclick="modify()">修改</button>
										</shiro:hasPermission>
										<button type="button" class="btn " onclick="percancel()">取消</button>
									</div>
								</div>
							</div>
						</div>
					<!--添加推荐人-->
					<div class="modal fade" id="sutup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目经理</h4>
									</div>
									<div class="modal-body" style="height: 500px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-3"><span class="col-xs-3" style="padding: 0 5px 0 0;">名称</span> <input class="form-control" style=" width: 70%;" /></span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 0 5px 0 0;">手机</span><input class="form-control" style=" width: 70%;" />
											
												</span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 0 5px 0 0;">部门</span> 
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
												<tbody id="addxmxz">
														
													
												</tbody>
											
											</table>

										</form>
									</div>
									
								</div>
							</div>
						</div>
				<!--修改推荐人-->
					<div class="modal fade" id="sutup1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目经理</h4>
									</div>
									<div class="modal-body" style="height: 500px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-3"><span class="col-xs-3" style="padding: 0 5px 0 0;">名称</span> <input class="form-control" style=" width: 70%;" /></span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 0 5px 0 0;">手机</span><input class="form-control" style=" width: 70%;" />
											
												</span>
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 0 5px 0 0;">部门</span> 
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
	</body>
	<script type="text/javascript" src="<%=product_host%>static/view/js/customer.js" ></script>
	<script>
		var clas = $('#ChangChart option:selected').attr('value');
		listload(1, clas);
		//初始化

var id = '';
console.log(id)
function listload(page, pagesize) {
	$('#page').html('');
	$('#mytbody').html('');
	$('#now').val(page);
	$.ajax({
		url: '/userInfo/getAllUser', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'page':page,
			'pagesize':pagesize,
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			console.log(data.obj)
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				
				var sex = '';
				if(allList[i].sex == "") {
					sex = '';
				} else if(allList[i].sex == 0) {
					sex = '男';
				} else if(allList[i].sex == 1) {
					sex = '女';
				} else if(allList[i].sex == 2) {
					sex = '不明';
				}
				if(!allList[i].mobile_one == "") {
					var mobile = allList[i].mobile_one;
				} else if(!allList[i].mobile_two == '') {
					var mobile = allList[i].mobile_two;
				} else if(!allList[i].regular_phone == ''){
					var mobile = allList[i].regular_phone;
				}
				
				if(allList[i].user_type == 0) {
					var user_type = '个人';
				} else if(allList[i].user_type == 1) {
					var user_type = '机构';
				}
				id = allList[i].id
				console.log(id)
				var html = '';
				html += '<tr><td>'+allList[i].id+'</td><td>'+allList[i].name+'</td><td>'+sex+'</td><td>'+mobile+'</td><td>'+user_type+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].create_date+'</td><td><shiro:hasPermission name="/customer/investmentRecord"><a class="btn btn-default btn-sm" onclick="investment(1, clas, '+allList[i].id+')">投资记录</a></shiro:hasPermission><shiro:hasPermission name="/customer/personalDetails"><a class="btn btn-default btn-sm" onclick="personal('+allList[i].id+')">个人详细信息</a></shiro:hasPermission></td></tr>';
				$('#mytbody').append(html);
			}
			
			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
$('#pagess').val(data.obj.total);
			pagess();
		},
		error: function() {
			console.log('请求失败')
		}
	});
}
 function chongz(){
	 $('.reset').trigger('click');
}
		
		
	</script>
	
	