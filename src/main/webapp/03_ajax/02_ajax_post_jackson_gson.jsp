<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  	<!-- jQuery 라이브러리 import -->
  	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btnSubmit').on('click', function(e){
			e.preventDefault();
			
			// form 입력값 추출
			let memberId = $('#memberId').val();
			let password = $('#password').val();
			
			// 폼 입력값으로 자바스크립트 객체 생성
			let member = {
				memberId: memberId,
				password: password
			}
			// 자바스크립트 객체 -> JSON 문자열로 변환
			let memberStr = JSON.stringify(member);
			console.log('memberStr : ' + memberStr);
			
			/*
			  - url: '<c:url value="/example"/>',
			  - type: 'get' 또는 'post',  
			  - data:memberStr(JSON문자열) 또는 (자바스크립트 객체)
			  - contentType: "application/json; charset=UTF-8" : 서버에서 반환받을 데이터 타입
			  - data: memberStr, : 서버로 보낼 데이터 타입 
 			  - success 콜백 : 요청 성공시 호출됨.
 			  - error 콜백 : 요청 실패시 호출됨.
 			  - complete 콜백 : 요청 성공/실패 상관없이 호출됨.
 			  
 			  [data:자바스크립트 객체]
			  1. type을 'get'방식, data를 자바스크립트 형태로 전달하면 url 쿼리스트링에
			  파라미터가 담아져서 서버로 전달된다.
			  2. 'post' 방식으로 자바스크립트 객체를 전달하면 메시지 바디에
			  파라미터가 담아져서 서버로 전달된다. 이럴 때는 request.getParmater("") 형태로 꺼낼 수 있다.
			  [data:JSON문자열]
			  3. get 또는 post 방식으로 JSON 타입 문자열을 전달하면 다음과 같은 형태로
			  파라미터를 꺼내야 한다.
			  - ObjectMapper.readValue(request.getReader(), MemberVO.class);  형태로 추출 가능.
			  - Gson.fromJson(request.getReader(), MemberVO.class); 형태로 추출 가능  
			*/
			
			$.ajax({
				url: '<c:url value="/example"/>',	// /example이라는 서블릿 호출
				type: 'post',	// get방식으로 요청하겠다
				data: memberStr,	//서버로 보낼 데이터 타입
				dataType: 'json',	// 서버에서 데이터를 전달받을때 json타입으로 받겠다.
				contentType: "application/json; charset=UTF-8", // 서버로 보낼 데이터 타입
				// response : 서버에서 반환받은 데이터, 이 데이터의 타입이 JSON 이면 
				// jQuery에 의해서 자바스크립 객체로 자동으로 변환시켜준다.
				success: function(response){	
					console.log('1. 작업성공후 success 콜백 호출됨');
					console.log(response.memberId); // hong
				},
				error: function(xhr, status, error){
					console.log('2. 작업실패 error 콜백 호출됨');
				},
				complete: function(response, textStatus){
					console.log('3. 작업 성공/실패 상관없이 completer 콜백 호출됨');
				}
			}); // end ajax
		});
	});
</script>
</head>
<body>
	<form action="https:/www.naver.com" method="get">
		id : <input type="text" id="memberId" name="memberId"><br>
		pwd : <input type="password" id="password" name="password"><br>
		<input type="submit" id="btnSubmit" value="전송"><br>		
	</form>
	<div id="result"></div>
</body>
</html>