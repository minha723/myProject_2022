package com.its.project.controller;

import com.its.project.dto.*;
import com.its.project.service.ClientService;
import com.its.project.service.ProductService;
import com.its.project.service.ReviewService;
import com.its.project.service.VendorService;
import com.mysql.cj.xdevapi.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private VendorService vendorService;
    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ClientService clientService;


    @GetMapping("/save")
    public String saveForm() {
        return "product/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ProductDTO productDTO) throws IOException {
        if (productService.save(productDTO)) {
            return "redirect: /product/findAll";
        } else {
            return "redirect: /product/save";
        }
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value = "productCategory", required = false, defaultValue = "0") int productCategory,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          Model model) {
        List<ProductDTO> productDTOList = productService.findAll(page, productCategory);
        PageDTO paging = productService.paging(page, productCategory);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        model.addAttribute("productCategory", productCategory);
        return "product/list";
    }

    @GetMapping("/findAllStar")
    public String findAllStar(@RequestParam(value = "productCategory", required = false, defaultValue = "0") int productCategory,
                              @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              Model model) {
        List<ProductDTO> productDTOList = productService.findAllStar(page, productCategory);
        PageDTO paging = productService.paging(page, productCategory);
        String star = "star";
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        model.addAttribute("star", star);
        return "product/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("q") String q,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         Model model) {
        List<ProductDTO> productDTOList = productService.search(q);
        PageDTO paging = productService.pagingQ(page, q);
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", paging);
        return "product/list";
    }

    @GetMapping("/approveList")
    public String approveForm(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              Model model) {
        List<ProductDTO> productDTOList = productService.findApproveList(page);
//        PageDTO paging = productService.paging(page);
        model.addAttribute("productList", productDTOList);
//        model.addAttribute("paging", paging);
        return "product/approve";
    }

    @GetMapping("/findVendor")
    public String findVendor(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              Model model) {
        List<ProductDTO> productDTOList = productService.findApproveList(page);
        model.addAttribute("productList", productDTOList);
        return "product/vendorProduct";
    }

    @GetMapping("/approve")
    public String approve(@RequestParam("id") Long id) {
        productService.approve(id);
        return "redirect:/product/approveList";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam("id") Long id, Model model, HttpSession session) {
        ProductDTO productDTO = productService.findById(id);
        List<ReviewDTO> reviewDTOList = reviewService.findByProductId(id);
        String clientId = (String) session.getAttribute("loginClientId");
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setProductId(id);
        likeDTO.setClientId(clientId);
        LikeDTO findLikeDTO = productService.findLike(likeDTO);
        model.addAttribute("product", productDTO);
        model.addAttribute("paging", page);
        model.addAttribute("like", findLikeDTO);
        model.addAttribute("reviewList", reviewDTOList);
        return "product/detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        if (productService.delete(id)) {
            return "redirect: /product/findAll";
        } else {
            return "product/delete-fail";
        }
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, HttpSession session,
                         Model model) {
        Long vId = (Long) session.getAttribute("loginVId");
        VendorDTO vendorDTO = vendorService.findById(vId);
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("updateVendor", vendorDTO);
        model.addAttribute("updateProduct", productDTO);
        return "product/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ProductDTO productDTO) {
        productService.update(productDTO);
        return "redirect: /product/detail?id=" + productDTO.getId();
    }




    @GetMapping("/like")
    public String likeList(@RequestParam("clientId") String clientId, Model model) {
        List<ProductDTO> productDTOList = productService.likeList(clientId);
        model.addAttribute("productList", productDTOList);
        return "product/likeList";
    }

    @PostMapping("/like")
    public @ResponseBody String like(@RequestParam("id") Long productId,
                                     @RequestParam("clientId") String clientId) {
        LikeDTO likeDTO = new LikeDTO();
        likeDTO.setProductId(productId);
        likeDTO.setClientId(clientId);
        String result = productService.like(likeDTO);
        return result;
    }

    @PostMapping("/unlike")
    public @ResponseBody String unlike(@RequestParam("id") Long productId,
                                       @RequestParam("clientId") String clientId) {
        LikeDTO unlikeDTO = new LikeDTO();
        unlikeDTO.setProductId(productId);
        unlikeDTO.setClientId(clientId);
        String result = productService.unlike(unlikeDTO);
        return result;
    }

    @GetMapping("/purchase")
    public String purchaseForm(@RequestParam("id") Long productId,
                               Model model) {
        ProductDTO productDTO = productService.findById(productId);
//        Long loginCId = (Long) session.getAttribute("loginCId");
//        ClientDTO clientDTO = clientService.findById(loginCId);
        model.addAttribute("product", productDTO);
        return "history/purchase";
    }

    @PostMapping("/purchase")
    public String purchase(@RequestParam("id") Long productId, HttpSession session) {
        ProductDTO productDTO = productService.findById(productId);
        Long loginCId = (Long) session.getAttribute("loginCId");
        if (productService.purchase(productDTO, loginCId)) {
            return "client/main";
        } else {
            return "client/purchase-fail";

        }
    }


        @GetMapping("/history")
        public String history (@RequestParam("clientId") String clientId, Model model){
            List<ProductDTO> productDTOList = productService.history(clientId);
            model.addAttribute("productList", productDTOList);
            return "product/history";
        }
    }


