/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.RegisterKolamBean;
import util.DBConnection;

/**
 *
 * @author Alif Danish
 * FOR LAKETOWN
 */
public class EditUserDao {
    public String registerUser(RegisterKolamBean userBean) throws ClassNotFoundException{
        
        String username = userBean.getUsername();
        String password = userBean.getPassword();
        String fullname = userBean.getFullname();
        String email = userBean.getEmail();
        String conpassword = userBean.getConpassword();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;

            try{
                conn = DBConnection.createConnection();
                String query = "UPDATE USERS SET NAME = ?,PASSWORD=? ,FULLNAME=? ,EMAIL=? WHERE EMAIL = ? ";
                preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1,username);
                preparedStatement.setString(2,password);
                preparedStatement.setString(3,fullname);
                preparedStatement.setString(4,email);
                preparedStatement.setString(5,email);
                
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
