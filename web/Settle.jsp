<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .color{color: crimson}
    </style>
    <%!
        String deskone;
        String sqltwo;
        String url;
        String username;
        String password;
        Connection conn;
        ResultSet resultSet1=null;
    %>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
         url="jdbc:mysql://localhost:3333/threeproject_mysql";
         username="root";
        password="123456";
        deskone=request.getParameter("desk");
        //request.getRequestDispatcher("settleTest.jsp").forward(request,response);
      conn= DriverManager.getConnection(url,username,password);
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
    %>
</head>
<body>
<%
    try {
        sqltwo="select * from tb_desk where desk=";
        sqltwo+=deskone;
        Statement statement=conn.createStatement();
        resultSet1=statement.executeQuery(sqltwo);
        while (resultSet1.next()){
            out.print(resultSet1.getString(1)+"号桌一共消费"+resultSet1.getInt(2)+"元");
        }
        resultSet1.close();
        conn.close();
    }catch (Exception e){
        out.print("桌号错误");
        e.printStackTrace();
    }
%>
<form action="settleTest.jsp" method="post"><input class="color" type="submit" value="重置桌信息"><input type="text" hidden="hidden" value="<%=deskone%>"name="desktwo"></form>
</body>
</html>
