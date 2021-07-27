/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.EditEventBean;
import java.util.Date;
import util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;
/**
 *
 * @author Alif Danish
 */
public class EditEventDao {
    public String editEvent(EditEventBean editeventBean) throws ClassNotFoundException, IOException{
        String eventname = editeventBean.getEventname();
        String description = editeventBean.getEventDesc();
        String location = editeventBean.getLocation();
        Date date = editeventBean.getTarikh();
        
        Part image = (Part) editeventBean.getImage();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        new java.sql.Date(date.getTime());
        
        try{
            conn = DBConnection.createConnection();
            String query = "INSERT INTO EVENT (EVENTNAME,DESCRIPTION,LOCATION,EVENTDATE,IMAGE) VALUES (?,?,?,?,?)";
            preparedStatement = conn.prepareStatement(query);
            
            InputStream is = image.getInputStream();
            
            preparedStatement.setString(1, eventname);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, location);
            preparedStatement.setDate(4, new java.sql.Date(editeventBean.getTarikh().getTime()));
            preparedStatement.setBlob(5,is);
            
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
