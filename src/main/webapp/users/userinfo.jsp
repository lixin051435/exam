<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			用户中心
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
					<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
						<h5>
							<span>个人资料</span>
						</h5>
						<div class="blank"></div>
						<form name="formEdit" action="index/personal.action" method="post" onsubmit="return check()">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">${sessionScope.users.username }<input type="hidden"
										name="username" style="width: 160px" id="username" value="${sessionScope.users.username }" /> <input
										type="hidden" name="password" style="width: 160px" id="password" value="${sessionScope.users.password }" /> <input
										type="hidden" name="usersid" style="width: 160px" id="usersid" value="${sessionScope.users.usersid }" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">姓名：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input name="realname" type="text" size="25"
										class="inputBg" id="realname" value="${sessionScope.users.realname }" /></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">性别：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><select name="sex" id="sex">
											<option value="男">男</option>
											<option value="女">女</option>
									</select></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">出生日期：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input name="birthday" type="text" size="25"
										class="inputBg" id="birthday" readonly="readonly" onclick="WdatePicker()"
										value="${sessionScope.users.birthday }" /></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">联系手机：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input name="contact" id="contact" type="text" size="25" class="inputBg"
										id="contact" value="${sessionScope.users.contact }" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" class="bnt_blue_1"
										style="border: none;margin-left:-230px" value="确认修改" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function isPhoneNumber(tel) {
		    var reg =/^0?1[3|4|5|6|7|8][0-9]\d{8}$/;
		    return reg.test(tel);
		}
		 function check()
		 {   
			 var contact = document.getElementById("contact").value;
			 if(!isPhoneNumber(contact)){
				 alert("手机格式不对！");
				 return false;
			 }
			 
			 return true;
		 }
		</script>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
