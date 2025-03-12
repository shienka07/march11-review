package com.example.pilates_helper.model.dto;

import java.util.List;

public record ImageLLMBody(String model, String prompt, int width, int height, int steps, int n, String response_format) {
}