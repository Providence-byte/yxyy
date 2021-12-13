package com.jdbc.utils;

import java.sql.*;

public class JDBCUtils {
        private static String user;
        private static String password;

        static {
            user = "root";
            password = "123456";
        }

        public static Connection getConnection() {
            String url = "jdbc:mysql://localhost:3306/yxyy?" +
                    "useSSL=false&characterEncoding=UTF-8&serverTimezone=CST" +
                    "&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(url, user, password);
                return connection;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        public static void close(ResultSet resultSet, Statement statement, Connection connection) {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


}
