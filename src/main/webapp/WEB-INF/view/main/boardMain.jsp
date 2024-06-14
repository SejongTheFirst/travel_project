<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
<link rel="stylesheet" href="/gza/css/board.css">

</head>

<body>
<div class ="center">
	<h1>게시판 이용 수칙!</h1>
	<h2>1. Reminder </h2>
	</div>
	
	<div class= "search">
	<form action="search.do" method="get">
		<select name="searchType">
			<option value="title">제목</option>
			<option value="writerName">작성자</option>
		</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요" required>
		<button type="submit">검색</button>
	</form>
	</div>
	

	<h1>BoardMain</h1>

<div class="main-content">
		<div class="test">
    <h2>후기게시판 <a href="list.do?category=latterboard" style="float: right;">[더보기]</a></h2>
    <table class="community-table">
        <c:forEach var="article" items="${latestLatterboardArticles}">
            <tr>
                <td><a href="read.do?no=${article.number}">${article.title}</a>
                    <span>${article.writer.name} - ${article.formattedRegDate}</span></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="test">
    <h2>자유게시판 <a href="list.do?category=freeboard" style="float: right;">[더보기]</a></h2>
    <table class="community-table">
        <c:forEach var="article" items="${latestFreeboardArticles}">
            <tr>
                <td><a href="read.do?no=${article.number}">${article.title}</a>
                    <span>${article.writer.name} - ${article.formattedRegDate}</span></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="test">
    <h2>동행게시판 <a href="list.do?category=togetherboard" style="float: right;">[더보기]</a></h2>
    <table class="community-table">
        <c:forEach var="article" items="${latestTogetherboardArticles}">
            <tr>
                <td><a href="read.do?no=${article.number}">${article.title}</a>
                    <span>${article.writer.name} - ${article.formattedRegDate}</span></td>
            </tr>
        </c:forEach>
    </table>
</div>
</div>
</body>
<%@include file="../includes/footer.jsp"%>
</html>