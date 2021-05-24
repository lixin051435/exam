<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="leftSide">
    <div class="sidebarSep"></div>
    <ul id="menu" class="nav">

        <c:if test="${session_admin != null}">
            <li class="tables"><a title="课程管理" class="exp"><span>课程管理</span><strong>2</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/course/toAdd" title="新增课程">新增课程</a></li>
                    <li><a href="${pageContext.request.contextPath}/course/toList" title="课程列表">课程列表</a></li>
                </ul>
            </li>
            <li class="tables"><a title="老师管理" class="exp"><span>老师管理</span><strong>2</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/teacher/toAdd" title="新增老师">新增老师</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher/toList" title="老师列表">老师列表</a></li>
                </ul>
            </li>
            <li class="tables"><a title="学生管理" class="exp"><span>学生管理</span><strong>2</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/student/toAdd" title="新增学生">新增学生</a></li>
                    <li><a href="${pageContext.request.contextPath}/student/toList" title="学生列表">学生列表</a></li>
                </ul>
            </li>
        </c:if>
        <c:if test="${session_admin != null}">
            <li class="tables"><a title="成绩管理" class="exp"><span>成绩管理</span><strong>2</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/apply/toAdd" title="新增申请">新增申请</a></li>
                    <li><a href="${pageContext.request.contextPath}/apply/toList" title="处理申请">第二课堂审批</a></li>
                    <li><a href="${pageContext.request.contextPath}/grade/toList" title="课程列表">成绩管理</a></li>
                </ul>
            </li>
        </c:if>


    </ul>
</div>
