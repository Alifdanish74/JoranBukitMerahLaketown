/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.EditPondBean;
import java.util.Date;
import util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;
/**
 *
 * @author Alif Danish
 */
public class EditPondDao {
    public String editPond(EditPondBean editpondBean) throws ClassNotFoundException, IOException{
        String pondname = editpondBean.getPondname();
        String description = editpondBean.getPondDesc();
        String fee = editpondBean.getFee();
        
        Part image = (Part) editpondBean.getImage();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        
        try{
            conn = DBConnection.createConnection();
            String query = "INSERT INTO KOLAM (PONDNAME,DESCRIPTION,FEE,IMAGE) VALUES (?,?,?,?)";
            preparedStatement = conn.prepareStatement(query);
            
            InputStream is = image.getInputStream();
            
            preparedStatement.setString(1, pondname);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, fee);
            preparedStatement.setBlob(4,is);
            
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
