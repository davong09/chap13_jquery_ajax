package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.javalab.dao.MemberDAO;
import com.javalab.vo.ResponseVO;

@WebServlet("/idCheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

        String memberId = request.getParameter("memberId");

        MemberDAO memberDAO = new MemberDAO();
        boolean idExist = memberDAO.isIdExist(memberId);

        // 응답 MiMe타입과 자료형 UTF-8 설정
        response.setContentType("application/json; charset=utf-8");
        
        // Gson 객체 생성
        Gson gson = new Gson();

        // 응답 객체 생성
        String jsonResponse = gson.toJson(idExist);
        // 클라이언트에게 응답 해줌
        PrintWriter out = response.getWriter();
        out.println(jsonResponse);
        out.flush();
	}
}
