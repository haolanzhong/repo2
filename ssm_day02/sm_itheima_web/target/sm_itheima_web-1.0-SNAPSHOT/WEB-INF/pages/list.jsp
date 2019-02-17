<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="${pageContext.request.contextPath}/text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        /*单个删除*/
        function deleteUser(id) {  /*该方法不能写在页面加载事件内*/
            if (confirm("确认删除")) {
                location.href = "${pageContext.request.contextPath}/user/delUser?id=" + id;
            }
        }

        function checkAll(ck) {
            $(".cb").prop("checked", ck.checked);
        }

        /*复选框获取元素对象数据，复选框提交的数据到后台以数组形式呈现*/
        $(function () {
            document.getElementById("delSelected").onclick = function (ev) {
                var uid = document.getElementsByName("uid");
                var s = false;
                for (var i = 0; i < uid.length; i++) {
                    if (uid[i].checked) {
                        s = true;
                        break;
                    }
                }
                if (!s) {
                    alert("请选择需要删除的数据");
                    return;
                }
                if (confirm("确认删除")) {
                    document.getElementById("form").submit();
                }
            }
        })


    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>
</div>
    <div style="float: left;">

        <form class="form-inline" action="${pageContext.request.contextPath}/user/findAll" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name"  class="form-control" id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" name="address"  class="form-control"
                       id="exampleInputName3">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="text" name="email"  class="form-control"
                       id="exampleInputEmail2">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/pathName/add">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/user/delAll" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" onclick="checkAll(this)"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.list}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" class="cb" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/user/findUserById?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">删除</a>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/user/findPhoto?id=${user.id}">查看头像</a></td>


                </tr>
            </c:forEach>

        </table>
    </form>


    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <%--上一页--%>
                <li>
                    <a href="${pageContext.request.contextPath}/user/findAll?pageNum=1&name=${user1.name}&address=${user1.address}&email=${user1.email}" aria-label="Previous">
                        首页
                    </a>
                </li>
                <c:if test="${pb.pageNum!=1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pb.pageNum-1}&name=${user1.name}&address=${user1.address}&email=${user1.email}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <li><a href="${pageContext.request.contextPath}/user/findAll?pageNum=${i}&name=${user1.name}&address=${user1.address}&email=${user1.email}">${i}</a></li>
                </c:forEach>


                <%--下一页--%>
                <c:if test="${pb.pageNum!=pb.totalPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pb.pageNum+1}&name=${user1.name}&address=${user1.address}&email=${user1.email}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li>
                    <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pb.totalPage}&name=${user1.name}&address=${user1.address}&email=${user1.email}"
                       aria-label="Previous">
                        尾页
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                共${pb.totalCount}条记录，共${pb.totalPage}页
            </span>
            </ul>
        </nav>
    </div>

</body>
</html>


