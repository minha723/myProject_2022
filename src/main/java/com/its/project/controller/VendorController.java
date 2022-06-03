package com.its.project.controller;

import com.its.project.dto.VendorDTO;
import com.its.project.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
