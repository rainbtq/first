<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

  <style >
    .photo{
      background: url("images/userorder.jpeg");
      background-size:100%,100%;
    }
  </style><!-- 背景图片-->
  <style >
    body{text-align: center;}
    table{margin: auto;color: aqua}
  </style><!--设置表格的位置和字体颜色-->
  <%!
    ArrayList<String> name = new ArrayList<>();
    ArrayList<String> price = new ArrayList<>();
    ArrayList<String> number = new ArrayList<>();
    ArrayList<String> describe = new ArrayList<>();
  %>


  <%@ page import="java.sql.Connection" %>
  <%@ page import="java.sql.DriverManager" %>
  <%@ page import="java.sql.ResultSet" %>
  <%@ page import="java.sql.Statement" %>
  <%@ page import="java.util.*" %>


</head>
<body class="photo">


<%
  int i=0;

  try {
    Class.forName("com.mysql.jdbc.Driver");

    String url="jdbc:mysql://127.0.0.1:3333/threeproject_mysql";
    String username = "root";
    String password = "123456";

    Connection conn = DriverManager.getConnection(url, username, password);

    String sql = "select * from tb_food";
    Statement stmt = conn.createStatement();
    ResultSet count = stmt.executeQuery(sql);
    while (count.next()){
      name.add(count.getString(1));
      price.add(count.getString(2));
      number.add(count.getString(3));
      describe.add(count.getString(4));
      i+=1;
    }
    stmt.close();
    conn.close();
  } catch (Exception e) {
    out.print("连接失败！");
    e.printStackTrace();
    out.print(e);
  }


  String html_1 = "<form action=order_deal.jsp method=post, name=myform, align=center>";
  html_1 += "<table align=center >";
  int j=0;
  html_1 += "<tr> <th>菜品名称</th> <th>价格</th> <th>历史销量</th> <th>描述</th>  <th>数量</th> <th>备注</th> </tr>";
  while(j<i){
    html_1 += "<tr> <td>";
    html_1 += name.get(j);
    html_1 += "</td> <td>";
    html_1 += price.get(j);
    html_1 += "</td> <td>";
    html_1 += number.get(j);
    html_1 += "</td> <td>";
    html_1 += describe.get(j);
    html_1 += "</td> <td>";
    html_1 += "<input name=num_" + j + " type=text>";
    html_1 += "</td> <td>";
    html_1 += "<input name=remand_" + j + " type=text>";
    html_1 += "</td>";
    html_1 += "</tr>";
    j+=1;
  }
  html_1 += "<tr> <td colspan=3> 桌号 </td> <td colspan=2> <input name=desk type=text> </td> </tr>";
  html_1 += "<tr> <td colspan=5> <input type=submit value=确定> </td> </tr>";
  html_1 += "</table>";
  html_1 += "</form>";

  out.println(html_1);
%>
</body>
</html>
