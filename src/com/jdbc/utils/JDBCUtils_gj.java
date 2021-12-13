package com.jdbc.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JDBCUtils_gj {
    private static String user;//用户名
    private static String password;//密码
    private static String url;//url
    private static String driver;//驱动名
    //代码块初始化
    static {
        try {
            //方法1
            Properties properties= new Properties();
            properties.load(new FileInputStream("src\\mysql.properites"));
            //获取相关的值
            user =properties.getProperty("user");
            password =properties.getProperty("password");
            driver =properties.getProperty("driver");
            url =properties.getProperty("url");
            //方法2
//            String url = "jdbc:mysql://localhost:3306/shiyan8?" +
//                    "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
//            Properties properties = new Properties();
//            //存储用户账号密码
//            properties.setProperty("user","root");
//            properties.setProperty("password","root");
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(url,properties);
//            Statement stmt = conn.createStatement();

        } catch (IOException e) {
            //编译异常转运行异常
           throw new RuntimeException(e);
        }
    }

    public static Connection getConnection(){
        try {
            return DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void close(ResultSet set, Statement statement,Connection connection){
        //判空
        try {
            if(set!=null){
                set.close();
            }
            if(statement!=null){
                statement.close();
            }
            if(connection!=null){
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
