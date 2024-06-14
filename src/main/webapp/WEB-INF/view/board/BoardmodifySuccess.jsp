<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/sidebar.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 수정</title>
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
</style>
</head>
<body>
	
<table>
<tr>
<td>
<h2>게시글을 수정했습니다.</h2>
<br>
</td>
<tr>
<td>
<a href="/gza/list.do?category=${category}">[게시글목록보기]</a>

<a href="/gza/read.do?no=${modReq.articleNumber}&category=${category}">[게시글내용보기]</a>
</td>
</tr>
</tr>
</table>
</body>
</div>
</div>
<%@include file="../includes/footer.jsp"%>
</html>
