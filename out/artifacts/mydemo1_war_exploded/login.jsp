<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户登录</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="dist/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="dist/js/bootstrap.min.js"></script>

    <style>
        #msg{
            background-color: yellow;
        }
    </style>
    <script type="text/JavaScript" >
        function change() {
            var vc = document.getElementById('vcode');
            vc.src = "${pageContext.request.contextPath}/checkCodeServlet?time=" + new Date().getTime();  //加时间戳，防止浏览器利用缓存
        }
    </script>
</head>
<body>
<div width="50%" align="center">
    <br><br>
    <div>
        <h1 color="blue">用户登录</h1>
    </div>
    <br><br>
    <form class="form-inline" action="${pageContext.request.contextPath}/loginServlet" method="post">
        <table>
            <tr height="50">
                <td>
                    <div class="form-group">
                        <label for="Input1">用户名：</label>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                        <input type="text" class="form-control" id="Input1" name="username">
                    </div>
                </td>
            </tr>

            <tr height="50">
                <td>
                    <div class="form-group">
                        <label for="Input2">密 码：</label>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                        <input type="password" class="form-control" id="Input2" name="password">
                    </div>
                </td>
            </tr>
            <tr height="50">
                <td colspan="2">
                    <label for="Input3">验证码：</label>
                    <input type="text"  class="form-control" name="checkcode" id="Input3" size="4">
                    <img src="${pageContext.request.contextPath}/checkCodeServlet" id="vcode" onclick="change()"/>
                </td>
            </tr>
            <tr height="50">

                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-default" >登录</button>
                </td>
            </tr>
        </table>
    </form>
    <div>
        <span id="msg">
            ${msg}
        </span>

    </div>
</div>

</body>
</html>