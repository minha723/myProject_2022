package com.its.project.dto;

import lombok.Data;

@Data
public class ClientDTO {
    private Long id;
    private String clientId;
    private String clientPassword;
    private String clientName;
    private String clientEmail;
    private String clientMobile;
    private Long clientPoint;

}
