package com.its.project.repository;

import com.its.project.dto.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {

    @Autowired
    private SqlSessionTemplate sql;


    public void save(ReviewDTO reviewDTO) {
        sql.insert("Review.save", reviewDTO);
    }
    public List<ReviewDTO> findByProductId(Long productId) {
        return sql.selectList("Review.findByProductId", productId);
    }

    public void delete(Long id) {
        sql.delete("Review.delete", id);
    }
}
