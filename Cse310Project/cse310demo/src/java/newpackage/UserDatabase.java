package newpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author yokko
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
public class UserDatabase {
    Connection con;
    public UserDatabase(Connection con){
        this.con = con;
}
    public boolean saveUser(User user){
        boolean set = false;
        try{
            String query = "insert into user(name,email,phone,password) values(?,?,?,?)";
            
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1,user.getName());
            pt.setString(2,user.getEmail());
            pt.setString(3,user.getPhone());
            pt.setString(4,user.getPassword());
            //pt.setString(5,user.getUser_type());
            
            pt.executeUpdate();
            set = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    //userCount
     public  Hashtable<Integer,String> getUserCount(){
       User user = null;
       Hashtable<Integer, String> map = new Hashtable<>();
        try{
            String query = "select * from user";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs =pst.executeQuery();
   
            while(rs.next()){
                  user = new User();
                 user.setId(rs.getInt("user_id"));
                 user.setEmail(rs.getString("email"));
                 int id = user.getId();
                 String s = user.getEmail();
                map.put(id,s);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
       return map;
    }
    
    //user login
    public User logUser(String email,String password){
        User user = null;
        try{
            String query = "select * from user where email=? and password = ?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,password);
            
            ResultSet rs =pst.executeQuery();
            if(rs.next()){
                user = new User();
                user.setId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("user_type"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
   
    
        public  List<User> getUserList(){
       User user = null;
       List<User> list = new ArrayList();
        try{
            String query = "select * from user";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs =pst.executeQuery();
   
            while(rs.next()){
                  user = new User();
                 user.setId(rs.getInt("user_id"));
                 user.setName(rs.getString("name"));
                 user.setEmail(rs.getString("email"));
                 user.setPhone(rs.getString("phone"));
                 user.setUserType(rs.getString("user_type"));
                 list.add(user);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
       return list;
    }
}
