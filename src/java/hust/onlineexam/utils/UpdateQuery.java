/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import static hust.onlineexam.utils.MySQLConnUtils.getSQLServerConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hongn
 */
public class UpdateQuery {

    public static int updQuery(String query) throws ClassNotFoundException {
        Connection con;
        try {
            con = getSQLServerConnection();

            Statement st = null;

            try {
                st = con.createStatement();
            } catch (SQLException e) {
                System.out.println("ExecuteQuery.java [Error] SQL Exception");
                e.printStackTrace();
            } catch (NullPointerException e) {
                System.out.println("ExecuteQuery.java [Error] Null Pointer Exception");
                e.printStackTrace();
            }

            try {
                return st.executeUpdate(query);

            } catch (SQLException e) {
                System.out.println("ExecuteQuery.java [Error] SQL Exception");
                e.printStackTrace();
            } catch (NullPointerException e) {
                System.out.println("ExecuteQuery.java [Error] Null Pointer Exception");
                e.printStackTrace();
            }

        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
