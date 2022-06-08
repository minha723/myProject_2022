package com.its.project.service;

import com.its.project.dto.VendorDTO;
import com.its.project.repository.VendorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class VendorService {
    @Autowired
    private VendorRepository vendorRepository;

    public String duplicateCheck(String vendorId) {
        VendorDTO vendorDTO = vendorRepository.duplicateCheck(vendorId);
        if (vendorDTO == null) {
            return "ok";
        } else {
            return "no";
        }

    }

    public boolean save(VendorDTO vendorDTO) throws IOException {
        MultipartFile vendorFile = vendorDTO.getVendorFile();
        String vendorFileName = vendorFile.getOriginalFilename();
        vendorFileName = System.currentTimeMillis() + "-" + vendorFileName;
        vendorDTO.setVendorFileName(vendorFileName);
        String savePath = "D:\\spring_img\\" + vendorFileName;
        if (!vendorFile.isEmpty()) {
            vendorFile.transferTo(new File(savePath));
        }
        int saveResult = vendorRepository.save(vendorDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public VendorDTO login(VendorDTO vendorDTO) {
        return vendorRepository.login(vendorDTO);
    }

    public List<VendorDTO> findAll() {
        return vendorRepository.findAll();
    }

    public VendorDTO findById(Long id) {
        return vendorRepository.findById(id);
    }

    public void delete(Long id) {
        vendorRepository.delete(id);
    }

    public boolean update(VendorDTO vendorDTO){
        int result = vendorRepository.update(vendorDTO);
        if(result > 0){
            return true;
        }else {
            return false;
        }
    }

    public VendorDTO findPoint(Long id) {
        return vendorRepository.findPoint(id);
    }
}
