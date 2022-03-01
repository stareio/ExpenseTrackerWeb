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
public class ExpenseManager {
    // create resultset
    
    Connection conn;
    
    public ResultSet getExpenses(Connection conn) {
        
        ResultSet rs = null;
        this.conn = conn;
        
        try {
            String query = "SELECT * FROM expense ORDER BY date";
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return rs;
    }
}
