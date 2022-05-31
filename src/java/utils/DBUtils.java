/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Bao
 */
public class DBUtils {
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        java.sql.Connection conn=null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=FoodDB";
        conn=DriverManager.getConnection(url,"sa","Quanlmse150533@");
        return conn;
    }   
   public static void main(String[] args){
       try {
           System.out.println(DBUtils.getConnection());
       } catch (Exception e) {
       }
   }
}
