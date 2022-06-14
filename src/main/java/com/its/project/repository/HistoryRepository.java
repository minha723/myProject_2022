package com.its.project.repository;

import com.its.project.dto.HistoryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HistoryRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<HistoryDTO> findAll() {
        return sql.selectList("History.findAll");
    }
}
