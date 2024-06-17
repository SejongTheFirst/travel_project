<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="/gza/css/modifySuccess.css">
</head>
<body>
	<main class="main">
		<div class="container">
			<h1> 게시글을 수정했습니다. </h1><br> 
			${ctxPath=pageContext.request.contextPath;''}
			<a class="link" href="${ctxPath}/product/list.do">게시글 목록 보기</a>
			<a class="link" href="${ctxPath}/product/read.do?no=${modReq.productId}">게시글 내용 보기</a>
		</div>
	</main>

</body>
<footer>
	<%@include file="../includes/footer.jsp"%>
</footer>
</html>