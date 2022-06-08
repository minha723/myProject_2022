package com.its.project.repository;

import com.its.project.dto.ReviewDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public void save(ReviewDTO reviewDTO) {
        sql.insert("Review.save", reviewDTO);
    }
}
