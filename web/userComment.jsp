
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style >
    .photo{
      background: url("images/usercomment.jpeg");
      background-size:100%,100%;
    }
  </style><!-- 背景图片-->
  <style >
    body{text-align: center;}
    table{margin: auto;height: 100px}
  </style>
</head>
<body class="photo">
<form action="userCommentTest.jsp" method="post">
  <table><tr><td style="color: crimson">桌号</td><td><input type="text" name="desk"></td></tr>
    <tr><td style="color: crimson">评论</td><td><textarea name="textarea"></textarea></td></tr>
    <tr><td align="center" colspan="2"><input type="submit" value="提交评论"></td></tr>
  </table>
</form>
</body>
</html>
