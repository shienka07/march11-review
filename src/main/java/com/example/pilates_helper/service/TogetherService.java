package com.example.pilates_helper.service;

import com.example.pilates_helper.model.dto.ModelType;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.example.pilates_helper.model.dto.TogetherAPIParam;
import com.example.pilates_helper.model.repository.TogetherRepository;

public class TogetherService {
    private TogetherService() {}
    private static final TogetherService instance = new TogetherService();
    private ObjectMapper objectMapper = new ObjectMapper();
    private TogetherRepository repository = TogetherRepository.getInstance();
    public static TogetherService getInstance() {
        return instance;
    }

    public String useBaseModel(String prompt) throws JsonProcessingException {
        return repository.callAPI(new TogetherAPIParam(prompt, ModelType.BASE));
    }

    public String useReasoning(String prompt) throws JsonProcessingException {
        return repository.callAPI(new TogetherAPIParam(prompt, ModelType.REASONING));
    }

    public String useImage(String prompt) throws JsonProcessingException {
        return repository.callAPI(new TogetherAPIParam(prompt, ModelType.IMAGE));
    }
}