/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.*;
import javax.swing.JOptionPane;

/**
 *
 * @author star
 */
public class EntryValidator {
    // methods return true if input is valid
    
    public boolean checkDate(String str) {
        
        try {
            // check the length
            if (str.length() == 10){
                
                // reformat the input date
                SimpleDateFormat sdfParse = new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat sdfFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date parsedDate = sdfParse.parse(str);

                // throws a DTE if an invalid date value is passed to it
                LocalDate ld = parsedDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                return true;
            }
        }
        
        catch (ParseException pe) {
            pe.printStackTrace();
        }
        
        catch (DateTimeException dte) {
            dte.printStackTrace();
        } 

        return false;
    }
    
    public boolean checkAmount(String amount) {
        try {
            double d = Double.valueOf(amount);
            
            return true;
        }
        
        catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }
        
        return false;
    }
}