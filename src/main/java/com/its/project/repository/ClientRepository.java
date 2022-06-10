package com.its.project.repository;

import com.its.project.dto.ClientDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClientRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public ClientDTO duplicateCheck(String clientId) {
        return sql.selectOne("Client.duplicateCheck", clientId);
    }

    public ClientDTO save(ClientDTO clientDTO) {
        sql.insert("Client.save", clientDTO);
        return sql.selectOne("Client.saveReturn", clientDTO);

    }

    public ClientDTO login(ClientDTO clientDTO) {
        return sql.selectOne("Client.login", clientDTO);
    }

    public List<ClientDTO> findAll() {
        return sql.selectList("Client.findAll");
    }

    public ClientDTO findById(Long id) {
        return sql.selectOne("Client.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Client.delete", id);
    }

    public int update(ClientDTO clientDTO) {
        return sql.update("Client.update", clientDTO);
    }

    public void point(ClientDTO clientDTO) {
        sql.update("Client.point", clientDTO);
    }

    public ClientDTO findByKakaoId(String clientKakaoId) {
        return sql.selectOne("Client.findByKakaoId", clientKakaoId);
    }
}
