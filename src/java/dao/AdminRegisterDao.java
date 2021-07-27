/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.AdminRegisterBean;
import util.DBConnection;

/**
 *
 * @author Alif Danish
 * FOR LAKETOWN
 */
public class AdminRegisterDao {
    public String registerUser(AdminRegisterBean adminregisterBean) throws ClassNotFoundException{
        
        String username = adminregisterBean.getName();
        String password = adminregisterBean.getPassword();
        String fullname = adminregisterBean.getFullname();
        String conpassword = adminregisterBean.getConpassword();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;

            try{
                conn = DBConnection.createConnection();
                String query = "INSERT INTO ADMIN (NAME,FULLNAME,PASSWORD) VALUES (?,?,?)";
                preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1,username);
                preparedStatement.setString(2,fullname);
                preparedStatement.setString(3,password);
                
                int i=preparedStatement.executeUpdate();
                
                if(i !=0){
                    return "SUCCESS";
                }
            } catch(SQLException e){
                e.printStackTrace();
            }
    
        return "Something went wrong, Try Again!";
        
    }
}
