<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .photo{
            background: url("images/change.jpeg");
            background-size:100%,100%;
        }
    </style><!--设置背景图片-->
    <style >
        body{text-align: center;}
        table{margin: auto;color: black}
    </style><!--设置表格的位置和字体颜色-->
</head>
<body class="photo">
<form action="menuMysqlTest.jsp" method="post">
<table >
   <tr><td>菜品名称</td><td><input type="text" name="dish" id="dish1"></td></tr>
    <tr><td>修改后的价格</td><td><input type="text" name="price" id="price1"></td></tr>
    <tr><td >描述</td><td><textarea rows="5" cols="6" name="modify"></textarea></td></tr>
    <tr><td colspan="2" align="center"> <input type="submit" ></td></tr>
</table>
</form>
</body>
</html>
