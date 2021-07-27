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
public class RegisterKolamDao {
    public String registerUser(RegisterKolamBean registerBean) throws ClassNotFoundException{
        
        String username = registerBean.getUsername();
        String password = registerBean.getPassword();
        String fullname = registerBean.getFullname();
        String email = registerBean.getEmail();
        String conpassword = registerBean.getConpassword();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;

            try{
                conn = DBConnection.createConnection();
                String query = "INSERT INTO USERS (NAME,PASSWORD,FULLNAME,EMAIL) VALUES (?,?,?,?)";
                preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1,username);
                preparedStatement.setString(2,password);
                preparedStatement.setString(3,fullname);
                preparedStatement.setString(4,email);
                
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
