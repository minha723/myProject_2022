package com.its.project.controller;

import com.its.project.dto.ProductDTO;
import com.its.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/save")
    public String saveForm(){
        return "product/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ProductDTO productDTO) throws IOException {
        if(productService.save(productDTO)){
            return "redirect: /product/findAll";
        }else {
            return "redirect: /product/save";
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "product/list";
    }

}
