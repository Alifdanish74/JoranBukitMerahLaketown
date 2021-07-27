/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

    
 */
package bean;

/**
 *
 * @author Alif Danish
 * //FOR LAKETOWN
 */
public class LoginKolamBean implements java.io.Serializable
{
     private String email;
     private String password;
 
    public LoginKolamBean(){
    
    }
    
    public String getEmail() {
        return email;
     }
    public void setEmail(String email) {
        this.email = email;
     }
     public String getPassword() {
        return password;
     }
     public void setPassword(String password) {
        this.password = password;
     }
}
