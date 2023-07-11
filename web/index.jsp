<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Statement" %>

</head>
<body>
<%

    try {
        out.print("开始连接···");
        Class.forName("com.mysql.jdbc.Driver");

        String url = "jdbc:mysql://127.0.0.1:3333/threeproject_mysql";
        String username = "root";
        String password = "123456";

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "select * from tb_food";
        Statement stmt = conn.createStatement();
        ResultSet count = stmt.executeQuery(sql);
        while (count.next()){
            out.print(count.getString(1));
        }
        stmt.close();
        conn.close();
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    } catch (Exception e) {
        out.print("连接失败！");
        e.printStackTrace();
    }
    out.println("<form action= method=post, name=myform> <input name=add type=button value=增加> </form>");

%>
</body>
</html>
