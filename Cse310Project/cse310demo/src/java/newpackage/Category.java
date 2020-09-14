/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
 * @author yokko
 */
public class Category {
    int catId;
    String catTitle;
    String catDescription;
    Category category;

    public void setCategory(Category category) {
        this.category = category;
    }

    public Category getCategory() {
        return category;
    }
    
    public Category(){
        
    }
    public Category(int catId, String catTitle, String catDescription){
        this.catId = catId;
        this.catTitle = catTitle;
        this.catDescription = catDescription;
    }
    public Category(String catTitle, String catDescription){
        this.catTitle = catTitle;
        this.catDescription = catDescription;
    }
    public Category(String catTitle){
        this.catTitle = catTitle;
    }

   
    
    public void setCatId(int catId){
        this.catId = catId;
    }
    public void setCatTitle(String catTitle){
        this.catTitle = catTitle;
    }
    public void setCatDescription(String catDescription){
        this.catDescription = catDescription;
    }
    
    public int getCatId(){
        return catId;
    }
    public String getCatTitle(){
        return catTitle;
    }
    public String getCatDescription(){
        return catDescription;
    }
      
}
