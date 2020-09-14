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
public class ConnectionPro {
    public static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
