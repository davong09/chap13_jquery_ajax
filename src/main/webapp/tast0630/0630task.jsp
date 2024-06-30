<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0630과제</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
    	let mnoCounter = 1; // member번호 초기값 설정
    	let pnoCounter = 1; // post번호 초기값 설정
    	let hitNo = 0;
    	
        $('#memberForm').on('submit', function(e){
            e.preventDefault();
            
            // mno 값을 설정하고 1씩 증가
            $('#mno').val(mnoCounter);
            mnoCounter++;
            
			// 폼의 입력값을 자바스크립트 객체 생성
            let member = {
				mno : $('#mno').val(),
            	memberId : $('#memberId').val(),
            	password : $('#password').val(),
                name: $('#name').val(),
                email: $('#email').val()
            };
			
			// 자바스크립트 객체를 JSON 변환
            let jsonData = JSON.stringify(member);
            console.log('Sending JSON data:', jsonData);
            
			// 비동기 호출
            $.ajax({
                url: '<c:url value="/insertMember"/>',
                type: 'POST',	/* 파라미터가 메시지 바디에 담겨서 서버로 전달 */
                /* 자바스크립트 객체 키:productData, jsonData: 상품JSON문자열 */
                data: jsonData, 
                dataType: 'json', /* 반환결과는 JSON 달라 */
                success: function(response) {
                    /* alert('서버에서 성공적으로 데이터를 전송받음'); */
                    console.log(response);
                    console.log('Server에서 받은 응답:', response.memberId);
                    
                 	// 백틱을 사용하여 result div에 출력
                 	// 백틱을 jsp 페이지의 자바스크립트 부분에서 사용하려면 (변수) 앞에 \을 붙여야 함.
                 	// 많이 사용할 경우 별도의 js파일로 분리하면 \ 안붙여도 됨.
                 	// jsp에서는 백틱을 사용해서 안에도 달러{변수값} JSTL 이것을 EL로 인식해버림. 그렇게 하지 말라고 이스케이브 문자인 \(역슬래시)를 앞에다 넣어준다.
                    $('#resultm').append(`
                    	<tr>
                            <td>\${response.mno}</td>
                            <td>\${response.memberId}</td>
                            <td>\${response.name}</td>
                            <td>\${response.email}</td>
                        </tr>
                    `);
                        
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });
        
        $('#postForm').on('submit', function(e){
            e.preventDefault();
            
            // mno 값을 설정하고 1씩 증가
            $('#pno').val(pnoCounter);
            pnoCounter++;
            
			// 폼의 입력값을 자바스크립트 객체 생성
            let post = {
				pno : $('#pno').val(),
            	title : $('#title').val(),
            	content : $('#content').val(),
            	memberId2 : $('#memberId2').val(),
                hitNo : $('#hitNo').val(),
                regDate : $('#regDate').val()
            };
			
			// 자바스크립트 객체를 JSON 변환
            let jsonData = JSON.stringify(post);
            console.log('Sending JSON data:', jsonData);
            
			// 비동기 호출
            $.ajax({
                url: '<c:url value="/insertPost"/>',
                type: 'POST',	/* 파라미터가 메시지 바디에 담겨서 서버로 전달 */
                /* 자바스크립트 객체 키:productData, jsonData: 상품JSON문자열 */
                data: jsonData, 
                dataType: 'json', /* 반환결과는 JSON 달라 */
                success: function(response) {
                    /* alert('서버에서 성공적으로 데이터를 전송받음'); */
                    console.log(response);
                    console.log('Server에서 받은 응답:', response.title);
                    
                 	// 백틱을 사용하여 result div에 출력
                 	// 백틱을 jsp 페이지의 자바스크립트 부분에서 사용하려면 (변수) 앞에 \을 붙여야 함.
                 	// 많이 사용할 경우 별도의 js파일로 분리하면 \ 안붙여도 됨.
                 	// jsp에서는 백틱을 사용해서 안에도 달러{변수값} JSTL 이것을 EL로 인식해버림. 그렇게 하지 말라고 이스케이브 문자인 \(역슬래시)를 앞에다 넣어준다.
                    $('#resultp').append(`
                    	<tr>
                            <td>\${response.pno}</td>
                            <td>\${response.title}</td>
                            <td>\${response.memberId2}</td>
                            <td>\${response.hitNo}</td>
                            <td>\${response.regDate}</td>
                        </tr>
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
	<form id="memberForm">
		<table border='1'>
			<thead>
				<tr>
					<th colspan='2'>회원정보 입력</th>
				</tr>
				<tr hidden>
					<th>순번</th>
					<th><input type="hidden" id="mno" name="mno"></th>
					<!-- hidden으로 변경 -->
				</tr>
				<tr>
					<th>memberId</th>
					<th><input type="text" id="memberId" name="memberId"></th>
				</tr>
				<tr>
					<th>password</th>
					<th><input type="password" id="password" name="password"></th>
				</tr>
				<tr>
					<th>name</th>
					<th><input type="text" id="name" name="name"></th>
				</tr>
				<tr>
					<th>email</th>
					<th><input type="text" id="email" name="email"></th>
				</tr>
			</thead>
		</table>
		<input type="submit" value="등록버튼">
	</form>
	<table id="resultm" border='1'>
		<tr>
			<th>순번</th>
			<th>회원번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
	</table>
	<br>

	<form id="postForm">
		<table border='1'>
			<thead>
				<tr>
					<th colspan='2'>게시물 등록</th>
				</tr>
				<tr hidden>
					<th>bno</th>
					<th><input type="hidden" id="pno" name="pno"></th>
				</tr>
				<tr>
					<th>title</th>
					<th><input type="text" id="title" name="title"></th>
				</tr>
				<tr>
					<th>content</th>
					<th><input type="text" id="content" name="content"></th>
				</tr>
				<tr>
					<th>memberId</th>
					<th><input type="text" id="memberId2" name="memberId2"></th>
				</tr>
				<tr>
					<th>hitNo</th>
					<th><input type="number" id="hitNo" name="hitNo"></th>
				</tr>
				<tr>
					<th>regDate</th>
					<th><input type="date" id="regDate" name="regDate"></th>
				</tr>
			</thead>
		</table>
		<input type="submit" value="등록버튼">
	</form>
	<table id="resultp" border='1'>
		<tr>
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</table>
</body>
</html>
