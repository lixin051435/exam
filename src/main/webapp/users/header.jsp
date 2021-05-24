<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link href="themes/xecmoban_haier2015/style.css" rel="stylesheet" type="text/css" />


<div class="ng-toolbar">
	<div class="ng-toolbar-con block">
		<div class="ng-toolbar-left">&nbsp;</div>
		<div class="ng-toolbar-right">
			<div class="ng-bar-node reg-bar-node" id="reg-bar-node" style="display: block;">
				<c:if test="${sessionScope.userid != null }">
				你好 <b>${sessionScope.username }</b>
					<span><a style="color: #FF6766;" href="index/exit.action">[退出系统] </a> </span>
				</c:if>
			</div>
		</div>
	</div>
</div>
<div class="ng-header">
	<div class="ng-header-con block">
		<div class="ng-header-box">
			<a href="index.jsp" class="logo"> <img src="themes/xecmoban_haier2015/images/logo.png" />
			</a>
			<div class="ng-search">
				<div class="g-search">
					<form id="searchForm" name="searchForm" method="post" action="index/query.action">
						<div class="search-keyword-box">
							<input name="name" type="text" id="name" value="" class="search-keyword" />
						</div>
						<input type="submit" value="搜索" class="btn-search" style="cursor: pointer;" />
						<div class="clear"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="ng-nav-bar">
	<div class="block">
		<div class="ng-nav-index">
			<ul class="ng-nav">
				<li><a href="index.jsp" class="cur">首页</a></li>
				<li><a href="index/article.action" class="cur">网站公告</a></li>
				<li><a href="index/recommend.action" class="cur">推荐咖啡</a></li>				
				<li><a href="peihuo/getNetWork.action" class="cur">销售网络</a></li>
				<li><a href="index/all.action" class="cur">全部咖啡</a></li>
				<c:if test="${sessionScope.userid == null }">
				<li><a href="index/preLogin.action" class="cur">用户登录</a></li>
				</c:if>
				
				
				<li><a target="_blank" href="admin" class="cur">后台管理</a></li>
				<c:if test="${sessionScope.userid != null }">
				<li><a href="index/cart.action" class="cur">购物车</a></li>
				<li><a href="index/usercenter.action" class="cur">个人中心</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<div class="blank"></div>
<%
	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>