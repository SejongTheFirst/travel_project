<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>
<header>
		<div class="logo">G•za</div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색">
			</div>
		</div>
		<div class="register">
			<a href="/gza/product/write.do" class="register-link" id="register">상품등록</a>
		</div>
		<div class="profile-icon" onclick="toggleMenu()">
			<img src="data:image/png;base64,{{base64_profile_image}}"
				alt="Profile Icon">
		</div>
		<div class="toggle-menu">
			<a href="#">프로필</a> <a href="#">설정</a><a href="myboard.do">내가 쓴 게시물</a> <a href="#">로그아웃</a>
		</div>
	</header>
	
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


	<div>
		<a href="/gza/MainBoard.do">[메인게시판으로]</a>
	</div>

	<form action="search.do" method="get">
		<select name="searchType">
			<option value="title">제목</option>
			<option value="writerName">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요" required>
		<button type="submit">검색</button>
	</form>
</body>
</html>