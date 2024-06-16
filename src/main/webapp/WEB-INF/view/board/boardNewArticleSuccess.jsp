<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록 완료</title>
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style>
.no-style-link {
	text-decoration: none;
	color: inherit;
}

.no-style-link:hover {
	text-decoration: none;
	color: inherit;
}

/* Additional styles to ensure no blue text */
a {
	text-decoration: none;
	color: inherit;
}

a:visited {
	color: inherit;
}

a:hover {
	color: inherit;
}

a:active {
	color: inherit;
}
</style>
</head>
<body>
	<div class="content">
		<div class="left">
			<div class="content-box">
				<h2>게시글을 등록했습니다.</h2>
				<br>
				<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
				<c:set var="category" value="${param.category}" />
				<a class="no-style-link"
					href="${ctxPath}/list.do?category=${category}">[게시글목록보기]</a> <a
					class="no-style-link"
					href="${ctxPath}/read.do?no=${newArticleNo}&category=${category}">[게시글내용보기]</a>
			</div>
		</div>
	</div>


</body>
</div>
<%@ include file="../includes/footer.jsp"%>
</html>
