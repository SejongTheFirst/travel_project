<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/gza/css/search.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/gza/home.do" class="home-link">G•za</a>
		</div>
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
					<a href="/gza/modifyMem.do">내 정보 수정</a> <a href="#">내 상품</a> <a
						href="#">예약 내역</a> <a href="/gza/logout.do">로그아웃</a> <a
						href="/gza/cancelID.do">회원 탈퇴</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="toggle-menu">
					<a href="/gza/join.do">회원 가입</a> <a href="/gza/login.do">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>

	</header>
	<div class="categories">
		<a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a href="#">커뮤니티</a>
	</div>
	<main>

		<c:if test="${productPage.hasNoProduct()}">
			<div>
				<h1>게시글이 없습니다.</h1>
			</div>
		</c:if>
		<div class="table-section">
			<table class="table">
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
				<c:forEach var="product" items="${productPage.content }">
					<tr>
						<td>${product.pro.productNum}</td>
						<c:forEach var="img" items="${product.images}">
							<td><img src="/gza/imageStorage/${img.storeName}"
								alt="${img.originalName}"></td>
						</c:forEach>
						<td>${product.pro.productTitle}</td>
						<td>${product.pro.writer.id}</td>
					</tr>
				</c:forEach>
				<c:if test="${productPage.hasProduct()}">
					<tr>
						<td colspan="4"><c:if test="${productPage.startPage>5}">
								<a href="search.do?pageNo=${productPage.startPage-5}&keyword=${param.keyword}">[이전]</a>
							</c:if> <c:forEach var="pNo" begin="${productPage.startPage}"
								end="${productPage.endPage}">
								<a href="search.do?pageNo=${pNo}&keyword=${param.keyword}">[${pNo}]</a>
							</c:forEach> <c:if test="${productPage.endPage<productPage.totalPages}">
								<a href="search.do?pageNo=${productPage.startPage+5}&keyword=${param.keyword}">[다음]</a>
							</c:if></td>
					</tr>
				</c:if>
			</table>
		</div>
	</main>
	<script type="text/javascript" src="/gza/script/search.js"></script>
</body>
</html>