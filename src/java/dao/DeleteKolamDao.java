/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.UpdateKolamBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

/**
 *
 * @author Alif Danish
 */
public class DeleteKolamDao{
    public String deleteKolam( UpdateKolamBean deletekolamBean) throws ClassNotFoundException, IOException{
        
        String id = deletekolamBean.getId();
     
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        
        
        try{
            conn = DBConnection.createConnection();
            String query = "DELETE FROM KOLAM WHERE ID = ?";
            preparedStatement = conn.prepareStatement(query);
           
            preparedStatement.setString(1,id);
            
            int i=preparedStatement.executeUpdate();
            
            if(i != 0){
                return "SUCCESS";
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return "Something went wrong, Try Again!";
    }
    
}
