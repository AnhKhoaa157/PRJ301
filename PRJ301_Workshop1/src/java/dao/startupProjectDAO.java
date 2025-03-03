/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.startupProjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class startupProjectDAO implements IDAO<startupProjectDTO, String>{
        @Override
    public boolean create(startupProjectDTO entity) {
        String sql = "INSERT [dbo].[tblStartupProjects] ([projectID], [projectName], [description], [status], [estimatedLaunch]) "
        + "VALUES (?, ? ,? ,?)";
        Connection conn;
        try{
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getProjectID());
            ps.setString(2, entity.getProjectName());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setDate(5, entity.getEstimatedLaunch());
            int n = ps.executeUpdate(sql);
            return n>0;
        }   catch (ClassNotFoundException ex) {
                Logger.getLogger(startupProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(startupProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        return false;
    }

    @Override
    public List<startupProjectDTO> readAll() {
        return null;
    }

    @Override
    public startupProjectDTO readByID(String id) {
        return null;
    }

    @Override
    public boolean update(startupProjectDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<startupProjectDTO> search(String searchTerm) {
        return null;
    }
    
    public List<startupProjectDTO> searchByProjectID(String searchTerm){
        String sql = "SELECT * FROM tblStartupProjects WHERE title LIKE ?";
        List<startupProjectDTO> list = new ArrayList<startupProjectDTO>();
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                startupProjectDTO sp = new startupProjectDTO(
                        rs.getInt("ProjectID"),
                        rs.getString("ProjectName"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("Estimated Launch"));
                list.add(sp);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
    public boolean updateProject(String id){
        String sql = "DELETE FROM [tblStartupProjects] WHERE [Username] = ?";
        Connection conn;
        try{
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate();
            return n>0;
        } catch (SQLException ex) {
                Logger.getLogger(startupProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
                Logger.getLogger(startupProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
