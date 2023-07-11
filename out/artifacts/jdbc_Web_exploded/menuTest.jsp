<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table{color: crimson}
    </style>
    <style type="text/css">
        .photo{
            background: url("images/menu.jpeg");
            background-size:100%,100%;
        }
    </style>
    <style >
        body{text-align: center;}
        table{margin: auto;}
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
    <title>Title</title>
</head>
<body class="photo">
<%
    try{
      statement = conn.createStatement();
      resultSet=statement.executeQuery("select *from tb_food ");
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
%>
<table border="1"  >
    <tr>
        <th>名称</th>
        <th>价格</th>
        <th>历史销量</th>
        <th>介绍</th>
    </tr>
<%
    try {
        while (resultSet.next()){
        out.print("<tr>");
        out.print("<td>"+resultSet.getString(1)+"</td>");
        out.print("<td>"+resultSet.getInt(2)+"</td>");
        out.print("<td>"+resultSet.getInt(3)+"</td>");
        out.print("<td>"+resultSet.getString(4)+"</td>");
        }
    }catch (Exception e){
        out.print(e);
        e.printStackTrace();
    }
%>
</table>
<br>
<form action="menu_delete.jsp" method="post">
    <input type="text"name="menuDelete" >
    <input type="submit" value="删除菜品">
</form>
<br>
<form action="addMenu.jsp" method="post">
    <input type="submit" value="添加菜品">
</form>
<br>
<form action="menuModify.jsp" method="post">
    <input type="submit" value="修改菜单">
</form>
</body>
</html>
