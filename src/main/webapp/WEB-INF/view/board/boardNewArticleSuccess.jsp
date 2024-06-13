<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록 완료</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>

게시글을 등록했습니다.
<br>
${ctxPath = pageContext.request.contextPath ; ''}
<a href="${ctxPath}/list.do?category=${category}">[게시글목록보기]</a>
<a href="${ctxPath}/read.do?no=${newArticleNo}">[게시글내용보기]</a>
</body>
<%@include file="../includes/footer.jsp"%>
</html>