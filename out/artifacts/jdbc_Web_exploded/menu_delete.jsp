<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%!
    String url=null;
    String username=null;
    String password=null;
    Connection conn=null;
   PreparedStatement preparedStatement=null;
   PreparedStatement preparedStatementone=null;
    String sql;
    String name;
    String sqlone=name;
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      conn= DriverManager.getConnection(url,username,password);
      request.setCharacterEncoding("UTF8");//避免出现乱码
      name=request.getParameter("menuDelete");
      sql="delete  from tb_food where fname=?";
      sqlone="delete from tb_order where fname=?";
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %>
    <title>Title</title>
</head>
<body>
<%
    try {
      preparedStatementone=conn.prepareStatement(sqlone);
      preparedStatementone.setString(1,name);
      preparedStatementone.executeUpdate();
      preparedStatementone.close();
      preparedStatement=conn.prepareStatement(sql);
      preparedStatement.setString(1,name);
      preparedStatement.executeUpdate();
      preparedStatement.close();
      conn.close();
      out.print("删除成功");
    }catch (Exception e){
      out.print(e);
      out.print("没有该菜品哦");
      e.printStackTrace();
    }
%>
</body>
</html>
