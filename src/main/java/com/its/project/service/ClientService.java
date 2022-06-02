package com.its.project.service;

import com.its.project.dto.ClientDTO;
import com.its.project.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;
    public String duplicateCheck(String clientId) {
        ClientDTO clientDTO = clientRepository.duplicateCheck(clientId);
        System.out.println("clientDTO = " + clientDTO);
        if(clientDTO == null){
            return "ok";
        }else {
            return "no";
        }
    }

    public void save(ClientDTO clientDTO) {
        clientRepository.save(clientDTO);
    }

    public ClientDTO findById(ClientDTO clientDTO) {
        return clientRepository.findById(clientDTO);
    }
}
