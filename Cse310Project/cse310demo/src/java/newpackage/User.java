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
public class User {
    int user_id;
    String name;
    String email;
    String phone;
    String password;
    String user_type;
    
    public User(){
    
    }
    
    public User(int user_id, String name , String email, String phone, String password,String user_type){
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.user_type = user_type;

    }
    public User(String name , String email, String phone, String password,String user_type){
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.user_type = user_type;
    }
    
    public User( String email,String password){
        this.email = email;
        this.password = password;
    }
    
    public void setId(int user_id){
        this.user_id = user_id;
    }
    public int getId(){
        return user_id;
    }
    
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return name;
    }
     public void setEmail(String email){
        this.email = email;
    }
    public String getEmail(){
        return email;
    }
     public void setPhone(String phone){
        this.phone = phone;
    }
     
    public String getPhone(){
        return phone;
    }
     public void setPassword(String password){
        this.password = password;
    }
    public String getPassword(){
        return password;
    }
    public void setUserType(String user_type){
         this.user_type = user_type;
     }
     public String getUser_type(){
        return user_type;
    }
    
    
}
