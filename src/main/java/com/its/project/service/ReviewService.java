package com.its.project.service;

import com.its.project.dto.ClientDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.dto.ReviewDTO;
import com.its.project.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private ProductService productService;


    public void save(ReviewDTO reviewDTO) {
        ProductDTO productDTO = productService.findById(reviewDTO.getProductId());
        if(productDTO.getProductStar() ==0){
            productDTO.setProductStar(reviewDTO.getReviewStar());
        } else {
        productDTO.setProductStar((productDTO.getProductStar()+reviewDTO.getReviewStar())/2);
        }
        productService.update(productDTO);
        reviewRepository.save(reviewDTO);
    }
}
