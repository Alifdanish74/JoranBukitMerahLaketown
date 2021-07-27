/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.UpdateKolamBean;
import java.util.Date;
import util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;
/**
 *
 * @author Alif Danish
 */
public class UpdateKolamDao {
    public String editPond(UpdateKolamBean updatekolamBean) throws ClassNotFoundException, IOException{
        String pondname = updatekolamBean.getPondname();
        String description = updatekolamBean.getPondDesc();
        String fee = updatekolamBean.getFee();
        String id = updatekolamBean.getId();
        
        Part image = (Part) updatekolamBean.getImage();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        
        try{
            conn = DBConnection.createConnection();
            String query = "UPDATE KOLAM SET PONDNAME = ?,DESCRIPTION = ?,FEE = ?,IMAGE = ? WHERE ID = ?";
            preparedStatement = conn.prepareStatement(query);
            
            InputStream is = image.getInputStream();
            
            preparedStatement.setString(1, pondname);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, fee);
            preparedStatement.setBlob(4,is);
            preparedStatement.setString(5,id);
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
