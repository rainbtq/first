<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style >
    .photo{
      background: url("images/user.jpg");
      background-size:100%,100%;
    }
  </style><!-- 背景图片-->
  <style >
    body{text-align: center;}
    table{margin: auto;color: chartreuse}
  </style>
  <%!
    String url=null;
    String username=null;
    String password=null;
    Connection conn=null;
    ResultSet resultSet=null;
    Statement statement=null;
    PreparedStatement preparedStatement=null;
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      conn= DriverManager.getConnection(url,username,password);
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %>
</head>
<body class="photo">
<%
  try{
    statement = conn.createStatement();
    resultSet=statement.executeQuery("select * from tb_food ");
  }catch (Exception e){
    out.print(e);
    e.printStackTrace();
  }
%>
<table border="1"  >
  <tr>
    <th>名称</th>
    <th>价格</th>
    <th>历史销量</th>
    <th>介绍</th>
  </tr>
  <%
    try {
      while (resultSet.next()){
        out.print("<tr>");
        out.print("<td>"+resultSet.getString(1)+"</td>");
        out.print("<td>"+resultSet.getInt(2)+"</td>");
        out.print("<td>"+resultSet.getInt(3)+"</td>");
        out.print("<td>"+resultSet.getString(4)+"</td>");
      }
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %>
</table>
<br>
<form action="order.jsp" method="post">
  <input type="submit" value="点餐" style="color: crimson">
</form>

<form action="userComment.jsp" method="post">
<input type="submit" value="评论" style="color: crimson">
</form>

<form action="overlook_comment.jsp" method="post">
  <input type="submit" value="查看历史评论" style="color: crimson">
</form>

</body>
</html>
