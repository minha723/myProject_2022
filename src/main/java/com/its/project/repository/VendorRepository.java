package com.its.project.repository;

import com.its.project.dto.VendorDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VendorRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public VendorDTO duplicateCheck(String vendorId) {
        return sql.selectOne("Vendor.duplicateCheck", vendorId);
    }

    public int save(VendorDTO vendorDTO) {
        return sql.insert("Vendor.save", vendorDTO);
    }

    public VendorDTO login(VendorDTO vendorDTO) {
        return sql.selectOne("Vendor.login", vendorDTO);
    }
}
