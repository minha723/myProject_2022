package com.its.project.controller;

import com.its.project.dto.ClientDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.dto.ReviewDTO;
import com.its.project.service.ClientService;
import com.its.project.service.ProductService;
import com.its.project.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ProductService productService;
    @Autowired
    private ClientService clientService;

    @GetMapping("/save")
    public String saveForm(@RequestParam("id") Long productId,
                           Model model){
        ProductDTO productDTO = productService.findById(productId);
        model.addAttribute("product", productDTO);
        return "review/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ReviewDTO reviewDTO){
        reviewService.save(reviewDTO);
        return "redirect: /product/history?clientId="+ reviewDTO.getClientId();
    }
}
