<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>更改信息</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="dist/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        #add{
            width: 20%;
        }
    </style>
    <script>

    </script>
</head>
<body>
    <div align="center">
        <div id="add">
            <div align="center">
                <h1>更改信息</h1>
            </div>
                <br><br>
            <form method="post" action="${pageContext.request.contextPath}/updateServlet" id="myform">
                <div class="input-group" align="center">
                    <span class="input-group-addon" >编号</span>
                    <input type="text" class="form-control" aria-describedby="sizing-addon2" name="id" value="${user.id}" placeholder="${user.id}" readonly>
                </div>
                <br>
                <div class="input-group" align="center">
                    <span class="input-group-addon" >姓名</span>
                    <input type="text" class="form-control" aria-describedby="sizing-addon2" name="name" value="${user.name}" placeholder="${user.name}">
                </div>
                <br>

                <div class="form-group" align="left">

                    <c:if test="${user.sex=='男'}">
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="男" checked>男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="女">女
                        </label>
                    </c:if>
                    <c:if test="${user.sex=='女'}">
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="男" >男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" value="女" checked>女
                        </label>
                    </c:if>
                </div>

                <br>

                <div class="input-group" align="center">
                    <span class="input-group-addon" >QQ</span>
                    <input type="text" class="form-control" aria-describedby="sizing-addon2" name="qq" value="${user.qq}" placeholder="${user.qq}">
                </div>
                <br>
                <div class="input-group" align="center">
                    <span class="input-group-addon" id="sizing-addon2">地址</span>
                    <input type="text" class="form-control" aria-describedby="sizing-addon2" name="address" value="${user.address}" placeholder="${user.address}">
                </div>
                <br>
                <div>

                    <input type="submit" class="btn btn-primary" value="提交">
                    <input type="reset" class="btn btn-primary" value="重置" >

                    <a href="${pageContext.request.contextPath}/userListServlet">
                        <input type="button" class="btn btn-primary" value="返回">
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
