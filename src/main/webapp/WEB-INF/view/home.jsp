<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>
	<header>
		<div class="logo"><a href="/gza/home.do" class="home-link">G•za</a></div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색">
			</div>
		</div>
		<div class="register">
			<a href="/gza/product/write.do" class="register-link" id="register">상품등록</a>
		</div>
		
		<div class="profile-icon" onclick="toggleMenu()">
			<img src="/gza/img/profile.PNG"
				alt="Profile Icon">
		</div>
		<c:choose>
        <c:when test="${authUser.id != null }">
        <div class="toggle-menu">
            <a href="/gza/modifyMem.do">내 정보 수정</a> <a href="#">내 상품</a> <a href="#">예약 내역</a>
					<a href="/gza/logout.do">로그아웃</a> <a href="/gza/cancelID.do">회원 탈퇴</a>
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

		</div>
		<div class="community-section">
			<h2>커뮤니티 게시판</h2>
			<a href="MainBoard.do" style="float: right;">더보기</a>
			<div class="community-table-wrapper">
				<table class="community-table">

					<tr>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>카테고리</th>
					</tr>
					<c:forEach var="comunity" items="${AllList}">
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}</th>
							<th>${comunity.writer.id}</th>
							<th>${comunity.readCount}</th>
							<th>${comunity.category}</th>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</main>
	<footer> Footer Content </footer>
	<script type="text/javascript" src="/gza/script/home.js"></script>
</body>
</html>
