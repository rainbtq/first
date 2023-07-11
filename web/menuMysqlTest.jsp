<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%!
    String url=null;
    String username=null;
    String password=null;
    Connection conn=null;
    PreparedStatement preparedStatementone=null;
    PreparedStatement preparedStatementtwo=null;
    String sqlone=null;
    String sqltwo=null;
    String f_name=null;
    String f_price=null;
    String modify=null;
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      sqlone="select fname from tb_food where fname=?";
      sqltwo="update tb_food set fprice=? ,fdescribe=? where fname=?";
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
    f_name = request.getParameter("dish");
    f_price = request.getParameter("price");
    modify=request.getParameter("modify");
    preparedStatementone = conn.prepareStatement(sqlone);
    preparedStatementone.setString(1,f_name );
    if(preparedStatementone.execute()){
      preparedStatementtwo=conn.prepareStatement(sqltwo);
      preparedStatementtwo.setInt(1,Integer.parseInt(f_price));
      preparedStatementtwo.setString(3,f_name);
      preparedStatementtwo.setString(2,modify);
      preparedStatementtwo.executeUpdate();
      preparedStatementone.close();
      preparedStatementtwo.close();
      conn.close();
      out.print("修改成功");
    }else {
      out.print("菜品不存在");
    }
  }catch (Exception e){
    out.print("输入的菜品名称或价格不合法");
    //out.print(e);
    e.printStackTrace();
  }
%>
</body>
</html>
