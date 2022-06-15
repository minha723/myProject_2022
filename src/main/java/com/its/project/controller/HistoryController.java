package com.its.project.controller;


import com.its.project.dto.HistoryDTO;
import com.its.project.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
@RequestMapping("/history")
public class HistoryController {
    @Autowired
    private HistoryService historyService;

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<HistoryDTO> historyDTOList = historyService.findAll();
        model.addAttribute("historyList", historyDTOList);
        return "history/list";
    }
    @GetMapping("/findVendor")
    public String findVendor(Model model){
        List<HistoryDTO> historyDTOList = historyService.findAll();
        model.addAttribute("historyList", historyDTOList);
        return "history/vendorHistory";
    }
}
