/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import java.sql.*;

/**
 *
 * @author hongn
 */
public class MySQLConnUtils {

    public static Connection getSQLServerConnection()
            throws ClassNotFoundException, SQLException {
        // Note: Change the connection parameters accordingly.
        String driverName = "com.mysql.jdbc.Driver";
        String databaseName = "login_accounts";
        String connectionURL = "jdbc:mysql://localhost:3306/"+databaseName+"?characterEncoding=utf8";
        String url = "jdbc:mysql://localhost:3306/hustdb?autoReconnect=true&useSSL=false";
        String db_user = "root";
        String db_pass = "31101999";
        Class.forName(driverName);
        Connection conn = DriverManager.getConnection(url, db_user, db_pass);
        return conn;
    }

    
    
    public static void closeQuietly(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void rollbackQuietly(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
        }
    }
}
