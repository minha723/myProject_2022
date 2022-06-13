package com.its.project.repository;

import com.its.project.dto.HistoryDTO;
import com.its.project.dto.LikeDTO;
import com.its.project.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(ProductDTO productDTO) {
        return sql.insert("Product.save", productDTO);
    }

    public List<ProductDTO> findAll(Map<String, Integer> pagingParam) {
    return sql.selectList("Product.findAll", pagingParam);
    }

    public int productCount(int productCategory) {
        return sql.selectOne("Product.count", productCategory);
    }

    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById", id);
    }

    public void approve(Long id) {
        sql.update("Product.approve", id);
    }

    public List<ProductDTO> findAllStar(Map<String, Integer> pagingParam) {
        return sql.selectList("Product.findAllStar", pagingParam);
    }

    public List<ProductDTO> search(String q) {
        return sql.selectList("Product.search", q);
    }

    public int delete(Long id) {
        return sql.delete("Product.delete", id);
    }

    public void update(ProductDTO productDTO) {
        sql.update("Product.update", productDTO);
    }

    public int like(LikeDTO likeDTO) {
        return sql.insert("Like.save", likeDTO);
    }

    public LikeDTO findLike(LikeDTO likeDTO) {
        return sql.selectOne("Like.find", likeDTO);
    }

    public List<LikeDTO> likeList(String clientId) {
        return  sql.selectList("Like.findAll", clientId);
    }

    public int unlike(LikeDTO unlikeDTO) {
        return sql.delete("Like.delete", unlikeDTO);
    }

    public List<ProductDTO> findApproveList(Map<String, Integer> pagingParam) {
        return sql.selectList("Product.findApproveList", pagingParam);
    }

    public int purchase(HistoryDTO historyDTO) {
        sql.update("Vendor.updatePoint", historyDTO);
        return sql.insert("History.save", historyDTO);
    }

    public List<HistoryDTO> findHistory(String clientId) {
        return sql.selectList("History.findByClientId", clientId);
    }


    public List<Map<String, Object>> findHistoryJoin(String clientId) {
        return sql.selectList("Product.findHistoryJoin", clientId);
    }
}
