package com.its.project.service;

import com.its.project.dto.HistoryDTO;
import com.its.project.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryService {
    @Autowired
    private HistoryRepository historyRepository;

    public List<HistoryDTO> findAll() {
        return historyRepository.findAll();
    }
}
