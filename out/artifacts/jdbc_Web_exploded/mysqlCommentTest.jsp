<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%!
    String url=null;
    String username=null;
    String password=null;
    Connection conn=null;
    PreparedStatement preparedStatement=null;
    String comment=null;
    String id=null;
    String sql=null;
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      conn= DriverManager.getConnection(url,username,password);
      request.setCharacterEncoding("UTF8");
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %>
</head>
<body>
<%
  try {
    id = request.getParameter("text");
    comment = request.getParameter("textare");
    sql = "update tb_comment set reply=? where id=?";
    preparedStatement = conn.prepareStatement(sql);
    preparedStatement.setString(1, comment);
    preparedStatement.setInt(2, Integer.parseInt(id));
    preparedStatement.executeUpdate();
    preparedStatement.close();
    conn.close();
    out.print("回复成功");
  }catch (Exception e){
    out.print("id不符合要求");
    e.printStackTrace();
  }
%>
</body>
</html>
