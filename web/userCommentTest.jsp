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
    String sqlone=null;
    String desk=null;
    String comment=null;
    long time=System.currentTimeMillis();
    Date date=new Date(time);
  %>
  <%
    try {
      Class.forName("com.mysql.jdbc.Driver");
      url="jdbc:mysql://localhost:3333/threeproject_mysql";
      username="root";
      password="123456";
      sqlone="insert into tb_comment (desk,date,comment) values(?,?,?)";
      conn= DriverManager.getConnection(url,username,password);
      request.setCharacterEncoding("UTF8");
      desk=request.getParameter("desk");
      comment=request.getParameter("textarea");
    }catch (Exception e){
      out.print(e);
      e.printStackTrace();
    }
  %>
</head>
<body>
<%try {
  preparedStatement = conn.prepareStatement(sqlone);
  preparedStatement.setString(1,desk);
  out.print(date);
  preparedStatement.setDate(2,date);
  preparedStatement.setString(3,comment);
  preparedStatement.executeUpdate();
  preparedStatement.close();
  conn.close();
  out.print("评论成功");
}catch (Exception e){
  out.print("输入不合理内容，评论失败");
e.printStackTrace();
}
%>
</body>
</html>
