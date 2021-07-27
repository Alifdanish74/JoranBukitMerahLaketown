/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Alif Danish
 * //FOR LAKETOWN
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import bean.LoginKolamBean;
import util.DBConnection;
 
public class LoginKolamDao {
     public String authenticateUser(LoginKolamBean loginBean)
     {
         String userName = loginBean.getEmail(); //Assign user entered values to temporary variables.
         String password = loginBean.getPassword();
         Connection con = null;
         Statement statement = null;
         ResultSet resultSet = null;
 
         String emailDB = "";
         String passwordDB = "";
 
        try{
             con = DBConnection.createConnection(); //Fetch database connection object
             statement = con.createStatement(); //Statement is used to write queries. Read more about it.
             resultSet = statement.executeQuery("select id,email,password from users"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
 
             while(resultSet.next()) // Until next row is present otherwise it return false
             {
              emailDB = resultSet.getString("email"); //fetch the values present in database
              passwordDB = resultSet.getString("password");
 
               if(userName.equals(emailDB) && password.equals(passwordDB))
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
