package com.example.pilates_helper.controller;

import com.example.pilates_helper.controller.Controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.pilates_helper.service.TogetherService;


import java.io.IOException;

@WebServlet ("/")
public class RootController extends Controller {
    final static TogetherService togetherService = TogetherService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        view(req, resp, "index");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String question = req.getParameter("question");
        log(question);
        HttpSession session = req.getSession();
        if (question == null || question.isEmpty()) {
            session.setAttribute("message", "질문이 비어 있습니다!");
            view(req, resp, "index");
            return;
        }
        session.setAttribute("message", null);
        session.setAttribute("question", question);
        String basePrompt = togetherService.useBaseModel(question);
        session.setAttribute("answer", basePrompt);
        resp.sendRedirect(req.getContextPath() + "/answer");
    }
}