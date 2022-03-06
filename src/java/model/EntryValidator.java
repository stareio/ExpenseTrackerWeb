/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.*;
import java.util.*;
import javax.swing.JOptionPane;

/**
 *
 * @author star
 */
public class EntryValidator {
    
    // returns true if input date is valid
    public boolean checkDate(Date date) {
        
        try {
            // throws DTE if an invalid date value is passed to it
            LocalDate ld = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            return true;
        }
        
        catch (DateTimeException dte) {
            JOptionPane.showMessageDialog(null, "Please enter a valid date", "Error Screen",
                    JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }
}
