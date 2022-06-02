package com.its.project.controller;

import com.its.project.dto.ClientDTO;
import com.its.project.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/client")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @GetMapping("/save")
    public String saveForm(){
        return "client/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ClientDTO clientDTO){
        clientService.save(clientDTO);
        return "client/login";
    }

    @PostMapping("duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("clientId") String clientId){
        return clientService.duplicateCheck(clientId);
    }

}
