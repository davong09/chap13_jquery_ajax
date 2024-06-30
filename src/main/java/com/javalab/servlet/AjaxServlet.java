package com.javalab.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 서버 응답을 지연시키기 위해 2초 대기
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        response.setContentType("text/plain");
        response.getWriter().write("Server Response");
    }
}
