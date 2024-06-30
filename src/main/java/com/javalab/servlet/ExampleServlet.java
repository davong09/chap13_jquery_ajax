package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.javalab.vo.MemberVO;
/**
 * 비동기 요청 처리 서블릿
 * - get 요청은
 * - post 요청
 * @author magic
 *
 */
@WebServlet("/example")
public class ExampleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 전송한 파라미터 추출
        String memberId = request.getParameter("memberId");
        String password = request.getParameter("password");
        
        // 클라이언트에서 전달받은 값으로 다시 JSON 문자열 만듦, 
        String jsonResponse = "{\"memberId\":\"" + memberId + "\", \"password\":\"" 
        			+ password + "\"}";
        // 클라이언트에게 전송할 MIME 타입 설정, JSON이다.
        response.setContentType("application/json");
        // 전송할 데이터에 한글이 있을수도 있으니 UTF-8인코딩한다.
        response.setCharacterEncoding("UTF-8");
        
        // getWriter() : 클라이언트에게 출력할 출력 스트림을 얻는다.
        // write() : 위에서 얻은 출력스트림에 데이터를 쓴다.
        response.getWriter().write(jsonResponse);
    }
    /**
     * ObjectMapper : 자바에서 기본으로 제공해주는 라이브러리 사용해서 JSON문자열 <--> 자바객체 변환
     * - jackson-databind/core/annotation 라이브러리 import 필요 
     */
    protected void doPost(HttpServletRequest request, 
    		HttpServletResponse response) throws ServletException, 
    		IOException {

    	System.out.println("doPost");
    	
    	// JSON문자열 <--> 자바객체 변환을 도와주는 객체
        ObjectMapper mapper = new ObjectMapper();
        // readValue : JSON 문자열을 자바 객체로 변환
        MemberVO memberVO = mapper.readValue(request.getReader(), 
        												MemberVO.class);

        // 클라이언트에게 응답을 보낼 데이터 설정
        // writeValueAsString() : 자바 객체를 JSON 문자열로 변환
        String jsonResponse = mapper.writeValueAsString(memberVO);
        
        response.setContentType("application/json");	// 클라이언트로 내려보낼 데이터타입
        response.setCharacterEncoding("UTF-8");	// UTF-8 인코딩해라
        
        response.getWriter().write(jsonResponse);
    }

    /**
     * gson 라이브러리 사용해서 JSON문자열 <--> 자바객체 변환
     * - google gson 라이브러리 import 필요
     */
    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");

        // 클라이언트에서 전송한 JSON 데이터를 추출하여 자바 객체로 변환하기 위한 gson객체 생성
        Gson gson = new Gson();
        // request.getReader() : 클라이언트에서 전송한 JSON 데이터를 읽어온다. 
        // 읽어온 문자열을 MemberVO 자바 객체로 변환
        MemberVO memberVO = gson.fromJson(request.getReader(), MemberVO.class);

        // 데이터베이스 저장 또는 한 회원조회...............
        //MemberVO memberVO2 = new MemberVO();
        
        
        // 클라이언트에게 응답을 보낼 데이터 설정
        // gson.toJson() : 자바 객체를 간편하게 JSON 문자열로 변환해준다.
        String jsonResponse = gson.toJson(memberVO);
        
        // 클라이언트로 내려보낼 데이터의 타입 지정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8"); // utf-8로 인코딩

        response.getWriter().write(jsonResponse);        
    }   
    */
}

