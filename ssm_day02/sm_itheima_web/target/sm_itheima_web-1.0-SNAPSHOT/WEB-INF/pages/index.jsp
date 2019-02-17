<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="${pageContext.request.contextPath}/text/javascript">
    </script>
</head>
<body>

    <%--<c:if test="${not empty administrator}">--%>
        <div>${sessionScope.user.name}:欢迎您</div>
 <%--   </c:if>--%>
   <%-- <c:if test="${empty administrator}">
        <div>
                <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
            </div>
    </c:if>--%>
<div align="center">

    <a
            href="${pageContext.request.contextPath}/user/findAll" style="text-decoration:none;font-size:33px">查询所有用户信息
    </a>
</div>
</body>
</html>