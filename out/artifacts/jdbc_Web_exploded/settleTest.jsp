<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%!
        String deskone;
        String url;
        String username;
        String password;
        Connection conn;
    %>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            url="jdbc:mysql://localhost:3333/threeproject_mysql";
            username="root";
            password="123456";
            deskone=request.getParameter("desktwo");
            conn= DriverManager.getConnection(url,username,password);
        }catch (Exception e){
            out.print(e);
            e.printStackTrace();
        }
    %>
</head>
<body>
<%
    try{
        String sqlThree="update tb_desk set tprice=?,state=? where desk=?";
        PreparedStatement preparedStatement=conn.prepareStatement(sqlThree);
        preparedStatement.setInt(1,0);
        preparedStatement.setInt(2,0);
        preparedStatement.setString(3,deskone);
        preparedStatement.execute();
        sqlThree="delete from tb_order where desk = ?";
        preparedStatement=conn.prepareStatement(sqlThree);
        preparedStatement.setString(1,deskone);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        out.print("重置成功");
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
%>

</body>
</html>
