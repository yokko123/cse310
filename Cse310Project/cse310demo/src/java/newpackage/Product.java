/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import javax.servlet.http.Part;

/**
 *
 * @author yokko
 */
public class Product {
    int pId;
    String pName;
    String pDesc;
    int pPrice;
    int pDiscount;
    int pQuantity;
    int catId;
    String pPic;
    //Category category;

  

//    public void setCategory(Category category) {
//        this.category = category;
//    }
//
//    public Category getCategory() {
//        return category;
//    }
    
   
    public Product(int pId,String pName, String pDesc, int pPrice, int pDiscount, int pQuantity,String pPic, int catId){
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pPic = pPic;
        this.catId = catId;     
    }
     public Product(){
        
    }
     public Product(String pName, String pDesc, int pPrice, int pDiscount, int pQuantity,String pPic, int catId){
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pPic = pPic;
        this.catId = catId;

              
    }
     public Product(String pName, String pDesc, int pPrice, int pDiscount, int pQuantity){
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;

              
    }
     
    public void setpId(int pId){
        this.pId = pId;
    }
    public int getpId(){
        return pId;
    }
    public void setpName(String pName){
        this.pName = pName;
    }
    public String getpName(){
        return pName;
    }
    public void setpDesc(String pDesc){
        this.pDesc = pDesc;
    }
    public String getpDesc(){
        return pDesc;
    }
    public void setpPrice(int pPrice){
        this.pPrice = pPrice;
    }
    public int getpPrice(){
        return pPrice;
    }
    public void setpDiscount(int pDiscount){
        this.pDiscount = pDiscount;
    }
    public int getpDiscount(){
        return pDiscount;
    }
    public void setpQuantity(int pQuantity){
        this.pQuantity = pQuantity;
    }
    public int getpQuantity(){
        return pQuantity;
    }
    public void setcatId(int catId){
        this.catId = catId;
    }
    public int getcatId(){
        return catId;
    }
     public void setpPic(String pPic){
        this.pPic = pPic;
    }
    public String getpPic(){
        return pPic;
    }
    
//    calculate discounted price
    public int getPriceAfterDiscount(){
        int d = (int)((this.getpDiscount()/100.0)*this.getpPrice());
        
        return this.getpPrice()-d;
    }


   
}
