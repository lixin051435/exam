<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="leftSide">
    <div class="sidebarSep"></div>
    <ul id="menu" class="nav">

        <c:if test="${sessionScope.session_admin != null}">
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
        <c:if test="${sessionScope.session_teacher != null}">
            <li class="tables"><a title="成绩管理" class="exp"><span>成绩管理</span><strong>2</strong></a>
                <ul class="sub">
                    <c:if test="${sessionScope.session_teacher.type == 1}">
                        <li><a href="${pageContext.request.contextPath}/apply/toList" title="第二课堂审批">第二课堂审批</a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/grade/toList" title="成绩管理">成绩管理</a></li>
                </ul>
            </li>
            <li class="tables"><a title="公告管理" class="exp"><span>公告管理</span><strong>2</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/notice/toAdd" title="新增公告">新增公告</a></li>
                    <li><a href="${pageContext.request.contextPath}/notice/toList" title="公告列表">公告列表</a></li>
                </ul>
            </li>
        </c:if>
        <c:if test="${sessionScope.session_student != null}">
            <li class="tables"><a title="成绩管理" class="exp"><span>学生模块</span><strong>4</strong></a>
                <ul class="sub">
                    <li><a href="${pageContext.request.contextPath}/apply/toAdd" title="第二课堂加分申请">第二课堂加分申请</a></li>
                    <li><a href="${pageContext.request.contextPath}/apply/myapply" title="我的加分申请">我的加分申请</a></li>
                    <li><a href="${pageContext.request.contextPath}/grade/toList" title="成绩查询">成绩查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/notice/toList" title="公告列表">公告列表</a></li>
                </ul>
            </li>
        </c:if>


    </ul>
</div>
