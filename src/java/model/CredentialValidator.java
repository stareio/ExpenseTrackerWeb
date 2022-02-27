/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.*;

/**
 *
 * @author star
 */
public class CredentialValidator {
    private User user;
    private Connection conn;
    
    public CredentialValidator(Connection conn) {
        this.conn = conn;
    }
    
    public boolean checkCreds(String username, String password) {
        user = new User();
        conn = ConnectionManager.getConnection();
        
        try {
            String queryUsername = "";
            PreparedStatement ps = conn.;
            
            if ( && )
            
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace(SELECT );
        }
        
        return false;
    }
    
}