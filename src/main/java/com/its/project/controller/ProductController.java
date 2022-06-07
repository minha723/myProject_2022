package com.its.project.controller;

import com.its.project.dto.LikeDTO;
import com.its.project.dto.PageDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.dto.VendorDTO;
import com.its.project.service.ProductService;
import com.its.project.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private VendorService vendorService;

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

    @GetMapping("/findAllStar")
    public String findAllStar(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              Model model){
        List<ProductDTO> productDTOList = productService.findAllStar(page);
        PageDTO paging = productService.paging(page);
        String star = "star";
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        model.addAttribute("star", star);
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

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        if(productService.delete(id)){
        return "redirect: /product/findAll";
        }else {
            return "product/delete-fail";
        }
    }
    @GetMapping("/update")
    public String update(@RequestParam("id")Long id, HttpSession session,
                         Model model){
        Long vId = (Long) session.getAttribute("loginVId");
        VendorDTO vendorDTO = vendorService.findById(vId);
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("updateVendor", vendorDTO);
        model.addAttribute("updateProduct", productDTO);
        return "product/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ProductDTO productDTO){
        productService.update(productDTO);
        return "redirect: /product/detail?id=" + productDTO.getId();
    }


    @GetMapping("/search")
    public String search(@RequestParam("q") String q,
                         Model model){
        List<ProductDTO> productDTOList = productService.search(q);
        model.addAttribute("productList", productDTOList);
        return "product/list";
    }

    @GetMapping("/like")
    public String like(@RequestParam("id") Long productId,
                       @RequestParam("clientId") String clientId){
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setProductId(productId);
        likeDTO.setClientId(clientId);
        productService.like(likeDTO);
        return "redirect:/product/detail?id="+productId;
    }

}
