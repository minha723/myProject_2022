package com.its.project.repository;

import com.its.project.dto.ClientDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public ClientDTO duplicateCheck(String clientId) {
        return sql.selectOne("Client.duplicateCheck", clientId);
    }

    public void save(ClientDTO clientDTO) {
        sql.insert("Client.save", clientDTO);

    }

    public ClientDTO findById(ClientDTO clientDTO) {
        return sql.selectOne("Client.findById", clientDTO);
    }
}
