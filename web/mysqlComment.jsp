<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .photo{
            background: url("images/comment.jpeg");
            background-size:100%,100%;
        }
    </style>
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
        resultSet=statement.executeQuery("select * from tb_comment ");
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
%>
<table border="1">
    <tr>
        <th>id</th>
        <th>桌号</th>
        <th>日期</th>
        <th>评论</th>
        <th>回复</th>
    </tr>
    <%
        try {
            while (resultSet.next()){
                out.print("<tr>");
                out.print("<td>"+resultSet.getInt(1)+"</td>");
                out.print("<td>"+resultSet.getString(2)+"</td>");
                out.print("<td>"+resultSet.getDate(3)+"</td>");
                out.print("<td>"+resultSet.getString(4)+"</td>");
                out.print("<td>"+resultSet.getString(5)+"</td>");
            }
        }catch (Exception e){
            out.print(e);
            e.printStackTrace();
        }
    %>
</table>
<br>
<form method="post" action="mysqlCommentTest.jsp">
    <table>
        <tr><td>id</td><td><input type="text" name="text"></td></tr>
        <tr><td>回复</td><td><textarea rows="10" cols="10" name="textare"></textarea></td></tr>
        <tr><td colspan="2" align="center"><input type="submit" value="提交"></td></tr>
    </table>

</form>
</body>
</html>
