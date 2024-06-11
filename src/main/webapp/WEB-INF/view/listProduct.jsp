<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="/gza/css/listproduct.css">
</head>
<body>
	<header>
		<div class="logo"><a href="/gza/home.do" class="home-link">G•za</a></div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색">
			</div>
		</div>
		<a href="/gza/product/write.do" class="register-link">상품등록</a>
		<div class="profile-icon" onclick="toggleMenu()">
			<img src="/gza/img/profile.PNG"
				alt="Profile Icon">
		</div>
		<div class="toggle-menu">
			<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그아웃</a>
		</div>
	</header>
	<div class="categories">
		<a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a href="#">커뮤니티</a>
	</div>
	<main class="main-content">
	
		<div class="section">
			<div class="room">
				<h2>숙박</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${roomPage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>

			<div class="room">
				<h2>체험</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${experiencePage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="product/read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			
			<div class="room">
				<h2>활동</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${activityPage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="product/read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>


			<c:if test="${productPage.hasProduct()}">
				<tr>
					<td colspan="4"><c:if test="${productPage.startPage>5}">
							<a href="list.do?pageNo=${productPage.startPage-5}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${productPage.startPage}"
							end="${productPage.endPage}">
							<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
						</c:forEach> <c:if test="${productPage.endPage<productPage.totalPages}">
							<a href="list.do?pageNo=${productPage.startPage+5}">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
		</div>
	</main>
	<footer> Footer Content </footer>
	<script src="/gza/script/home.js"></script>
</body>
</html>
