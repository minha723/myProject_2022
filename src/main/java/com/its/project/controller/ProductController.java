package com.its.project.controller;

import com.its.project.dto.PageDTO;
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
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
            Model model){
        List<ProductDTO> productDTOList = productService.findAll(page);
        PageDTO paging = productService.paging(page);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        return "product/list";
    }

    @GetMapping("/approveList")
    public String approveForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              Model model){
        List<ProductDTO> productDTOList = productService.findAll(page);
        PageDTO paging = productService.paging(page);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        return "product/approve";
    }

    @GetMapping("/approve")
    public String approve(@RequestParam("id") Long id){
        productService.approve(id);
        return "redirect:/product/approveList";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam("id") Long id, Model model){
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product",productDTO);
        model.addAttribute("paging", page);
        return "product/detail";
    }


}
