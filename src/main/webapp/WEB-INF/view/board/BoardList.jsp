<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>
	<c:set var="category" value="${param.category}" />

	<table border="1">
		<tr>
			<td colspan="4"><a href="write.do?category=${category}">[게시글쓰기]</a></td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
		</tr>

		<c:if test="${articlePage.content.size() == 0}">
			<tr>
				<td colspan="4">게시글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="article" items="${articlePage.content}">
			<tr>
				<td>${article.number}</td>
				<td><a
					href="read.do?no=${article.number}&category=${category}&pageNo=${articlePage.currentPage}">${article.title}</a></td>
				<td>${article.writer.name}</td>
				<td>${article.readCount}</td>
				<td>${article.formattedRegDate}</td>
			</tr>
		</c:forEach>

		<c:if test="${articlePage.total > 0}">
			<tr>
				<td colspan="4"><c:if test="${articlePage.currentPage > 1}">
						<a
							href="list.do?category=${category}&pageNo=${articlePage.currentPage - 1}">[이전]</a>
					</c:if> <c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
						<c:if test="${pNo == articlePage.currentPage}">
							<span>[${pNo}]</span>
						</c:if>
						<c:if test="${pNo != articlePage.currentPage}">
							<a href="list.do?category=${category}&pageNo=${pNo}">[${pNo}]</a>
						</c:if>
					</c:forEach> <c:if test="${articlePage.currentPage < articlePage.totalPages}">
						<a
							href="list.do?category=${category}&pageNo=${articlePage.currentPage + 1}">[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
	</table>

	<div>
		<a href="/gza/MainBoard.do">[메인게시판으로]</a>
	</div>

	<div>
		<button type="button" onclick="goToIndex()">index.jsp로 이동</button>
	</div>
	<script type="text/javascript">
		function goToIndex() {
			window.location.href = 'home.do';
		}
	</script>
<form action="categorysearch.do" method="get">
		<input type="hidden" name="category" value="${category}">
		<select name="searchType">
			<option value="title">제목</option>
			<option value="writerName">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요" required>
		<button type="submit">검색</button>
	</form>
</body>
</html>
