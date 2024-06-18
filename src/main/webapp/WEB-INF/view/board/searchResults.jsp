<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>

	
	<h2>검색 결과</h2>
	<p>검색 유형: ${param.searchType == 'title' ? '제목' : '작성자'}</p>
	<p>검색어: ${param.keyword}</p>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
		</tr>

		<c:if test="${articlePage.content.size() == 0}">
			<tr>
				<td colspan="5">검색 결과가 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="article" items="${articlePage.content}">
			<tr>
				<td>${article.number}</td>
				<td><a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}">${article.title}</a></td>
				<td>${article.writer.name}</td>
				<td>${article.readCount}</td>
				<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>

		<c:if test="${articlePage.total > 0}">
			<tr>
				<td colspan="5">
					<c:if test="${articlePage.currentPage > 1}">
						<a href="search.do?searchType=${param.searchType}&keyword=${param.keyword}&pageNo=${articlePage.currentPage - 1}">[이전]</a>
					</c:if>
					<c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
						<c:if test="${pNo == articlePage.currentPage}">
							<span>[${pNo}]</span>
						</c:if>
						<c:if test="${pNo != articlePage.currentPage}">
							<a href="search.do?searchType=${param.searchType}&keyword=${param.keyword}&pageNo=${pNo}">[${pNo}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${articlePage.currentPage < articlePage.totalPages}">
						<a href="search.do?searchType=${param.searchType}&keyword=${param.keyword}&pageNo=${articlePage.currentPage + 1}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>


	

	<form action="search.do" method="get">
		<select name="searchType">
			<option value="title">제목</option>
			<option value="writerName">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요" required>
		<button type="submit">검색</button>
	</form>
</body>
<%@include file="../includes/footer.jsp"%>
</html>
