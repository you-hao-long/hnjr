<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid" style="padding-left: 0; padding-right: 0;">
				<div class="navbar-header col-md-2" style="padding-left: 10px; padding-right: 0;">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
					<a class="navbar-brand" href="#"><img src="<%=product_host%>static/view/images/logo.png" /></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right col-md-10">
						<li class="title">
							汇能金融办公系统<span>OA System</span>
						</li>
						<!--<li>
							<a href="#">退出</a>
						</li>
						<li>
							欢迎您，<span>黄志良</span>
						</li>

						<li class="renwu">
							今日已办：<span>15</span>件
						</li>
						<li class="renwu">
							今日待办：<span>10</span>件
						</li>-->
					</ul>

				</div>
			</div>
		</nav>

	