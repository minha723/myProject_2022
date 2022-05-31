package com.its.project.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class VendorDTO {
    private Long id;
    private String vendorId;
    private String vendorPassword;
    private String vendorName;
    private String vendorEmail;
    private String vendorMobile;
    private Long vendorPoint;
    private String vendorFileName;
    private MultipartFile vendorFile;
}
