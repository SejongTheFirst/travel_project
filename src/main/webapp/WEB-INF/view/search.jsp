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
	<main class="main">
		<div class="content-wrapper">
			<div class="product-all">
				<c:if test="${searchPage.hasNoProduct()}">
					<div>
						<h1>게시글이 없습니다.</h1>
					</div>
				</c:if>
				<div class="table-section-product">
					<table class="table">
						<tr>
							<th>번호</th>
							<th>이미지</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach var="display" items="${searchPage.displays}">
							<tr>
								<td>${display.product.productId}</td>
									<td><img src="/gza/imageStorage/${display.thumbnail.fileName}"
										alt="${display.thumbnail.fileName}"></td>
								<td><a href="product/read.do?no=${display.product.productId}">${display.product.productTitle}</a></td>
								<td>${display.product.seller.id}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="article-all">
				<c:if test="${searchPage.hasNoProduct()}">
					<div>
						<h1>게시글이 없습니다.</h1>
					</div>
				</c:if>
				<div class="table-section-article">
					<table class="table">
						<tr>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
						</tr>
						<c:forEach var="article" items="${searchPage.articles }">
							<tr>
								<td>${article.category}</td>
								<td><a href="read.do?no=${article.number }&category=${article.category}">${article.title }</a></td>
								<td>${article.writer.id}</td>
								<td>${article.readCount}</td>
								<td>${article.regDate}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="page">
			<c:if test="${searchPage.hasProduct()}">
				<tr>
					<td colspan="4"><c:if test="${searchPage.startPage>5}">
							<a
								href="search.do?pageNo=${searchPage.startPage-5}&keyword=${param.keyword}">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${searchPage.startPage}"
							end="${searchPage.endPage}">
							<a href="search.do?pageNo=${pNo}&keyword=${param.keyword}">[${pNo}]</a>
						</c:forEach> <c:if test="${searchPage.endPage<searchPage.totalPages}">
							<a
								href="search.do?pageNo=${searchPage.startPage+5}&keyword=${param.keyword}">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
		</div>
	</main>
	<%@include file="includes/footer.jsp"%>
</body>
</html>