/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class AuthUtils {
    
    public static final String INSTRUCTOR_ROLE = "Instructor";
    public static final String STUDENT_ROLE = "Student";
    
    public static UserDTO getUser(String strUserName){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByID(strUserName);
        return user;
    }
    
    public static boolean isValidLogin(String strUserName, String strPassword){
        UserDTO user = getUser(strUserName);
        System.out.println(user);
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }
    
    public static UserDTO getUser(HttpSession session){
        Object obj = session.getAttribute("user");
        return (obj != null) ? (UserDTO)obj:null;
    }
    
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user") != null;
    }
    
    public static boolean isInstructor(HttpSession session){
        if(!isLoggedIn(session)){
            return false;
        }
        UserDTO user = (UserDTO)session.getAttribute("user");
        return user.getRoleID().equals(INSTRUCTOR_ROLE);
    }
}