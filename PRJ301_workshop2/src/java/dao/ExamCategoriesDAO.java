/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamCategoriesDTO;
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
public class ExamCategoriesDAO implements IDAO<ExamCategoriesDTO, Integer>{

    @Override
    public boolean create(ExamCategoriesDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ExamCategoriesDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ExamCategoriesDTO readByID(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ExamCategoriesDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ExamCategoriesDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<ExamCategoriesDTO> searchExamCategories(String searchTerm){
        String sql = "SELECT * FROM tblExamCategories WHERE categoryname LIKE ?";
        List<ExamCategoriesDTO> list = new ArrayList<ExamCategoriesDTO>();
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamCategoriesDTO excs = new ExamCategoriesDTO(
                        rs.getInt("categoryid"),
                        rs.getString("categoryname"),
                        rs.getString("description"));
                list.add(excs);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    
}
