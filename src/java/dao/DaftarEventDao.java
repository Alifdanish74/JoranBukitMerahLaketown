/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.DaftarEventBean;
import util.DBConnection;
/**
 *
 * @author Alif Danish
 */
public class DaftarEventDao {
    public String daftarEvent (DaftarEventBean eventBean) throws  ClassNotFoundException{
        String eventname = eventBean.getEventname();
        String fullname = eventBean.getFullname();
        String email = eventBean.getEmail();
        String phoneNo = eventBean.getPhoneno();
        String rod = eventBean.getRod();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;

            try{
                conn = DBConnection.createConnection();
                String query = "INSERT INTO DAFTAREVENT (NAME,EMAIL,PHONE,ROD,EVENTNAME) VALUES (?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1,fullname);
                preparedStatement.setString(2,email);
                preparedStatement.setString(3,phoneNo);
                preparedStatement.setString(4,rod);
                preparedStatement.setString(5,eventname);
                
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
