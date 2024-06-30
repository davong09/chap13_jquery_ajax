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
		$('#changeBtn2').on('click', function(e){
			e.preventDefault();
			
			let id = $('#id').val(); // id값 추출
			let pwd = $('#pwd').val(); // pwd값 추출
			
			// {id: '1', pwd: '2'}
			/* let member = new Object();	// 자바스크립트 객체 생성 Object()사용
			member.id = id;	
			member.pwd = pwd; */
			
			// 자바스크립트 객체 생성의 또다른 방법, 속성과 값을 할당 할때 ":"사용함.
			let member = {
				id : id,
				pwd : pwd
			}
			
			console.log('member', member);
			
			let memberStr = JSON.stringify(member); // 자바스크립트 객체를 편리하게 JSON문자열 변환
			console.log('memberStr : ' + memberStr);

			// 불편하게 JSON문자열을 수동으로 만드는 방법
			let temp = '{' + '"id"'+ ":" + '"' + id + '", "pwd"' + ':"' + pwd + '"}';
			console.log('tmep', temp);
			
			// JSON 문자열을 다시 자바스크립트로 변환
			let member2 = JSON.parse(memberStr);
			console.log('JSON 문자열에서 다시 자바스크립트 객체로 변환 : ', member2);
		});
	});
</script>
</head>
<body>
	<form action="https:/www.naver.com" method="get">
		id : <input type="text" id="id" name="id"><br>
		pwd : <input type="password" id="pwd" name="pwd"><br>
		<input type="submit" id="changeBtn2" value="전송"><br>		
	</form>
	<div id="result"></div>
</body>
</html>