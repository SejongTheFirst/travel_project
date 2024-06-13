<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" href="/gza/css/listproduct.css">
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
								<img src="/gza/imageStorage/${image.originalName}"
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
					<td colspan="4"><c:if test="${productPage.startPage>5}">AV
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
	<%@include file="includes/footer.jsp"%>
</body>
</html>
