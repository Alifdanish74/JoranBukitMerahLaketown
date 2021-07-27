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
public class UpdateEventDao {
    public String updateEvent(updateEventBean updateeventBean) throws ClassNotFoundException, IOException{
        String id = updateeventBean.getID();
        String eventname = updateeventBean.getEventname();
        String description = updateeventBean.getEventDesc();
        String location = updateeventBean.getLocation();
        Date date = updateeventBean.getTarikh();
        
        Part image = (Part) updateeventBean.getImage();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        new java.sql.Date(date.getTime());
        
        try{
            conn = DBConnection.createConnection();
            String query = "UPDATE EVENT SET EVENTNAME = ?,DESCRIPTION = ?,LOCATION = ?,EVENTDATE = ?,IMAGE = ? WHERE ID = ?";
            preparedStatement = conn.prepareStatement(query);
            
            InputStream is = image.getInputStream();
            
            preparedStatement.setString(1, eventname);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, location);
            preparedStatement.setDate(4, new java.sql.Date(updateeventBean.getTarikh().getTime()));
            preparedStatement.setBlob(5,is);
            preparedStatement.setString(6,id);
            
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
