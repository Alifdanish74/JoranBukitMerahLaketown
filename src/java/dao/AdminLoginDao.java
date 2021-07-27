/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import bean.AdminLoginBean;
import util.DBConnection;
/**
 *
 * @author Alif Danish
 */
public class AdminLoginDao {
    public String authenticateUser(AdminLoginBean adminloginBean)
     {
         String userName = adminloginBean.getAdminname(); //Assign user entered values to temporary variables.
         String password = adminloginBean.getAdminpassword();
 
         Connection con = null;
         Statement statement = null;
         ResultSet resultSet = null;
 
         String userNameDB = "";
         String passwordDB = "";
 
        try{
             con = DBConnection.createConnection(); //Fetch database connection object
             statement = con.createStatement(); //Statement is used to write queries. Read more about it.
             resultSet = statement.executeQuery("select name,password from admin"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(resultSet.next()) // Until next row is present otherwise it return false
             {
              userNameDB = resultSet.getString("name"); //fetch the values present in database
              passwordDB = resultSet.getString("password");
 
               if(userName.equals(userNameDB) && password.equals(passwordDB))
               {
                  return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
        }   
        catch(SQLException e){
                e.printStackTrace();
           }
             
             return "Invalid user credentials"; // Return appropriate message in case of failure
         
     }
}
