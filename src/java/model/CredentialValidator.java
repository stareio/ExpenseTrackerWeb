/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;

/**
 *
 * @author star
 */
public class CredentialValidator {
    
    // returns false if incorrect username/password, otherwise redirects user to home page
    public boolean checkCreds(String username, String password, Connection conn) {
        
        try {
            String query = "SELECT * FROM useracc WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet result = ps.executeQuery();
            
            while (result.next()) {
                String usernameResult = result.getString("username");
                String passwordResult = result.getString("password");
                
                if (username.equals(usernameResult) && password.equals(passwordResult)) {
                    return true;
                }
            }
            
            result.close();
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return false;
    }
    
}