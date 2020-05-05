<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<ul id="main-nav" class="nav nav-sidebar" style="">
	<c:forEach items="${treelist }" var="r"  varStatus="status"> 
		<li>
			<c:if test="${not empty r.children}">
				<a href="#systemSetting${status.index}" class="nav-header collapsed" data-toggle="collapse">
			</c:if>

			<shiro:hasPermission name="${r.attributes}">
			<c:if test="${empty r.children}">
			<a href="${path}${r.attributes}" class="nav-header collapsed" >
			</c:if>

				<i class="${r.iconCls}"></i> ${r.text }
				<c:if test="${not empty r.children}">
					<span class="pull-right glyphicon glyphicon-chevron-down"></span>
				</c:if>
			</a>
			</shiro:hasPermission>

			<c:if test="${not empty r.children}">
				<ul id="systemSetting${status.index}" class="nav nav-list collapse secondmenu" style="height: 0px;">
					<c:forEach items="${r.children }" var="c">
					<li>
						<shiro:hasPermission name="${c.attributes}">
						<a href="${path}${c.attributes }"><i class="glyphicon glyphicon-asterisk"></i>${c.text }</a>
						</shiro:hasPermission>
					</li>
					</c:forEach>
				</ul>
			</c:if>
		</li>


		
	</c:forEach>
	<%--
	<li>
		<a href="../index.html">
			<i class="glyphicon glyphicon-th-large"></i> 首页
		</a>
	</li>
	<li>
		<a href="../product/productlist.html">
			<i class="glyphicon glyphicon-credit-card"></i> 产品管理
		</a>
	</li>
	<li>
		<a href="../project/projectlist.html">
			<i class="glyphicon glyphicon-folder-close"></i> 项目管理
		</a>
	</li>
	<li>
		<a href="customer.html"><i class="glyphicon glyphicon-user"></i> 客户管理</a>
	</li>
	<li>

		<li>
			<a href="#systemSetting1" class="nav-header collapsed" data-toggle="collapse">
				<i class="glyphicon glyphicon-floppy-disk"></i> 财务管理
				<span class="pull-right glyphicon glyphicon-chevron-down"></span>
			</a>
			<ul id="systemSetting1" class="nav nav-list collapse secondmenu" style="height: 0px;">
				<li>
					<a href="../assets/enterlist.html"><i class="glyphicon glyphicon-floppy-open"></i>入账管理</a>
				</li>
				<li>                                                   
					<a href="../assets/outlist.html"><i class="glyphicon glyphicon-floppy-save"></i>出账管理</a>
				</li>

			</ul>

		</li>

		<li>
			<a href="../totaldata.html"><i class="glyphicon glyphicon-list-alt"></i> 汇总数据</a>
		</li>
		<li>  
			<!--
            	作者：784901633@qq.com
            	时间：2017-09-22
            	描述：class="active"
            --> 
			<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
				<i class="glyphicon glyphicon-cog"></i> 系统管理
				<span class="pull-right glyphicon glyphicon-chevron-down"></span>
			</a>
			<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
				<li>
					<a href="#"><i class="glyphicon glyphicon-asterisk"></i>资源管理</a>
				</li>
				<li>
					<a href="#"><i class="glyphicon glyphicon-th-list"></i>角色管理</a>
				</li>
				<li>
					<a href="#"><i class="glyphicon  glyphicon-user "></i>用户管理</a>
				</li>
				<li>
					<a href="#"><i class="glyphicon glyphicon-edit"></i>部门管理</a>
				</li>

			</ul>
		</li>

		<!--<li>
								<a href="./grid.html">
									<i class="glyphicon glyphicon-globe"></i> 分发配置
									<span class="label label-warning pull-right">5</span>
								</a>
							</li>-->

		<li>
			<a href="#">
				<i class="glyphicon glyphicon-fire"></i> 关于系统
			</a>
		</li>--%>
</ul>