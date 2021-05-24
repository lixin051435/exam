<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎使用后台管理系统</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/spinner/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/charts/excanvas.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/charts/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/forms/uniform.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.cleditor.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.validationEngine-en.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.validationEngine.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.tagsinput.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/autogrowtextarea.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.maskedinput.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.dualListBox.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/jquery.inputlimiter.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/forms/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/wizard/jquery.form.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/wizard/jquery.validate.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/wizard/jquery.form.wizard.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/uploader/plupload.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/uploader/plupload.html5.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/uploader/plupload.html4.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/uploader/jquery.plupload.queue.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tables/datatable.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tables/tablesort.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/tables/resizable.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/ui/jquery.tipsy.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/ui/jquery.collapsible.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/ui/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/ui/jquery.progress.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/ui/jquery.timeentry.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/ui/jquery.colorpicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/ui/jquery.jgrowl.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/plugins/ui/jquery.breadcrumbs.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/ui/jquery.sourcerer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/calendar.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/elfinder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/selimage.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div id="rightSide">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
    <div class="wrapper">
        <form action="${pageContext.request.contextPath}/student/edit" name="myform" method="post" onsubmit="return true;"
              class="form">
            <div class="widget" style="width: 40%">
                <div class="title">
                    <img src="images/icons/dark/list.png" alt="" class="titleIcon"/>
                    <h6>新增学生信息</h6>
                </div>

                <div class="formRow" hidden="hidden">
                    <label>学生ID</label>
                    <div class="formRight">
                        <input type="text" name="id" class="mws-textinput" value="${student.id}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生账号</label>
                    <div class="formRight">
                        <input type="text" name="account" class="mws-textinput" value="${student.account}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生密码</label>
                    <div class="formRight">
                        <input type="text" name="password" class="mws-textinput" value="${student.password}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生姓名</label>
                    <div class="formRight">
                        <input type="text" name="name" class="mws-textinput" value="${student.name}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生性别</label>
                    <div class="formRight">
                        <select name="gender">
                            <option value="男" <c:if test='${"男" eq student.gender}'>selected</c:if> >男</option>
                            <option value="女" <c:if test='${"女" eq student.gender}'>selected</c:if> >女</option>
                        </select>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生电话</label>
                    <div class="formRight">
                        <input type="text" name="phone" class="mws-textinput" value="${student.phone}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formRow">
                    <label>学生地址</label>
                    <div class="formRight">
                        <input type="text" name="address" class="mws-textinput" value="${student.address}"/>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="formSubmit">
                    <input type="submit" id="sub" value="确认提交" class="redB"> &nbsp;&nbsp;&nbsp;&nbsp; <input
                        type="reset"
                        id="res" value="取消重置" class="redB">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="clear"></div>
</body>
</html>

