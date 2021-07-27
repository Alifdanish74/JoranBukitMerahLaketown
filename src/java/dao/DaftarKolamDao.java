/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bean.DaftarKolamBean;
import java.util.Date;
import util.DBConnection;
/**
 *
 * @author Alif Danish
 */
public class DaftarKolamDao {
    public String daftarKolam (DaftarKolamBean daftarkolamBean) throws ClassNotFoundException{
        String pondname = daftarkolamBean.getPondname();
        String fullname = daftarkolamBean.getFullname();
        String email = daftarkolamBean.getEmail();
        String phoneno = daftarkolamBean.getPhoneno();
        Date date = daftarkolamBean.getBookingdate();
        
        Connection conn = null;
        
        PreparedStatement preparedStatement = null;
        new java.sql.Date(date.getTime());
        
        try{
                conn = DBConnection.createConnection();
                String query = "INSERT INTO DAFTARKOLAM (pondname,FULLNAME,EMAIL,PHONENO,BOOKINGDATE) VALUES (?,?,?,?,?)";
                preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1,pondname);
                preparedStatement.setString(2,fullname);
                preparedStatement.setString(3,email);
                preparedStatement.setString(4,phoneno);
                preparedStatement.setDate(5,new java.sql.Date(daftarkolamBean.getBookingdate().getTime()));
                
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
