<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" href="/gza/css/login.css">
<body>

	<div id="loginModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form action="login.do" method="post" class="form">
				
				<input class="input" type="text" name="id" placeholder="아이디" value="${param.id}">
				<div class="error_message <c:if test="${errors.id}">active</c:if>">
					<c:if test="${errors.id}">아이디를 입력하세요.</c:if>
					</div>
				
					<input class="input" type="password" name="password" placeholder="비밀번호">
					<div class="error_message <c:if test="${errors.password}">active</c:if>">
					<c:if test="${errors.password}">비밀번호를 입력하세요.</c:if>
					</div>
				<input class="input" type="submit" value="로그인">
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
				window.location.href='/gza/home.do';
			}
			
			window.onclick = function(event){
				if (event.target == document.getElementById('loginModal')){
					document.getElementById('loginModal').style.display = 'none';
					window.location.href='/gza/home.do';
				}
			}
		});
	</script>
	
</body>
</html>