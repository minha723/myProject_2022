package com.its.project.repository;

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

    public int productCount() {
        return sql.selectOne("Product.count");
    }

    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById", id);
    }

    public void approve(Long id) {
        sql.update("Product.approve", id);
    }
}
