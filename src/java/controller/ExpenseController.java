/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConnectionManager;
import model.CredentialValidator;

/**
 *
 * @author star
 */
public class ExpenseController extends HttpServlet {
    
    private ConnectionManager cm;
    private CredentialValidator cv;
    
    public void init(ServletConfig config) throws ServletException {
        
        super.init(config);
        
        String driver = config.getInitParameter("jdbcClassName");
        String username = config.getInitParameter("dbUserName");
        String password = config.getInitParameter("dbPassword");
        
        String driverUrl = config.getInitParameter("jdbcDriverURL");
        String hostname = getInitParameter("dbHostName");
        String port = config.getInitParameter("dbPort");
        String database = config.getInitParameter("databaseName");
        
        cm.establishConn(driver, username, password, driverUrl, hostname, port, database);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("loginUsername");
        String password = request.getParameter("loginPassword");
        
        if (cv.checkCreds(username, password)) {
                // call class that has the resulset of the expenses
                ResultSet records = em.getExpenses();

                request.setAttribute("results", records);
                request.getRequestDispatcher("displayresult.jsp").forward(request, response);
            }

            else {
                response.sendRedirect("errorLogin.jsp");
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
