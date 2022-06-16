package com.its.project.service;

import com.its.project.dto.ClientDTO;
import com.its.project.repository.ClientRepository;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Service
public class ClientService implements ClientService1 {
    @Autowired
    private ClientRepository clientRepository;
    public String duplicateCheck(String clientId) {
        ClientDTO clientDTO = clientRepository.duplicateCheck(clientId);
        if(clientDTO == null){
            return "ok";
        }else {
            return "no";
        }
    }

    public ClientDTO save(ClientDTO clientDTO) {
        return clientRepository.save(clientDTO);
    }

    public ClientDTO login(ClientDTO clientDTO) {
        return clientRepository.login(clientDTO);
    }

    public List<ClientDTO> findAll() {
        return clientRepository.findAll();
    }

    public ClientDTO findById(Long id) {
        return clientRepository.findById(id);
    }

    public void delete(Long id) {
        clientRepository.delete(id);
    }

    public boolean update(ClientDTO clientDTO) {
        int result = clientRepository.update(clientDTO);
        if(result > 0){
            return true;
        }else {
            return false;
        }
    }

    public void point(ClientDTO clientDTO) {
        clientRepository.point(clientDTO);
    }

    public ClientDTO kakaoLogin(String kakaoId) {
        return clientRepository.findByKakaoId(kakaoId);
    }


    public void pointUse(ClientDTO clientDTO) {
        clientRepository.pointUse(clientDTO);
    }
    @Override
    public void sendEmail(ClientDTO client, String div) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";
        String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
        String hostSMTPid = "";//네이버 아이디
        String hostSMTPpwd = "";//네이버비번

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = ""; //네이버아이디(@뒤에까지)
        String fromName = "Robyn's Market";
        String subject = "";
        String msg = "";

        if(div.equals("findpw")) {
            subject = "롸빈마켓 임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += client.getClientId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += client.getClientPassword() + "</p></div>";
        }

        // 받는 사람 E-Mail 주소
        String mail = client.getClientEmail();
        String toName = client.getClientId();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(465); //네이버 이용시 587

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, toName, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }
    @Override
    public void findPw(HttpServletResponse response, ClientDTO client) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        ClientDTO ck = clientRepository.duplicateCheck(client.getClientId());
        PrintWriter out = response.getWriter();
        // 가입된 아이디가 없으면
        if(clientRepository.duplicateCheck(client.getClientId()) == null) {
            out.print(client.getClientId());
            out.print("등록되지 않은 아이디입니다.");
            out.close();
        }
        // 가입된 이메일이 아니면
        else if(!client.getClientEmail().equals(ck.getClientEmail())) {
            out.print("등록되지 않은 이메일입니다.");
            out.close();
        }else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            client.setClientPassword(pw);
            // 비밀번호 변경
            clientRepository.updatePw(client);
            // 비밀번호 변경 메일 발송
            sendEmail(client, "findpw");

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
        }
    }
}
