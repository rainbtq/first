<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%!
    String url=null;
    String username=null;
    String password=null;
    Connection conn=null;
    PreparedStatement preparedStatement=null;
    String sql=null;
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      sql="insert into tb_food(fname,fprice,fnumber,fdescribe) values(?,?,?,?)";
      conn= DriverManager.getConnection(url,username,password);
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %><!--连接数据库的基本操作-->
    <title>Title</title>
</head>
<body>
<%
try{
  preparedStatement=conn.prepareStatement(sql);
  request.setCharacterEncoding("UTF8");//处理request乱码问题
  preparedStatement.setString(1,request.getParameter("one"));
  preparedStatement.setInt(2,Integer.parseInt(request.getParameter("two")));
  preparedStatement.setInt(3,Integer.parseInt(request.getParameter("three")));
  preparedStatement.setString(4,request.getParameter("four"));
  preparedStatement.executeUpdate();
  preparedStatement.close();
  conn.close();
  out.print("添加成功");
}catch (Exception e){
  out.print("输入的菜品信息不合法");
  e.printStackTrace();
}
%>
</body>
</html>
