package com.its.project.service;

import com.its.project.dto.ClientDTO;

import javax.servlet.http.HttpServletResponse;

public interface ClientService1 {

    public void sendEmail(ClientDTO client, String div) throws Exception;

    //비밀번호찾기
    public void findPw(HttpServletResponse resp, ClientDTO client) throws Exception;

}
