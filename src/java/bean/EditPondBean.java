/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import javax.servlet.http.Part;

/**
 *
 * @author Alif Danish
 */
public class EditPondBean {
    private String pondname;
    private String pondDesc;
    private String fee;
    private Part image;
    
    public String getPondname() {
        return pondname;
    }

    public void setPondname(String pondname) {
        this.pondname = pondname;
    }

    public String getPondDesc() {
        return pondDesc;
    }

    public void setPondDesc(String pondDesc) {
        this.pondDesc = pondDesc;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public Part getImage() {
        return image;
    }

    public void setImage(Part image) {
        this.image = image;
    }
    
    
}
