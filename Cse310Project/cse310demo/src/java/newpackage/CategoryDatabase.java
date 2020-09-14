/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import com.mysql.cj.Query;
import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.SessionFactory;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author yokko
 */
public class CategoryDatabase {
private SessionFactory factory;
    public CategoryDatabase(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    Connection con;
    public CategoryDatabase(Connection con){
        this.con = con;
    }
    public boolean saveCategory(Category category){
        boolean set = false;
        try{
           String query = "insert into category(catTitle,catDescription) values(?,?)";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1,category.getCatTitle());
           pt.setString(2,category.getCatDescription());
           
           pt.executeUpdate();
           set = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public Category fetchCat(String catTitle, String catDescription){
        Category category = null;
        try{
            String query = "select * from category where catTitle=? and catDescription = ?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,catTitle);
            pst.setString(2,catDescription);
            
            ResultSet rs =pst.executeQuery();
            if(rs.next()){
                category = new Category();
                category.setCatId(rs.getInt("catId"));
                category.setCatTitle(rs.getString("catTitle"));
                category.setCatDescription(rs.getString("catDescription"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return category;
    }
    
    public Hashtable<Integer,String> getCategory(){
        Category category =null;
        //List<Category> listCategory = new ArrayList();
        Hashtable<Integer, String> cat = new Hashtable<>();
        try{
            String query = "select * from category";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs =pst.executeQuery();
   
            while(rs.next()){
                 category = new Category();
                 category.setCatTitle(rs.getString("catTitle"));
                 category.setCatId(rs.getInt("catId"));
                 String s =category.getCatTitle();
                 int id = category.getCatId();
               // listCategory.add(category);
                cat.put(id,s);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return cat;
    }
    
    public List<Category> getAllcategories (){
        Category category =null;
        List<Category> listCategory = new ArrayList();
        //Hashtable<Integer, String> cat = new Hashtable<>();
        try{
            String query = "select * from category";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs =pst.executeQuery();
            while(rs.next()){
                 category = new Category();
                 category.setCatId(rs.getInt("catId"));
                 category.setCatTitle(rs.getString("catTitle"));
                 category.setCatDescription(rs.getString("catDescription"));
                 //product.setCatId(rs.getInt("catId"));
//                 String s =category.getCatTitle();
//                 int id = category.getCatId();
                listCategory.add(category);
                //cat.put(id,s);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return listCategory;
    }  

   
}
