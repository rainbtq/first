
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style >
    .photo{
      background: url("images/addmenu.jpg");
      background-size:100%,100%;
    }
  </style><!--使用css设置背景图片-->
  <style >
    body{text-align: center;}
    table{margin: auto;color: aqua}
  </style><!--css设置表格布局-->
</head>
<body class="photo">
<form action="addMenuTest.jsp" method="post">
<table>
  <tr><td>菜品名称</td><td><input type="text" name="one" id="t1"></td></tr>
  <tr><td>价格</td><td><input type="text" name="two" id="t2"></td></tr>
  <tr><td>月销量</td><td><input type="text" name="three" id="t3"></td></tr>
  <tr ><td>简介</td><td><textarea rows="3" cols="5" name="four" id="t4"></textarea></td></tr>
  <tr><td colspan="2" align="center"><input type="submit" value="提交" ></td></tr>
</table>
</form><!--设置表单-->
</body>
</html>
