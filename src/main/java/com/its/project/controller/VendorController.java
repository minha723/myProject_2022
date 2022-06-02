package com.its.project.controller;

import com.its.project.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vendor")
public class VendorController {
    @Autowired
    private VendorService vendorService;

}
