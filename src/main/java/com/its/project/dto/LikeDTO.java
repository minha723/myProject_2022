package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class LikeDTO {
    private Long id;
    private Long productId;
    private String clientId;
}
