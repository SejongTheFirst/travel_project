<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<style>
.error_message {
	color: red;
	display: none;
}

.error_message.active {
	display: block;
}

.modal {
	display: none;
	position: absolute;
	text-align:center;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: flex;
	justify-content: center;
    align-items: center;
}

.modal-content {
	background-color: #fefefe;
	border-radius: 10px;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	max-width: 500px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

input[type="text"], input[type="password"] {
    width: calc(60% - 20px);
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    width: calc(60% - 20px);
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #5cd5fb;
    color: white;
    font-size: 16px;
    cursor: pointer;
}
</style>
</head>
<body>

	<div id="loginModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form action="login.do" method="post">
				
				<input type="text" name="id" placeholder="아이디" value="${param.id}">
				<div class="error_message <c:if test="${errors.id}">active</c:if>">
					<c:if test="${errors.id}">아이디를 입력하세요.</c:if>
					</div>
				
					<input type="password" name="password" placeholder="비밀번호">
					<div class="error_message <c:if test="${errors.password}">active</c:if>">
					<c:if test="${errors.password}">비밀번호를 입력하세요.</c:if>
					</div>
				<input type="submit" value="로그인">
				<div class="error_message <c:if test="${errors.idOrPwNotMatch}">active</c:if>">
				<c:if test="${errors.idOrPwNotMatch}">
				아이디와 암호가 일치하지 않습니다.
				</c:if>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			var showLoginModal = '<c:out value="${showLoginModal}"/>';
			if (showLoginModal === 'true'){
				document.getElementById('loginModal').style.display = 'block';
			}
			
			var span = document.getElementsByClassName("close")[0];
			
			span.onclick = function(){
				document.getElementById('loginModal').style.display = 'none';
			}
			
			window.onclick = function(event){
				if (event.target == document.getElementById('loginModal')){
					document.getElementById('loginModal').style.display = 'none';
				}
			}
		});
	</script>
	
</body>
</html>