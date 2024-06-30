package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.vo.ProductVO;

/**
 * 상품등록 처리 서블릿 - 클라이언트에서 JSON Type 문자열 형태로 값을 받음 
 * - 구글의 Gson 라이브러리를 통해서 JSON Type
 * 문자열을 자바 객체로 매핑 (구글 gson 라이브러리 import해야 함.)
 */

@WebServlet("/insertProduct")
public class InsertProduct extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("insertProduct doPost");

        // 클라이언트에서 전송된 JSON 문자열을 productData 파라미터로 추출
        //String jsonData = request.getParameter("productData");
        //System.out.println("Servlet 받은 데이터 : " + jsonData);

        // 구글에서 제공하는 Gson 사용, 문법이 간단하고 사용하기 편함.
        Gson gson = new Gson();

        // jsonData 문자열을 ProductVO 자바 객체로 매핑(바인딩)
        // jsonData는 json 형태의 문자열이므로 이를 ProductVO 객체로 변환
        //ProductVO productVO = gson.fromJson(jsonData, ProductVO.class);
        
        // Gson 라이브러리를 통하여 JSON문자열을 편리하게 자바 객체로 매핑(바인딩)
        ProductVO productVO = gson.fromJson(request.getReader(), ProductVO.class);

        // 필요시 DAO 단으로 보내서 데이터베이스에 저장처리.......

        // 사용자에게 받은 데이터를 화면에 다시 전송하기 위해서 MIME 타입/문자인코딩 설정
        response.setContentType("application/json; charset=UTF-8");

        // 자바 객체를 다시 JSON Type 문자열로 변환.
        String jsonString = gson.toJson(productVO);
        System.out.println("서버에서 클라이언트로 보내는 JSON : " + jsonString);

        // 사용자의 웹브라우저에 쓰기
        PrintWriter out = response.getWriter();
        out.print(jsonString);
        out.flush(); // 버퍼 비우기, 버퍼를 안비우면 모든 데이터가 전송되지 않을 수 있음.
    }
}
