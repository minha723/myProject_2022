package com.its.project.controller;

import com.its.project.dto.VendorDTO;
import com.its.project.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/vendor")
public class VendorController {
    @Autowired
    private VendorService vendorService;

    @GetMapping("/save")
    public String saveForm() {
        return "vendor/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute VendorDTO vendorDTO) throws IOException {
        if (vendorService.save(vendorDTO)) {
            return "/vendor/login";
        } else {
            return "index";
        }
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("vendorId") String vendorId) {
        return vendorService.duplicateCheck(vendorId);
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<VendorDTO> vendorDTOList = vendorService.findAll();
        model.addAttribute("vendorList", vendorDTOList);
        return "vendor/list";

    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        VendorDTO vendorDTO = vendorService.findById(id);
        model.addAttribute("vendor", vendorDTO);
        return "vendor/detail";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session){
        String loginId = (String) session.getAttribute("loginVendorId");
        if(loginId == "admin"){
        vendorService.delete(id);
        return "redirect: /vendor/findAll";
        }else {
            session.invalidate();
            vendorService.delete(id);
            return "index";
        }
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        VendorDTO vendorDTO = vendorService.findById(id);
        model.addAttribute("updateVendor", vendorDTO);
        return "vendor/update";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute VendorDTO vendorDTO) {
        if(vendorService.update(vendorDTO)){
            return "redirect: /vendor/detail?id=" + vendorDTO.getId();
        }else {
            return "vendor/main";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "vendor/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute VendorDTO vendorDTO, HttpSession session) {
        VendorDTO vLogin = vendorService.login(vendorDTO);
        if (vLogin != null) {
            session.setAttribute("loginVendorId", vLogin.getVendorId());
            session.setAttribute("loginVId", vLogin.getId());
            return "vendor/main";
        }else {
            return "vendor/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

}
