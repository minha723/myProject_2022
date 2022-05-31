package com.its.project.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductDTO {
    private Long id;
    private String vendorId;
    private String productName;
    private String productDesc;
    private String productFileName;
    private MultipartFile productFile;
    private Long productPrice;
    private double productStar;
    private int productApproval;
}
