package com.its.project.service;

import com.its.project.dto.LikeDTO;
import com.its.project.dto.PageDTO;
import com.its.project.dto.ProductDTO;
import com.its.project.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    private static final int BLOCK_LIMIT = 3;
    private static final int PAGE_LIMIT = 6;

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

    public List<ProductDTO> findAll(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return productRepository.findAll(pagingParam);
    }

    public List<ProductDTO> findAllStar(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return productRepository.findAllStar(pagingParam);
    }
    public PageDTO paging(int page) {
    int productCount = productRepository.productCount();
    int maxPage = (int) (Math.ceil((double) productCount/PAGE_LIMIT));
    int startPage = (((int)(Math.ceil((double) page/BLOCK_LIMIT))) -1) * BLOCK_LIMIT + 1;
    int endPage = startPage + BLOCK_LIMIT -1;
        if (endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }

    public void approve(Long id) {
        productRepository.approve(id);
    }


    public List<ProductDTO> search(String q) {
        return productRepository.search(q);
    }

    public boolean delete(Long id) {
        int deleteResult =  productRepository.delete(id);
        if(deleteResult>0){
            return true;
        }else {
            return false;
        }
    }

    public void update(ProductDTO productDTO) {
        productRepository.update(productDTO);
    }

    public void like(LikeDTO likeDTO) {
        productRepository.like(likeDTO);
    }
}
