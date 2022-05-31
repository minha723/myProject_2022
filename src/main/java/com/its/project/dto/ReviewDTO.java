package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReviewDTO {
    private Long id;
    private Long productId;
    private String clientId;
    private String reviewContents;
    private double reviewStar;
    private Timestamp reviewCreatedTime;
}
