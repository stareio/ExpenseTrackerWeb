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
public class UserManager {
    
//    private String username;
//    private String password;
    private String nickname;
    
    public void getUser(String loginUser, Connection conn) {
        
        try {
            String query = "SELECT * FROM user WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, loginUser);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
//                username = rs.getString("username");
//                password = rs.getString("password");
                nickname = rs.getString("nickname");
                
                System.out.println("nickname: " + nickname);
            }
        }
        
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    /**
     * @return the nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname the nickname to set
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
