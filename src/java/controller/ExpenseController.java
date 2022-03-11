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
import model.EntryValidator;
import model.ExpenseManager;
import model.User;
import model.UserManager;

/**
 *
 * @author star
 */
public class ExpenseController extends HttpServlet {
    
    ExpenseManager em;
    EntryValidator ev;
    UserManager um;
    User user;
    String updateDate;
    String updateDescr;
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
        ev = new EntryValidator();
        
        conn = cm.establishConn(driver, username, password, driverUrl, hostname, port, database);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        // check if connection is null
        if (conn != null) {
            
            HttpSession session = request.getSession(false);
            String action = request.getParameter("action");
            
            System.out.println("");
            System.out.println("session: " + session);
            System.out.println("action: " + action);

            // check if user is logging in
            if (action.equals("Login")) {
                String loginName = request.getParameter("loginUsername");    // inputs of user in login form
                String loginPass = request.getParameter("loginPassword");
                user = um.loginUser(loginName, loginPass, conn);
                
                session = request.getSession();
                session.setAttribute("account", user);
                System.out.println("user: " + user);
            }
            
            // check if user is already logged in
            if (session != null && session.getAttribute("account") != null) {
                
                String date = "";
                String descr = "";
                String inex = "";
                String amount = "";
                String category = "";
                
                if (!action.equals("Login")) {
                    date = request.getParameter("date");
                    descr = request.getParameter("descr");
                    
                    System.out.println("date: " + date);
                    System.out.println("descr: " + descr);
                    
                    if (action.equals("Add Record") || action.equals("Update Record")) {
                        inex = request.getParameter("inex");
                        amount = request.getParameter("amount");
                        category = request.getParameter("category");
                        
                        // reference values for update record
                        updateDate = (String) session.getAttribute("updateDate");
                        updateDescr = (String) session.getAttribute("updateDescr");
                    }
                }

            // ==========================================================

                // for adding/updating an entry, check date & amount values
                if ( (action.equals("Add Record") || action.equals("Update Record"))
                        && (ev.checkDate(date)==false || ev.checkAmount(amount)==false)) {
                    response.sendRedirect("errorEntry.jsp");
                }
                
                // retrieve the list of records 
                else {
                    List records = em.getExpenses(conn, action, date, descr,
                                                inex, amount, category,
                                                updateDate, updateDescr);

                    switch (action) {
                        case "Add an Entry":
                            request.getRequestDispatcher("addrecord.jsp").forward(request, response);
                            break;
                        case "Update":
                            session.setAttribute("updateDate", request.getParameter("updateDate"));
                            session.setAttribute("updateDescr", request.getParameter("updateDescr"));

                            request.getRequestDispatcher("updaterecord.jsp").forward(request, response);

                            break;
                        default:
                            request.setAttribute("results", records);
                            request.getRequestDispatcher("displayresult.jsp").forward(request, response);
                            break;
                    }
                }
            }

            else {
                response.sendRedirect("login.jsp");
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

// references:
// login: https://www.youtube.com/watch?v=cYc3FjhMMzI