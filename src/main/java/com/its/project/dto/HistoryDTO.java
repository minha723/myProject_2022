package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class HistoryDTO {
    private Long id;
    private String vendorId;
    private String clientId;
    private Long productId;
    private Timestamp createdTime;
}
