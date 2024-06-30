package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.dao.BoardDAO;
import com.javalab.vo.BoardVO;
import com.javalab.vo.ResponseVO;

/**
 * 게시물 상세 조회 서블릿 클래스
 */
@WebServlet("/boardView")
public class BoardViewServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 게시물 상세 보기
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		System.out.println("BoardViewServlet doGet()");
		
		// 파라미터 추출
		int bno = 0;		
		if(request.getParameter("bno") != null 
					&& !request.getParameter("bno").trim().isEmpty()) {
			bno = Integer.parseInt(request.getParameter("bno"));
		}

		// 게시물 조회
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardVO boardVO = boardDAO.getBoard(bno);
		
		// 자바 객체를 다시 JSON Type 문자열로 변환.
		// - Gson 라이브러리를 이용해서 자바 객체를 json type 문자열로 변환
		Gson gson = new Gson();		
		ResponseVO responseJson;
		
		response.setContentType("application/json; charset=utf-8");
		
        if (boardVO != null) {
            responseJson = new ResponseVO(true, gson.toJson(boardVO));
        } else {
            responseJson = new ResponseVO(false, "해당 게시물이 존재하지 않습니다.");
        }
        
        String jsonString = gson.toJson(responseJson);
		
		System.out.println("서블릿, 클라이언트로 보낼 JSON 문자열 : " + jsonString);

		// 5.3 사용자의 웹브라우저에 쓰기
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
}
