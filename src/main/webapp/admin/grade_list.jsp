<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript" src="js/plugins/spinner/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/plugins/charts/excanvas.min.js"></script>
    <script type="text/javascript" src="js/plugins/charts/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="js/plugins/forms/uniform.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.cleditor.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="js/plugins/forms/autogrowtextarea.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.maskedinput.min.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.dualListBox.js"></script>
    <script type="text/javascript" src="js/plugins/forms/jquery.inputlimiter.min.js"></script>
    <script type="text/javascript" src="js/plugins/forms/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="js/plugins/wizard/jquery.form.js"></script>
    <script type="text/javascript" src="js/plugins/wizard/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/plugins/wizard/jquery.form.wizard.js"></script>
    <script type="text/javascript" src="js/plugins/uploader/plupload.js"></script>
    <script type="text/javascript" src="js/plugins/uploader/plupload.html5.js"></script>
    <script type="text/javascript" src="js/plugins/uploader/plupload.html4.js"></script>
    <script type="text/javascript" src="js/plugins/uploader/jquery.plupload.queue.js"></script>
    <script type="text/javascript" src="js/plugins/tables/datatable.js"></script>
    <script type="text/javascript" src="js/plugins/tables/tablesort.min.js"></script>
    <script type="text/javascript" src="js/plugins/tables/resizable.min.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.tipsy.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.collapsible.min.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.progress.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.timeentry.min.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.colorpicker.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.jgrowl.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.breadcrumbs.js"></script>
    <script type="text/javascript" src="js/plugins/ui/jquery.sourcerer.js"></script>
    <script type="text/javascript" src="js/plugins/calendar.min.js"></script>
    <script type="text/javascript" src="js/plugins/elfinder.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/admin.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
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
        <div class="widget">
            <div class="title">
                <img src="images/icons/dark/frames.png" alt="" class="titleIcon"/>
                <h6>成绩列表</h6>
            </div>
            <table cellpadding="0" cellspacing="0" width="100%" class="sTable">
                <thead>
                <tr>
                    <td>学生编号</td>
                    <td>学生账号</td>
                    <td>学生姓名</td>
                    <c:forEach items="${courses}" var="course">
                        <td>${course.name}</td>
                    </c:forEach>
                    <td>第一课堂总分</td>
                    <td>第二课堂总分</td>
                    <td>综合测评总分</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${studentGradeVOS}" var="item">
                    <tr align="center">
                        <td>${item.student.id}</td>
                        <td>${item.student.account}</td>
                        <td>${item.student.name}</td>
                        <c:forEach items="${item.grades}" var="grade">
                            <td>${grade.grade}</td>
                        </c:forEach>
                        <td>${item.grade1}</td>
                        <td>${item.grade2}</td>
                        <td>${item.total}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/grade/getByStudentId?studentId=${item.student.id}">编辑</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="dataTables_wrapper">
                <div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
                    <form action="${pageContext.request.contextPath}/grade/order" name="myform" method="post">
                        <label>排序条件: <select name="orderType" style="width: 100%">
                            <c:forEach items="${courses}" var="course">
                                <option value="${course.id}">按${course.name}排序</option>
                            </c:forEach>
                            <option value="sum1">按第一课堂分数排序</option>
                            <option value="sum2">按第二课堂分数排序</option>
                            <option value="total">按综合测评分数排序</option>
                        </select>
                        </label>
                        <label><input type="submit" value="确定" class="mws-button green"/> </label>
                        <label><a href="${pageContext.request.contextPath}/grade/out">导出到文件</a> </label>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
</body>
</html>





















































