<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>${category} 게시판</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>
	<h2>${category} 게시판</h2>
	
	<!-- 검색 폼 -->
	<form action="categorysearch.do" method="get">
		<input type="hidden" name="category" value="${category}">
		<select name="searchType">
			<option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
			<option value="writerName" ${searchType == 'writerName' ? 'selected' : ''}>작성자</option>
		</select>
		<input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요" required>
		<button type="submit">검색</button>
	</form>

	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
		</tr>

		<c:if test="${empty articlePage.content}">
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="article" items="${articlePage.content}">
			<tr>
				<td>${article.number}</td>
				<td><a href="read.do?no=${article.number}&category=${category}&pageNo=${articlePage.currentPage}">${article.title}</a></td>
				<td>${article.writer.name}</td>
				<td>${article.readCount}</td>
				<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>

		<c:if test="${articlePage.total > 0}">
			<tr>
				<td colspan="5">
					<c:if test="${articlePage.currentPage > 1}">
						<a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${articlePage.currentPage - 1}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
						<c:choose>
							<c:when test="${pNo == articlePage.currentPage}">
								<span>[${pNo}]</span>
							</c:when>
							<c:otherwise>
								<a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${pNo}">[${pNo}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${articlePage.currentPage < articlePage.totalPages}">
						<a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${articlePage.currentPage + 1}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>

	<!-- 메인게시판으로 이동 -->
	<div>
		<a href="/gza/MainBoard.do">[메인게시판으로]</a>
	</div>

	<!-- index.jsp로 이동 -->
	<div>
		<a href="home.do">[처음으로]</a>
	</div>
	
</body>
<%@include file="../includes/footer.jsp"%>
</html>

