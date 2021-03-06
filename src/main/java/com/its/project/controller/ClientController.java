package com.its.project.controller;

import com.its.project.dto.ClientDTO;
import com.its.project.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/client")
public class ClientController {
    @Autowired
    private ClientService clientService;


    @GetMapping("/save")
    public String saveForm() {
        return "client/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ClientDTO clientDTO, HttpSession session) {
        ClientDTO cLogin = clientService.save(clientDTO);
        if (cLogin != null) {
            session.setAttribute("loginClientId", cLogin.getClientId());
            session.setAttribute("loginCId", cLogin.getId());
            return "client/main";
        } else {
            return "client/login";
        }
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("clientId") String clientId) {
        return clientService.duplicateCheck(clientId);
    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<ClientDTO> clientDTOList = clientService.findAll();
        model.addAttribute("clientList", clientDTOList);
        return "client/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        ClientDTO clientDTO = clientService.findById(id);
        model.addAttribute("client", clientDTO);
        return "client/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session) {
        String loginId = (String) session.getAttribute("loginClientId");
        if (loginId == "admin") {
            clientService.delete(id);
            return "redirect: /client/findAll";
        } else {
            session.invalidate();
            clientService.delete(id);
            return "index";
        }
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        ClientDTO clientDTO = clientService.findById(id);
        model.addAttribute("updateClient", clientDTO);
        return "client/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ClientDTO clientDTO){
        if(clientService.update(clientDTO)){
            return "redirect: /client/detail?id=" + clientDTO.getId();
        }else {
            return "client/main";
        }
    }
    @GetMapping("/point")
    public String pointForm(@RequestParam("id") Long id, Model model){
        ClientDTO clientDTO = clientService.findById(id);
        model.addAttribute("client", clientDTO);
        return "client/point";
    }

    @PostMapping("/point")
    public @ResponseBody void point(@ModelAttribute ClientDTO clientDTO){
        clientService.point(clientDTO);
    }

    @PostMapping("/pointAmount")
    public @ResponseBody ClientDTO pointAmount(@RequestParam("id") Long id){
        ClientDTO clientDTO = clientService.findById(id);
        return clientDTO;
    }
    @PostMapping("/pointUse")
    public @ResponseBody void pointUse(@ModelAttribute ClientDTO clientDTO){
        clientService.pointUse(clientDTO);
    }

    @GetMapping("/login")
    public String loginForm() {
        return "client/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute ClientDTO clientDTO, HttpSession session) {
        ClientDTO cLogin = clientService.login(clientDTO);
        if (cLogin != null) {
            session.setAttribute("loginClientId", cLogin.getClientId());
            session.setAttribute("loginCId", cLogin.getId());
            return "index";
        } else {
            return "client/login";
        }
    }
    @GetMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam("id") String kakaoId, Model model,
                             HttpSession session){
        ClientDTO clientDTO = clientService.kakaoLogin(kakaoId);
        if(clientDTO != null){
            session.setAttribute("loginCId", clientDTO.getId());
            session.setAttribute("loginClientId", clientDTO.getClientId());
            return "index";
        }
        model.addAttribute("kakaoId", kakaoId);
        return "client/kakaoSignup";
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }


    @RequestMapping(value = "/findpw", method = RequestMethod.GET)
    public String findPwForm() {
        return "client/findpw";
    }

    @RequestMapping(value = "/findpw", method = RequestMethod.POST)
    public void findPw(@ModelAttribute ClientDTO client, HttpServletResponse response) throws Exception{
        clientService.findPw(response, client);
    }
    @GetMapping("/chat")
    public String chat(){
        return "layout/chat";
    }

}
