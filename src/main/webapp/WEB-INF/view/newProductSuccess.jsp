<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="/gza/css/newProductSuccess.css">
</head>
<body>
	<header>
		<div class="logo">G•za</div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색">
			</div>
		</div>
		<div class="register">
			<a href="/gza/product/write.do" class="register-link" id="register">상품등록</a>
		</div>
		<div class="profile-icon" onclick="toggleMenu()">
			<img src="/gza/img/profile.PNG" alt="Profile Icon">
		</div>
		<c:choose>
			<c:when test="${authUser.id != null }">
				<div class="toggle-menu">
					<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그아웃</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="toggle-menu">
					<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
	<div class="categories">
		<a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a href="#">커뮤니티</a>
	</div>
	<main>
		<div>상품 등록에 성공했습니다.</div>
		
		<a href="/gza/home.do">메인화면</a>


	</main>
	<footer> Footer Content </footer>
	<script src="/gza/script/newProductForm.js"></script>

</body>
</html>