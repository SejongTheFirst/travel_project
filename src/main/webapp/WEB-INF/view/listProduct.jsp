<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>

	<table border="1">
		<tr>
			<td colspan="4"><a href="write.do">[게시글쓰기]</a></td>
		</tr>

		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>가격</td>
			<td>작성자</td>
		</tr>

		<c:if test="${productPage.hasNoProduct()}">
			<tr>
				<td colspan="4">게시글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="product" items="${productPage.content}">
			<tr>
				<td>${product.productNum}</td>
				<td><a
					href="read.do?no=${product.productNum}&pageNo=${productPage.currentPage}">
						<c:out value="${product.productTitle}" />
				</a></td>
				<td>${product.price}</td>
				<td>${product.writer.id}</td>
			</tr>
		</c:forEach>

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
	</table>
</body>
</html>