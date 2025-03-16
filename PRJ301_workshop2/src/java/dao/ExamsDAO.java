/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class ExamsDAO implements IDAO<ExamsDTO, Integer>{

    @Override
    public boolean create(ExamsDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ExamsDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ExamsDTO readByID(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ExamsDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ExamsDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<ExamsDTO> searchExams(int categoryID) {
        String sql = "SELECT * FROM tblExams WHERE categoryid = ?";
        List<ExamsDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryID); // Set đúng kiểu int
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ExamsDTO ex = new ExamsDTO(
                        rs.getInt("examid"),
                        rs.getString("examtitle"),
                        rs.getString("Subject"),
                        rs.getInt("categoryid"),
                        rs.getInt("totalmarks"),
                        rs.getInt("Duration"));
                list.add(ex);
            }
        } catch (Exception e) {
            System.out.println("Error in searchExamsByCategory: " + e.getMessage());
        }
        return list;
    }
}
