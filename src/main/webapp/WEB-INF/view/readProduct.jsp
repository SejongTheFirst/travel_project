<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>작성자</td>
			<td>${productData.product.writer.id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${productData.product.productTitle}</td>
		</tr>
		<tr>
			<td>서브제목</td>
			<td>${productData.content.productSubTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><c:out value="${productData.content.productContent}" /></td>
		</tr>
		<tr>
			<td>유형</td>
			<td>${productData.content.productType}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${productData.product.price}</td>
		</tr>
		<tr>
			<td>게스트 수</td>
			<td>${productData.content.guests}</td>
		</tr>
		<tr>
			<td>위치</td>
			<td>${productData.content.location}</td>
		</tr>

	</table>

	<a href="list.do">목록으로 돌아가기</a>
	<c:if test="${authUser.id == productData.product.writer.id}">
		<c:if test="${not empty productData.product.productNum}">
			<a href="modify.do?no=${productData.product.productNum}">[게시글 수정]</a>
			<a href="delete.do?no=${productData.product.productNum}">[게시글 삭제]</a>
		</c:if>
	</c:if>

</body>
</html>