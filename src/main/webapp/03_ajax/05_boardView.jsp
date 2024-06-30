<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
  <title>비동기로 게시물 조회(Ajax)</title>
	<!--jQuery import -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	 <script type="text/javascript">
	 	// $(document).ready(function(){
	 	$(function() {
	 		//body에 배경색 적용, 화면 로딩후 바로 적용됨. 
			$('body').css('background-color', 'lightBlue');
	 		
	 		// btnSubmit의 onclick 이벤트 처리기(리스너, 핸들러)
	        //$("#btnSubmit").on('click', function() {
        	$("#bno").on('input', function() {
        		var bno = 0; 
        		bno = $('#bno').val();		// 게시물 번호
	    		
	    	   	// ajax 함수를 통해서 서버에 전송
	    	   	$.ajax({
                  type: "get",	/* get방식 요청 */
                  url: "<c:url value='/boardView'/>",
               	  // 서버로 보낼 데이터 자바스크립트 객체형태 {bno(키) : bno(변수)}
                  // boardView?bno=hong (쿼리스트링)
                  data: { bno: bno }, 
                  dataType: "json", // 서버로부터 받을 데이터 타입
                  // 서버에서 JSON 문자열 : {"isExist":true,"msg":"{\"bno\":1,\"title\":\"First Post\",\"content\":\"This is the first post.\",\"memberId\":\"java\",\"hitNo\":0,\"regDate\":\"1월 1, 2022\",\"pageNum\":\"1\",\"listCount\":10,\"pagerPerBlock\":10,\"replyGroup\":1,\"replyOrder\":0,\"replyIndent\":0}"}
                  // json 문자열 안에 또다른 JSON 문자열(msg)이 있다.
                  success: function(result) { /* result : 자바스크립트 객체 형태 */
                    console.log(result);
                    $('#output').empty(); // 게시물 목록을 그려넣을 공간 클리어

                    if (result.isExist) {
                      /* JSON.parse(JSON문자열) 함수 :
                         - ResponseVO의 msg부분에 저장되어 있는 JSON 문자열(게시물내용)을
                      	   자바스크립트 객체로 파싱(변환) */
                      let board = JSON.parse(result.msg); // board : 자바스크립트 객체
                      var table = `
                        <table border='1'>
                          <tr><th>제목</th><td>\${board.title}</td></tr>
                          <tr><th>작성자</th><td>\${board.memberId}</td></tr>
                          <tr><th>내용</th><td>\${board.content}</td></tr>
                          <tr><th>조회수</th><td>\${board.hitNo}</td></tr>
                          <tr><th>작성일</th><td>\${board.regDate}</td></tr>
                        </table>`;
                      $('#output').append(table); /* 위에서 만든 table 문자열로 테이블 생성 */
                    } else {
                      $('#output').text(result.msg); /* isExist가 false이면 msg값 출력 */
                    }
                  },
                  error: function(data, textStatus) {
                    console.log("조회중 에러가 발생했습니다.");
                  },
                  complete: function(data, textStatus) {
                    console.log("complete 콜백");
                  }
                }); //end ajax
			})	// end onclick
		})	// end $(function() {
	 </script>
	 
</head>
<body>
	<form action="" method="get">
		<h3 style="text-align: center">게시물 조회</h3>
		<h5 style="text-align: center">조회를 원하는 게시물 번호를 입력하세요.</h5>
		게시물 번호 : <input type="text" name="bno" id="bno" /><br>
		<input type="button" id="btnSubmit" value="조회"  /><br><br>
	</form>

    <div id="output"></div>
    
</body>
</html>