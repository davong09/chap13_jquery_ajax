<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Example1</title>

<style type="text/css">
.backColor {
    background-color: #028c6a;
}
</style>

<!-- jQuery 라이브러리 import -->
<script src="<c:url value='/js/jquery-3.7.1.js'/>"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#btnSend').click(function() {
        var jsonObject = {
            memberId: 'hong',
            password: '1234'
        };

        $.ajax({
            url: '<c:url value="/example"/>', // 서버의 Servlet 경로
            method: 'GET',
            data: jsonObject, // JSON 객체를 그대로 전송
            success: function(response) {
                console.log('서버로부터 응답 받음:', response);
                $('#message').text('서버로부터 응답 받음: ' + JSON.stringify(response));
            },
            error: function(xhr, status, error) {
                console.error('요청 실패:', error);
            }
        });
    });
});
</script>
</head>
<body>
    <input type="button" value="전송하기" id="btnSend" />
    <br>
    <br>
    <div id="message"></div>
</body>
</html>
