<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
String ac;
String ps;
ResultSet resultSet=null;
%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3333/threeproject_mysql";
       String username="root";
       String password="123456";
       ac=request.getParameter("account");
       ps=request.getParameter("password");
       String sqlone="select * from tb_manager";
       Connection conn=DriverManager.getConnection(url,username,password);
       Statement std=conn.createStatement();
       resultSet=std.executeQuery(sqlone);
       int j = 0;
       while (resultSet.next()) {
           if (resultSet.getString("maccount").equals(ac)) {
               if (resultSet.getString("mpassword").equals(ps)){
                   j += 1;
                   response.sendRedirect("manager.html");
                   break;
               }else {
                   response.sendRedirect("Input.html");//跳转回原界面
                   break;
               }
           }
       }
       if(j==0){
           response.sendRedirect("Input.html");
       }
        std.close();
       conn.close();
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
%>
</body>
</html>



