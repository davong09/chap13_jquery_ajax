<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 컨텍스트패스(진입점폴더) 변수 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>

<!-- jQuery 라이브러리 import -->
<script src="<c:url value='/js/jquery-3.7.1.js'/>"></script>
<!-- 
	[테스트 준비 사항]
	1. context.xml : 데이터베이스 연결 Resource정보 설정
	2. MemberVO, MemberDAO 
	3. MembmerDAO에 isExist 메소드 추가
	//4. 응답전용 VO 클래스인 ResponseJson VO클래스 추가
 -->
<script type="text/javascript">
    $(document).ready(function() {
    	// memberId 입력칸에 이벤트 핸들러 설정, 'input' 이벤트
        $('#memberId').on('input', function() {
            var memberId = $('#memberId').val();
            // 주석처리
            /* if (memberId === '') {
                alert('아이디를 입력하세요.');
                return;
            } */
            
            $.ajax({
            	url : '<c:url value="/idCheck2"/>',	/* idCheck 서블릿 호출 */
                type: 'GET',	/* get 방식 요청 - url에 쿼리스트링으로 달려감 */
                data: { memberId: memberId }, /* {키:값} 형태의 자바스크립트 객체를 전달 */
                dataType: 'json',	/* json 타입으로 데이터를 반환받고 싶다. */
                success: function(response) { /* 반환값 response의 값은 boolean 타입 */
                	/* 서버에서 jsonResponse : {"isExist":true,"msg":""} 보내지만 클라이언트로 전달될 때는 
	                	자바스크립트 객체로 변환된다. 그래서 쩜(.) 찍고 속성값 조회할 수 있다.*/
                    if (response.isExist) {
                    	console.log(response.isExist);
                        $('#idCheckResult').html('이미 존재하는 아이디입니다.').css('color', 'red');
                    } else {
                    	console.log(response.isExist);
                        $('#idCheckResult').html('사용 가능한 아이디입니다.').css('color', 'blue');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error: ' + error);
                    alert('아이디 중복 체크 중 오류가 발생했습니다.');
                }
            });
        });
    });
</script>
</head>
<body>
    <h3>회원가입</h3>
    <form id="regForm" action="<c:url value='/member'/>" method="post">
        <div>
            아이디 : <input type="text" name="memberId" id="memberId">
            <button type="button" id="btnCheckId">중복체크</button>
        </div>
        <div id="idCheckResult" style="margin-top: 10px;"></div>    
        <div>
            비밀번호 : <input type="text" name="password" id="password">
        </div>    
        <div>
            비밀번호확인 : <input type="text" id="pwdConfirm">
        </div>    
        <div>
            이름 : <input type="text" name="name" id="name">
        </div>    
        <div>
            연락처 : <input type="text" name="phone" id="phone">
        </div>        
        <div>
            이메일 : <input type="text" name="email" id="email">
        </div>
        <div>
            <input type="submit" id="btnSubmit" value="전송">
        </div>
    </form>
</body>
</html>
