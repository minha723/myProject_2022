package com.its.project.service;

import com.its.project.dto.ProductDTO;
import com.its.project.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public boolean save(ProductDTO productDTO) throws IOException {
        MultipartFile productFile = productDTO.getProductFile();
        String productFileName = productFile.getOriginalFilename();
        productFileName = System.currentTimeMillis() + "-" + productFileName;
        productDTO.setProductFileName(productFileName);
        String saveProPath = "D:\\product_img\\" + productFileName;
        if(!productFile.isEmpty()){
            productFile.transferTo(new File(saveProPath));
        }
        int saveResult = productRepository.save(productDTO);
        if(saveResult>0){
            return true;
        }else {
            return false;
        }
    }

    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }
}
