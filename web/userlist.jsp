<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户列表</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="dist/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        h1{
            color: #2aabd2;
            text-align: center;
        }
        td,th{
            text-align:center;
            vert-align: middle;
        }
    </style>

    <script type="text/javascript">
        function del(id) {
            if(confirm("确定要删除吗")){
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }
        function update(id) {
            location.href="${pageContext.request.contextPath}/findServlet?id=" + id;
        }

        window.onload=function () {
            document.getElementById("delete").onclick=function () {
                var flag=false;
                var cbs=document.getElementsByName("cb");
                for (var i = 0; i <cbs.length ; i++) {
                    if(cbs[i].checked){
                        flag=true;
                        break;
                    }
                }
                if(flag){
                    if (confirm("是否删除选中")) {
                        document.getElementById("form1").submit();
                    }
                }

            }

            document.getElementById("fcb").onclick=function () {
                var cbs=document.getElementsByName("cb");
                for (var i = 0; i <cbs.length ; i++) {
                    cbs[i].checked=this.checked;
                }
            }
        }




    </script>
</head>
<body>
    <div align="center">
        <div align="center" style="width:60% ">

            <div align="center">
                <h1>成员名单</h1>
            </div>
            <div style="float: left;margin: 8px">

                <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet">
                    <div class="form-group">
                        <label for="InputName1">姓名</label>
                        <input type="text" class="form-control" id="InputName1" name="name">
                    </div>
                    <div class="form-group">
                        <label for="InputName2">地址</label>
                        <input type="text" class="form-control" id="InputName2" name="address">
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
                </form>
            </div>
            <div style="float: right">
                <a href="${pageContext.request.contextPath}/adduser.jsp">
                    <button type="button" class="btn btn-primary" >添加联系人</button>
                </a>
                <a id="delete" >
                    <button type="button" class="btn btn-primary" >删除选中</button>
                </a>
            </div>
            <form action="${pageContext.request.contextPath}/delSelectedServlet" method="post" id="form1">
                <table width="100%" >


                <tr>
                    <td>
                        <table class="table table-hover table-dark" border="1" bordercolor="#A2B5CD">
                            <thead>
                            <tr class="success" height="50" >
                                <th ><input type="checkbox" id="fcb"></th>
                                <th scope="col">编号</th>
                                <th scope="col">名字</th>
                                <th scope="col">性别</th>
                                <th scope="col">QQ</th>
                                <th scope="col">地址</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>

                            <c:forEach items="${pb.list}" var="user">

                                <tbody>
                                <tr height="50" >
                                    <td><input type="checkbox" name="cb"  value="${user.id}"></td>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.sex}</td>
                                    <td>${user.qq}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <a href="javascript:update(${user.id})">
                                            <input type="button" value="修改">
                                        </a>
                                        <a href="javascript:del(${user.id})">
                                            <input type="button" value="删除">
                                        </a>
                                    </td>
                                </tr>

                                </tbody>
                            </c:forEach>
<%--                            <tr height="55">--%>
<%--                                <td colspan="7" align="center"><input type="button" value="添加联系人"> </td>--%>
<%--                            </tr>--%>


                        </table>
                    </td>
                </tr>
            </table>
            </form>
            <div align="left">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pb.currentPage == 1}">
                            <li class="disabled">
                        </c:if>
                        <c:if test="${pb.currentPage != 1}">
                            <li>
                        </c:if>

                            <a href="${pageContext.request.contextPath}/findUserByPageServlet?current=${pb.currentPage -1}&rows=5" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach begin="1" end="${pb.totalPage}" var="i">

                            <c:if test="${pb.currentPage == i}">
                                <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?current=${i}&rows=5">${i}</a></li>
                            </c:if>

                            <c:if test="${pb.currentPage != i}">
                                <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?current=${i}&rows=5">${i}</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${pb.currentPage == pb.totalPage}">
                            <li class="disabled">
                        </c:if>
                        <c:if test="${pb.currentPage != pb.totalPage}">
                            <li >
                        </c:if>
                                <c:if test="${pb.currentPage + 1 > pb.totalPage}">
                                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?current=${pb.currentPage}&rows=5" aria-label="Next">
                                </c:if>
                                <c:if test="${pb.currentPage + 1 <= pb.totalPage}">
                                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?current=${pb.currentPage + 1}&rows=5" aria-label="Next">
                                </c:if>
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <span style="font-size: 20px; margin: 5px">
                            共${pb.totalPage}页，共${pb.totalCount}条
                        </span>
                    </ul>
                </nav>
            </div>
        </div>
    </div>



</body>
</html>