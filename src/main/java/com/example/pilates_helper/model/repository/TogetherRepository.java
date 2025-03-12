package com.example.pilates_helper.model.repository;

import com.example.pilates_helper.model.dto.APIClientParam;
import com.example.pilates_helper.model.dto.BaseLLMBody;
import com.example.pilates_helper.model.dto.ReasoningLLMBody;
import com.example.pilates_helper.model.dto.TogetherAPIParam;
import com.example.pilates_helper.util.APIClient;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TogetherRepository implements APIClient {
    private TogetherRepository()
    {}
    private final static TogetherRepository instance = new TogetherRepository();
    public static TogetherRepository getInstance() {
        return instance;
    }
    private final ObjectMapper objectMapper = new ObjectMapper();

    public String callAPI(TogetherAPIParam param) throws JsonProcessingException {
        String token = dotenv.get("TOGETHER_KEY");
        String method = "POST";
        String[] headers = new String[]{
                "Authorization", "Bearer %s".formatted(token),
                "Content-Type", "application/json"
        };
        String url, body, model;
        switch (param.modelType()) {
            case BASE:
                model = "meta-llama/Llama-3.3-70B-Instruct-Turbo-Free";
                url = "https://api.together.xyz/v1/chat/completions";
                body = objectMapper.writeValueAsString(new BaseLLMBody(model, List.of(new BaseLLMBody.Message("user", param.prompt()))));
                break;
            case REASONING:
                model = "deepseek-ai/DeepSeek-R1-Distill-Llama-70B-free";
                url = "https://api.together.xyz/v1/chat/completions";
                body = objectMapper.writeValueAsString(new ReasoningLLMBody(model, List.of(new ReasoningLLMBody.Message("user", param.prompt())), 4096));
                break;
            default:
                throw new RuntimeException("Unsupported together model type");
        }
        return APIClient.super.callAPI(new APIClientParam(url, method, body, headers));
    }
}