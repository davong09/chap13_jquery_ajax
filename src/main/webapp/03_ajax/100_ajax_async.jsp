<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AJAX Example</title>
    
    <!-- jQuery 라이브러리 import -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <script>
        function sendAsyncRequest() {
            $.ajax({
                url: "AjaxServlet",
                type: "GET",
                async: true,
                success: function(response) {
                    alert("Asynchronous Response: " + response);
                },
                error: function() {
                    alert("Asynchronous Request Failed");
                },
                complete: function() {
                    console.log("Async Request Completed");
                }
            });
        }

        function sendSyncRequest() {
            // 버튼 비활성화
            document.getElementById("syncBtn").disabled = true;
            document.getElementById("asyncBtn").disabled = true;
            
            $.ajax({
                url: "AjaxServlet",
                type: "GET",
                async: false,
                success: function(response) {
                    alert("Synchronous Response: " + response);
                },
                error: function() {
                    alert("Synchronous Request Failed");
                },
                complete: function() {
                    // 버튼 다시 활성화
                    document.getElementById("syncBtn").disabled = false;
                    document.getElementById("asyncBtn").disabled = false;
                    console.log("Sync Request Completed");
                }
            });
        }
    </script>
</head>
<body>
    <h1>AJAX Example</h1>
    <button id="asyncBtn" onclick="sendAsyncRequest()">Send Async Request</button>
    <button id="syncBtn" onclick="sendSyncRequest()">Send Sync Request</button>
</body>
</html>
