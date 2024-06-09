<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
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
			<img src="data:image/png;base64,{{base64_profile_image}}"
				alt="Profile Icon">
		</div>t
		<div class="toggle-menu">
			<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그아웃</a>
		</div>
	</header>
	<div class="categories">
		<a href="#">캘리포니아</a> <a href="#">와이파이 가능</a> <a href="#">휴양지</a> <a
			href="#">체험</a> <a href="#">로맨틱</a> <a href="#">독특한 숙소</a>
	</div>
	<main class="main-content">
		<div class="section">
			<div class="room">
				<h2>숙박</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${productPage.content}">
					<div class="container">
						<div class="img-box">
							<c:forEach var="image" items="${product.images}">
								<img src="/gza/imageStorage/${image.storeName}" alt="${image.originalName}">
							</c:forEach>
						</div>
						<div class="title">
							<a href="product/read.do?no=${product.product.productNum}"> <c:out
									value="${product.product.productTitle}" />
							</a>
						</div>
						<div class="price">${product.product.price}</div>
					</div>
				</c:forEach>
			</div>
			<div class="room">
				<h2>체험</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${productPage.content}">
					<div class="container">
						<div class="img-box">
							<c:forEach var="image" items="${product.images}">
								<img src="/gza/imageStorage/${image.storeName}" alt="${image.originalName}">
							</c:forEach>
						</div>
						<div class="title">
							<a href="read.do?no=${product.product.productNum}"> <c:out
									value="${product.product.productTitle}" />
							</a>
						</div>
						<div class="price">${product.product.price}</div>
					</div>
				</c:forEach>
			</div>
			<div class="room">
				<h2>체험</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${productPage.content}">
					<div class="container">
						<div class="img-box">
							<c:forEach var="image" items="${product.images}">
								<img src="/gza/imageStorage/${image.storeName}" alt="${image.originalName}">
							</c:forEach>
						</div>
						<div class="title">
							<a href="read.do?no=${product.product.productNum}"> <c:out
									value="${product.product.productTitle}" />
							</a>
						</div>
						<div class="price">${product.product.price}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="community-section">
			<h2>커뮤니티 게시판</h2>
			<div class="community-table-wrapper">
				<table class="community-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>첫 번째 게시글</td>
						<td>작성자 1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시글</td>
						<td>작성자 2</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<footer> Footer Content </footer>
	<script type="text/javascript" src="/gza/script/home.js"></script>
</body>
</html>
