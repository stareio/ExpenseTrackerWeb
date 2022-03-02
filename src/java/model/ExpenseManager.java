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
public class ExpenseManager {
    // create resultset
    
    Connection conn;
    Double income;
    Double expenses;
    Double balance;
    List<Expense> list;
    
    public List<Expense> getExpenses(Connection conn) {
        
        list = new ArrayList<>();
        this.conn = conn;
        
        try {
            String query = "SELECT * FROM expense ORDER BY date";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Expense e = new Expense();
                
                e.setDate(rs.getDate("date"));
                e.setInex(rs.getString("income_expense"));
                e.setAmount(rs.getString("amount"));
                e.setCategory(rs.getString("category"));
                e.setNote(rs.getString("note"));
                list.add(e);
            }
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return list;
    }
    
    public double getIncome() {
        income = 0.00;

        for (Expense e : list) {
            if (e.getInex().equals("Income")) {
                income = income + e.getAmount();
            }
        }
        
        return income;
    }
    
    public double getExpenses() {
        
        
        
        return expenses;
    }
    
    public double getBalance() {
        
        
        return balance;
    }
}
