<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			修改密码
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox">
						<jsp:include page="usermenu.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>


		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix"
						style="_height: 1%;">

						<h5>
							<span>修改密码</span>
						</h5>
						<div class="blank"></div>
						<form action="index/editpwd.action" name="myform" method="post" onsubmit="return check()">
							<table width="100%" border="0" cellpadding="5" cellspacing="1"
								bgcolor="#dddddd">
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
										${sessionScope.users.username } <input type="hidden"
										name="username" style="width: 160px" id="username"
										value="${sessionScope.users.username }" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">原密码：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input
										name="password" type="password" size="25" class="inputBg" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">新密码：</td>
									<td align="left" bgcolor="#FFFFFF"><input
										name="newpassword" id="newpassword" type="password" size="25" class="inputBg" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">确认密码：</td>
									<td align="left" bgcolor="#FFFFFF"><input
										name="repassword" id="repassword" type="password" size="25" class="inputBg" />
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input
										type="submit" class="bnt_blue_1" style="border: none;margin-left:-230px"
										value="确认修改" /></td>
								</tr>
							</table>
						</form>

					</div>
				</div>
			</div>
		</div>
<script>
		 function check()
		 {   
			 var newpassword = document.getElementById("newpassword").value;
			 var repassword = document.getElementById("repassword").value;
			 if(newpassword == ""){
				 alert("请输入原密码！");
				 return false;
			 }
			 if(repassword == ""){
				 alert("请输入新密码！");
				 return false;
			 } 
			 if(repassword != newpassword){
				 alert("两次密码不对！");
				 return false;
			 } 
			 
			 return true;
		 }
		</script>
	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
