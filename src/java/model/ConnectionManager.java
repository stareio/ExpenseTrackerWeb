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
public class ConnectionManager {
    private Connection conn;
    
    public Connection getConnnection(String driver, String username, String password,
                    String driverUrl, String hostname, String port, String database) {
        
        conn = null;
        
        try {
            // Load Driver
            Class.forName(driver);
        
            // Establish Connection
            StringBuffer url = new StringBuffer(driverUrl)
                        .append("://")
                        .append(hostname)
                        .append(":")
                        .append(port)
                        .append("/")
                        .append(database)
                        .append("?useSSL=false");
            
            conn = DriverManager.getConnection(url.toString(), username, password);
        }
        
        catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                                + sqle.getMessage());
        }
        
        catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                                + nfe.getMessage());
        }
        
        return conn;
    }
}
