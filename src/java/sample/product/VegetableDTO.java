/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Bao
 */
public class VegetableDTO {
    private String vegetableID;
    private String vegetableName;
    private String image;
    private double price;
    private int quantity;
    private String catagoryID;
    private String importDate;
    private String usingDate;

    public VegetableDTO() {
        this.vegetableID = "";
        this.vegetableName = "";
        this.image = "";
        this.price = 0;
        this.quantity = 0;
        this.catagoryID = "";
        this.importDate = "";
        this.usingDate = "";
    }

    public VegetableDTO(String vegetableID, String vegetableName, String image, double price, int quantity, String catagoryID, String importDate, String usingDate) {
        this.vegetableID = vegetableID;
        this.vegetableName = vegetableName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.catagoryID = catagoryID;
        this.importDate = importDate;
        this.usingDate = usingDate;
    }

    public String getVegetableID() {
        return vegetableID;
    }

    public void setVegetableID(String vegetableID) {
        this.vegetableID = vegetableID;
    }

    public String getVegetableName() {
        return vegetableName;
    }

    public void setVegetableName(String vegetableName) {
        this.vegetableName = vegetableName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }
    
    
}
