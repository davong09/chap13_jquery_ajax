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
			
			/*
			  url: '<c:url value="/example"/>',
			  type: 'get',  
			  data:{memberId: 'hong', password: '1234'},	//서버로 보낼 데이터(자바스크립객체)
			  위와 같은 형태로 요청하면 /example?memberId=hong&password=1234와 같이 요청된다.
			  - 서버에서는 request.getParameter("memberId")와 같이 추출 가능
			*/
			$.ajax({
				url: '<c:url value="/example"/>',	// /example이라는 서블릿 호출
				type: 'get',	// get방식으로 요청하겠다
				data:{memberId: 'hong', password: '1234'},	//서버로 보낼 데이터(자바스크립객체)
				dataType: 'json',	// 서버에서 데이터를 전달받을때 json타입으로 받겠다.
				// response : 서버에서 보낸 데이터, 이 데이터는 jQuery에 의해서 자바스크립 객체로 변환된 상태로 제공된다.
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
		id : <input type="text" id="id" name="id"><br>
		pwd : <input type="password" id="pwd" name="pwd"><br>
		<input type="submit" id="btnSubmit" value="전송"><br>		
	</form>
	<div id="result"></div>
</body>
</html>