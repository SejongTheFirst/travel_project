<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/gza/css/search.css">
</head>
<body>
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
						<td><a href="product/read.do?no=${product.pro.productNum }">${product.pro.productTitle}</a></td>
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
	<%@include file="includes/footer.jsp"%>
</body>
</html>