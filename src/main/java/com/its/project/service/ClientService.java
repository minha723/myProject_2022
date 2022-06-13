package com.its.project.service;

import com.its.project.dto.ClientDTO;
import com.its.project.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;
    public String duplicateCheck(String clientId) {
        ClientDTO clientDTO = clientRepository.duplicateCheck(clientId);
        if(clientDTO == null){
            return "ok";
        }else {
            return "no";
        }
    }

    public ClientDTO save(ClientDTO clientDTO) {
        return clientRepository.save(clientDTO);
    }

    public ClientDTO login(ClientDTO clientDTO) {
        return clientRepository.login(clientDTO);
    }

    public List<ClientDTO> findAll() {
        return clientRepository.findAll();
    }

    public ClientDTO findById(Long id) {
        return clientRepository.findById(id);
    }

    public void delete(Long id) {
        clientRepository.delete(id);
    }

    public boolean update(ClientDTO clientDTO) {
        int result = clientRepository.update(clientDTO);
        if(result > 0){
            return true;
        }else {
            return false;
        }
    }

    public void point(ClientDTO clientDTO) {
        clientRepository.point(clientDTO);
    }

    public ClientDTO kakaoLogin(String kakaoId) {
        return clientRepository.findByKakaoId(kakaoId);
    }


    public void pointUse(ClientDTO clientDTO) {
        clientRepository.pointUse(clientDTO);
    }
}
