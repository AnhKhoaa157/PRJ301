///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package dao;
//
//import dto.UserDTO;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import utils.DBUtils;
//
///**
// *
// * @author LENOVO
// */
//public class UserDAO implements IDAO<UserDTO, String>{
//
//    @Override
//    public boolean create(UserDTO entity) {
//        String sql = "INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) "
//                + "VALUES (N'"+entity.getUserID()
//                +"', N'"+entity.getFullName()
//                +"', N'"+entity.getRoleID()
//                +"', N'"+entity.getPassword()+"')";
//    
//        try{
//            Connection conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            int n = st.executeUpdate(sql);
//            return n>0;
//        } catch (ClassNotFoundException ex){
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
//
//    @Override
//    public List<UserDTO> readAll() {
//        List<UserDTO> list = new ArrayList<>();
//        String sql = "SELECT * FROM [tblUsers]";
//        try{
//            Connection conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            ResultSet rs = st.executeQuery(sql);
//            while(rs.next()){
//                UserDTO user = new UserDTO(
//                        rs.getString("userID"),
//                        rs.getString("fullName"),
//                        rs.getString("roleID"),
//                        rs.getString("password")
//                );
//                list.add(user);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//
//    @Override
//    public UserDTO readByID(String id) {
//        String sql = "SELECT * FROM tblUsers WHERE [userID] = N'" + id + "'";
//        try {
//            Connection conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            ResultSet rs = st.executeQuery(sql);
//            while(rs.next()){
//                UserDTO user = new UserDTO(
//                        rs.getString("userID"),
//                        rs.getString("fullName"),
//                        rs.getString("roleID"),
//                        rs.getString("password"));
//                return user;
//            }
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//
//    @Override
//    public boolean update(UserDTO entity) {
//        String sql = "UPDATE [tblUsers] SET "
//                + "[fullName] = N'" + entity.getFullName() + "', "
//                + "[roleID] = N'" + entity.getRoleID() + "', "
//                + "[password] = N'" + entity.getPassword() + "' "
//                + "WHERE [userID] = N'" + entity.getUserID() + "'";
//        Connection conn;
//        try{
//            conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            int n = st.executeUpdate(sql);
//            return n>0;
//        } catch (ClassNotFoundException ex){
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
//
//    @Override
//    public boolean delete(String id) {
//        String sql = "DELETE FROM [tblUsers] WHERE [userID] = N'" + id + "'";
//        Connection conn;
//        try{
//            conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            int n = st.executeUpdate(sql);
//            return n>0;
//        } catch (ClassNotFoundException ex){
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
//
//    @Override
//    public List<UserDTO> search(String searchTerm) {
//        List<UserDTO> list = new ArrayList<>();
//        String sql = "SELECT [userID], [fullName], [roleID], [password] FROM [tblUsers] "
//                + "WHERE [userID] LIKE N'%" + searchTerm + "%' "
//                + "OR [fullName] LIKE N'%" + searchTerm + "%' "
//                + "OR [roleID] LIKE N'%" + searchTerm + "%'";
//        try {
//            Connection conn = DBUtils.getConnection();
//            Statement st = conn.createStatement();
//            ResultSet rs = st.executeQuery(sql);
//            while (rs.next()) {
//                UserDTO user = new UserDTO(
//                        rs.getString("userID"),
//                        rs.getString("fullName"),
//                        rs.getString("roleID"),
//                        rs.getString("password")
//                );
//                list.add(user);
//            }
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//    
//    
//
//    
//}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class UserDAO implements IDAO<UserDTO, String>{

    @Override
    public boolean create(UserDTO entity) {
        String sql = "INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) "
                + "VALUES (?, ? ,? ,?)";
        Connection conn;        
        try{
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            int n = ps.executeUpdate(sql);
            ps.setString(1, entity.getUserID());
            ps.setString(2, entity.getFullName());
            ps.setString(3, entity.getRoleID());
            ps.setString(4, entity.getPassword());
            return n>0;
        } catch (ClassNotFoundException ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [tblUsers]";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while(rs.next()){
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password")
                );
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public UserDTO readByID(String id) {
        String sql = "SELECT * FROM tblUsers WHERE userID= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(0,id);
            ResultSet rs = ps.executeQuery(sql);
            while(rs.next()){
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password"));
                return user;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
        String sql = "UPDATE [tblUsers] SET "
                + "[fullName] = ?, "
                + "[roleID] = ?, "
                + "[password] =? "
                + "WHERE [userID] = ?";
        Connection conn;
        try{
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getUserID());
            ps.setString(2, entity.getFullName());
            ps.setString(3, entity.getRoleID());
            ps.setString(4, entity.getPassword());
            int n = ps.executeUpdate(sql);
            return n>0;
        } catch (ClassNotFoundException ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [tblUsers] WHERE [userID] = ?";
        Connection conn;
        try{
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate(sql);
            return n>0;
        } catch (ClassNotFoundException ex){
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT [userID], [fullName], [roleID], [password] FROM [tblUsers] "
                + "WHERE [userID] LIKE N'%" + searchTerm + "%' "
                + "OR [fullName] LIKE N'%" + searchTerm + "%' "
                + "OR [roleID] LIKE N'%" + searchTerm + "%'";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getString("userID"),
                        rs.getString("fullName"),
                        rs.getString("roleID"),
                        rs.getString("password")
                );
                list.add(user);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
