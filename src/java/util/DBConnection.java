/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Alif Danish
 * //Laketown
 */
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnection {
 public static Connection createConnection()
 {
     Connection con = null;
     String url = "jdbc:derby://localhost:1527/laketown; create=true"; //MySQL URL and followed by the database name
     String username = "app"; //MySQL username
     String password = "app"; //MySQL password   
     try 
     {
         try {
            Class.forName("com.apache.jdbc.Driver"); //loading mysql driver 
         } 
         catch (ClassNotFoundException e)
         {
            e.printStackTrace();
         } 
         con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
         System.out.println("Printing connection object "+con);
     } 
     catch (Exception e) 
     {
        e.printStackTrace();
     }
     return con; 
 }
}
