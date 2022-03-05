/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.ConnectionManager;
import model.ExpenseManager;
import model.User;
import model.UserManager;

/**
 *
 * @author star
 */
public class ExpenseController extends HttpServlet {
    
    HttpSession session;
    ExpenseManager em;
    UserManager um;
    User user;
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
        em = new ExpenseManager();
        um = new UserManager();
        
        conn = cm.establishConn(driver, username, password, driverUrl, hostname, port, database);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        session = request.getSession();
        
        if (conn != null) {
            String loginName = request.getParameter("loginUsername");    // inputs of user in login form
            String loginPass = request.getParameter("loginPassword");
            String action = request.getParameter("action");
            
            if (action.equals("Login")) {
                user = um.loginUser(loginName, loginPass, conn);
            }
            
            if (user != null) {
                
                String date = "";
                String descr = "";
                String inex = "";
                String amount = "";
                String category = "";
                
                if (!action.equals("Login")) {
                    date = request.getParameter("date");
                    descr = request.getParameter("descr");
                    
                    if (action.equals("Add Entry")) {
                        inex = request.getParameter("inex");
                        amount = request.getParameter("amount");
                        category = request.getParameter("category");
                    }
                }
                
                List records = em.getExpenses(conn, action, date, descr);
                
                System.out.println("user: " + user);
                session.setAttribute("account", user);
                request.setAttribute("results", records);
                
                request.getRequestDispatcher("displayresult.jsp").forward(request, response);
            }

            else {
                response.sendRedirect("errorLogin.jsp");
            }
        }
        
        else {
            response.sendRedirect("errorConn.jsp");
        }
 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
