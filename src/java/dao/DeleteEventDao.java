/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.updateEventBean;
import java.util.Date;
import util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;
/**
 *
 * @author Alif Danish
 */
public class DeleteEventDao {
    public String deleteEvent(updateEventBean deleteeventBean) throws ClassNotFoundException, IOException{
        
        String id = deleteeventBean.getID();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        
        
        try{
            conn = DBConnection.createConnection();
            String query = "DELETE FROM EVENT WHERE ID = ?";
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
