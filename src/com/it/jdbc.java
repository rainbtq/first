package com.it;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.sql.Timestamp;
public class jdbc {

    public static void main(String[] args) throws Exception {

            /*ArrayList<String> name = new ArrayList<>();

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1:3333/btq";
            String username = "root";
            String password = "123456";

            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "select name from emp where gender = '男'";
            Statement stmt = conn.createStatement();
            ResultSet count = stmt.executeQuery(sql);
            while (count.next()){
                System.out.println(count.getString(1));
                name.add(count.getString(1));
            }
            stmt.close();
            conn.close();
            System.out.println(name);
            System.out.println(name.get(0));

        }*/
        /*ArrayList<String> name = new ArrayList<>();
        ArrayList<String> price = new ArrayList<>();
        ArrayList<String> number = new ArrayList<>();
        ArrayList<String> describe = new ArrayList<>();
        ArrayList<String> desk_all = new ArrayList<>();
        int i = 0;
        int k = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1:3333/threeproject_mysql";
            String username = "root";
            String password = "123456";

            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "select desk from tb_desk";
            Statement stmt = conn.createStatement();
            ResultSet count = stmt.executeQuery(sql);
            while (count.next()) {
                desk_all.add(count.getString(1));
                k++;
            }

            String sql_1 = "select * from tb_food";
            Statement stmt_1 = conn.createStatement();
            ResultSet count_1 = stmt_1.executeQuery(sql_1);
            while (count_1.next()) {
                name.add(count.getString(1));
                price.add(count.getString(2));
                number.add(count.getString(3));
                describe.add(count.getString(4));
                i += 1;
            }
            stmt.close();
            conn.close();
            stmt_1.close();
        } catch (Exception e) {
            System.out.println("连接失败！");
            e.printStackTrace();
        }*/

        /*Date nowTime = new Date(System.currentTimeMillis());*/
        /*SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String retStrFormatNowDate = sdFormatter.format(nowTime);
        Date a = retStrFormatNowDate.;*/
    /*    java.text.SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH：mm:ss");
        Date nowTime = new Date(System.currentTimeMillis());
*/
  /*      long time=System.currentTimeMillis();
        Date date=new Date(time);
        System.out.println(date);*/
        /*Date date = new Date(System.currentTimeMillis());
        Time time = new Time(System.currentTimeMillis());*/
        /*Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Date date = new Date(timestamp.getTime());
        System.out.println(date);*/
        Class.forName("com.mysql.jdbc.Driver");

        String url = "jdbc:mysql://127.0.0.1:3333/bank_queue";
        String username = "root";
        String password = "123456";

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "select last_insert_id()";
        Statement stmt = conn.createStatement();
        ResultSet count = stmt.executeQuery(sql);
        if (count.next()) {
            System.out.println(count.getInt(1));
        }
        stmt.close();
        conn.close();
    }
}
