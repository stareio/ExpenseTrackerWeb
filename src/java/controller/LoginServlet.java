/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConnectionManager;
import model.EntryValidator;
import model.User;
import model.UserManager;

/**
 *
 * @author star
 */
public class LoginServlet extends HttpServlet {
    
    User user;
    UserManager um;
    EntryValidator ev;
    Connection conn;
    
    public void init(ServletConfig config) throws ServletException {
        
        super.init(config);
        
        String driver = config.getInitParameter("jdbcClassName");
        String username = config.getInitParameter("dbUserName");
        String password = config.getInitParameter("dbPassword");
        
        String driverUrl = config.getInitParameter("jdbcDriverURL");
        String hostname = getInitParameter("dbHostName");
        String port = config.getInitParameter("dbPort");
        String database = config.getInitParameter("databaseName");
        
        ConnectionManager cm = new ConnectionManager();
        um = new UserManager();
        ev = new EntryValidator();
        
        conn = cm.establishConn(driver, username, password, driverUrl, hostname, port, database);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
