<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>备菜中！</title>
    <style>
        div {
            text-align: center;
        }
    </style>

    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>

    <%!
        ArrayList<String> name = new ArrayList<>();
        ArrayList<String> price = new ArrayList<>();
        ArrayList<String> message = new ArrayList<>();
        ArrayList<String> desk_all = new ArrayList<>();
        ArrayList<String> fname = new ArrayList<>();
        ArrayList<String> fchoose = new ArrayList<>();
        String urlone="jdbc:mysql://localhost:3333/threeproject_mysql";
        String passwordone="123456";
    %>

</head>
<body>

<%
    //request.setCharacterEncoding("UTF8");
    int i=0; //菜品类数
    try {
        Class.forName("com.mysql.jdbc.Driver");

        String url=urlone;
        String username = "root";
        String password = passwordone;

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "select * from tb_food";
        Statement stmt = conn.createStatement();
        ResultSet count = stmt.executeQuery(sql);
        while (count.next()){
            name.add(count.getString(1));
            price.add(count.getString(2));
            i+=1;
        }
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.print("连接失败！");
        e.printStackTrace();
    }

    int j=0;//桌号
    try {
        Class.forName("com.mysql.jdbc.Driver");

        String url=urlone;
        String username = "root";
        String password = passwordone;

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "select desk from tb_desk";
        Statement stmt = conn.createStatement();
        ResultSet count = stmt.executeQuery(sql);
        while (count.next()){
            desk_all.add(count.getString(1));
            j+=1;
        }
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.print("连接失败！");
        e.printStackTrace();
    }


    int compare_1 = Integer.parseInt(request.getParameter("desk"));

    int correct=0;
    while (j!=0){
        if(compare_1 == Integer.parseInt(desk_all.get(j-1))){
                correct=1;
                break;
        }
        j--;
    }
    if(correct==0){
        out.print("亲！桌号不存在，请您返回点菜界面，重新填写！");
    }
    else{
        out.print("我们正在精心准备！");
        int k=0;
        int count_all=0;//消费金额
        while(k!= i){
            String ak = "num_" + k;
            count_all += Integer.parseInt(price.get(k))*Integer.parseInt(request.getParameter(ak));
            k++;
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url=urlone;
            String username = "root";
            String password = passwordone;

            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "UPDATE tb_desk SET tprice =?,  state = 1 where desk=?";
            //sql += "'"+count_all+"'"+","+"state = 1"+"where desk = ‘"+request.getParameter("desk")+"’";
            PreparedStatement preparedStatement=conn.prepareStatement(sql);
            preparedStatement.setInt(1,count_all);
            preparedStatement.setString(2, request.getParameter("desk"));
            preparedStatement.executeUpdate();
            preparedStatement.close();
            conn.close();
        } catch (Exception e) {
            out.print("连接失败！");
            out.print(e);
            e.printStackTrace();
        }
        k=0;
        int remember_1 = 0;
        while(k != i){
            String check_1 = "num_"+k;
            //String message_a = "remand_"+k;
            if(Integer.parseInt(request.getParameter(check_1))!=0){
                fname.add(name.get(k));
                fchoose.add(request.getParameter(check_1));
                message.add(request.getParameter("remand_"+k));
                remember_1 += 1;
            }
            k+=1;
        }
        //out.print(message);
        k=0;
            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url=urlone;
                String username = "root";
                String password = passwordone;

                Connection conn = DriverManager.getConnection(url, username, password);
                String sql = "insert into tb_order (fname,fchoose,desk,message) values (?,?,?,?)";
                PreparedStatement preparedStatement=conn.prepareStatement(sql);
                while(remember_1!=0){
                //String sql = "UPDATE tb_desk SET tprice =?,  state = 1 where desk=?";
                //sql += "'"+count_all+"'"+","+"state = 1"+"where desk = ‘"+request.getParameter("desk")+"’";
                    preparedStatement.setString(1,fname.get(k));
                    preparedStatement.setInt(2, Integer.parseInt(fchoose.get(k)));
                    preparedStatement.setInt(3, compare_1);
                    preparedStatement.setString(4, message.get(k));
                    preparedStatement.executeUpdate();
                    remember_1-=1;
                    k+=1;
                }
                    preparedStatement.close();
                conn.close();
            } catch (Exception e) {
                out.print("连接失败！");
                out.print(e);
                e.printStackTrace();
            }






    }



%>

<form action="order.jsp" method="post">
    <input type="submit" value="返回点菜">
</form>

</body>
</html>
