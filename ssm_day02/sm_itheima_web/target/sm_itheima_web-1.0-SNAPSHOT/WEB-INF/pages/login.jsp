<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
    <%-- <script>
         function refreshCode() {
             var id = document.getElementById("vcode");
             id.src="${pageContext.request.contextPath}/checkCode?time="+new Date().getTime();
         }
     </script>--%>

</head>
<body>
<%
    String username = "";
    String password = "";
    String checked = "";
    Cookie[] cookies = request.getCookies();
    if(cookies!=null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                username = cookie.getValue();
                checked = "checked";
            }
            if ("password".equals(cookie.getName())) {
                password = cookie.getValue();
            }
        }
    }
    /*在java代码中，可以将数据存在request中，在jsp页面中从requestscope中取*/
    /*request.setAttribute("name",username);
     request.setAttribute("pwd",password);
      request.setAttribute("ck",checked);*/
%>

<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">管理员登录</h3>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="form-group">
            <label for="user">用户名：</label>
            <input type="text" name="username" value="<%=username%>" class="form-control" id="user"
                   placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" name="password" class="form-control" value="<%=password%>" id="password"
                   placeholder="请输入密码"/>
        </div>

        <div class="container" style="width: 400px; text-align: right;">
            <input type="checkbox" id="ck" name="ck" <%=checked%>>记住我
        </div>

        <%-- <div class="form-inline">
           <label for="vcode">验证码：</label>
           <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
           <a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath}/checkCode" title="看不清点击刷新" id="vcode"/></a>
         </div>--%>
        <hr/>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit" value="登录">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span>&times;</span></button>
        <strong></strong>
    </div>
</div>
</body>
</html>