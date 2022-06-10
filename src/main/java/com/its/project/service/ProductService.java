package com.its.project.service;

import com.its.project.dto.*;
import com.its.project.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ClientService clientService;

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

    public String like(LikeDTO likeDTO) {
        int likeResult = productRepository.like(likeDTO);
        if(likeResult>0){
            return "ok";
        }else {
            return "no";
        }
    }

    public LikeDTO findLike(LikeDTO likeDTO) {
    return productRepository.findLike(likeDTO);
    }

    public List<ProductDTO> likeList(String clientId) {
        List<LikeDTO> likeList = productRepository.likeList(clientId);
        List<ProductDTO> productList = new ArrayList<>();
        if(likeList == null){
            return null;
        }
        for (LikeDTO like: likeList) {
            ProductDTO likeProduct = productRepository.findById(like.getProductId());
            productList.add(likeProduct);
        } return productList;
    }

    public String unlike(LikeDTO unlikeDTO) {
        int unlikeResult = productRepository.unlike(unlikeDTO);
        if(unlikeResult>0){
            return "ok";
        }else {
            return "no";
        }
    }

    public List<ProductDTO> findApproveList(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        return productRepository.findApproveList(pagingParam);
    }

    public boolean purchase(ProductDTO productDTO, Long loginCId) {
        ClientDTO clientDTO = clientService.findById(loginCId);
        HistoryDTO historyDTO = new HistoryDTO();
        if(clientDTO.getClientPoint() >= productDTO.getProductPrice()){
            historyDTO.setProductId(productDTO.getId());
            historyDTO.setClientId(clientDTO.getClientId());
            historyDTO.setVendorId(productDTO.getVendorId());
            historyDTO.setProductPrice(productDTO.getProductPrice());
            int result = productRepository.purchase(historyDTO);
            if(result>0){
                return true;
            }else {
                return false;
            }
        }else{
            return false;
        }
    }

    public List<ProductDTO> history(String clientId) {
        List<HistoryDTO> historyDTOList = productRepository.findHistory(clientId);
        List<Map<String, Object>> list = productRepository.findHistoryJoin(clientId);
        for (Map<String, Object> map: list) {
            System.out.println("map 성공" + map.get("HIS_ID"));
        }
        List<ProductDTO> productDTOList = new ArrayList<>();
        if(historyDTOList == null){
            return null;
        }
            for (HistoryDTO h: historyDTOList) {
                ProductDTO productDTO = productRepository.findById(h.getProductId());
                productDTOList.add(productDTO);
            }return productDTOList;
    }

}
