<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Input Form</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        $('#movieForm').on('submit', function(e){
            e.preventDefault();
			// 폼의 입력값을 자바스크립트 객체 생성
            let movie = {
            	movieId : $('#movieId').val(),
                title : $('#title').val(),
                releaseDate: $('#releaseDate').val(),
                director: $('#director').val()
            };
			// 자바스크립트 객체를 JSON 변환
            let jsonData = JSON.stringify(movie);
            console.log('Sending JSON data:', jsonData);
			// 비동기 호출
            $.ajax({
                url: '<c:url value="/insertMovie"/>',
                type: 'POST',	/* 파라미터가 메시지 바디에 담겨서 서버로 전달 */
                /* 자바스크립트 객체 키:productData, jsonData: 상품JSON문자열 */
                data: jsonData, 
                dataType: 'json', /* 반환결과는 JSON 달라 */
                success: function(response) {
                    /* alert('서버에서 성공적으로 데이터를 전송받음'); */
                    console.log(response);
                    console.log('Server에서 받은 응답:', response.movieId);
                    $('#result').html(response.movieId + " / " + response.title);
                    
                 	// 백틱을 사용하여 result div에 출력
                 	// 백틱을 jsp 페이지의 자바스크립트 부분에서 사용하려면 (변수) 앞에 \을 붙여야 함.
                 	// 많이 사용할 경우 별도의 js파일로 분리하면 \ 안붙여도 됨.
                 	// jsp에서는 백틱을 사용해서 안에도 달러{변수값} JSTL 이것을 EL로 인식해버림. 그렇게 하지 말라고 이스케이브 문자인 \(역슬래시)를 앞에다 넣어준다.
                    $('#result').html(`
                    		  <p>영화 ID: \${response.movieId}</p>
                    		  <p>영화 제목: \${response.title}</p>
                    		  <p>개봉일: \${response.releaseDate}</p>
                    		  <p>감독: \${response.director}</p>
                    		`);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
    });
</script>
</head>
<body>
	<h3>상품등록</h3>
	<form id="movieForm">
		<div>
			<label for="movieId">영화 ID:</label> <input type="text" id="movieId"
				name="movieId">
		</div>
		<div>
			<label for="title">영화 제목:</label> <input type="text" id="title"
				name="title">
		</div>
		<div>
			<label for="releaseDate">개봉일:</label> <input type="text"
				id="releaseDate" name="releaseDate">
		</div>
		<div>
			<label for="director">감독:</label> <input type="text" id="director"
				name="director">
		</div>
		<input type="submit" value="전송">
	</form>
	<div id="result"></div>
	<!-- 결과를 출력할 div 추가 -->
</body>
</html>
