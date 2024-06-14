<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
<style type="text/css">
.board {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 기본 색상 유지 */
	transition: color 0.3s; /* 색상 변환 시 애니메이션 적용 (선택 사항) */
}
</style>
</head>
<body>
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
							 <td><a class="board" href="read.do?no=${comunity.number}&category=${comunity.category}" class="truncate">${comunity.title}</a></td>
							<th><fmt:formatDate value="${comunity.regDate}"
									pattern="yyyy-MM-dd" /></th>
							<th>${comunity.writer.id}</th>
							<th>${comunity.readCount}</th>
							<th>${comunity.category}</th>
						</tr>

					</c:forEach>

				</table>
			</div>
		</div>
	</main>
	<%@include file="includes/footer.jsp"%>
</html>
