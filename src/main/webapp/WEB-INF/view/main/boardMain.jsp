<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardMain</title>
<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

h1 {
	text-align: center;
	color: #333;
	padding: 20px 0;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.test {
	width: 800px; background : #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	padding: 20px;
	background: #fff;
}

.test h2 {
	margin: 0 0 10px 0;
	font-size: 24px;
	border-bottom: 1px solid #eaeaea;
	padding-bottom: 10px;
}

.test a {
	text-decoration: none;
	color: #007bff;
}

.test a:hover {
	text-decoration: underline;
}

.test table {
	width: 100%;
	border-collapse: collapse;
}

.test td {
	padding: 10px 0;
	border-bottom: 1px solid #eaeaea;
}

.test td a {
	font-weight: bold;
	color: #333;
}

.test td span {
	display: block;
	color: #999;
	font-size: 14px;
}

.btn-primary {
	display: block;
	width: 200px;
	margin: 20px auto;
	padding: 10px 0;
	background-color: #007bff;
	color: #fff;
	text-align: center;
	border-radius: 8px;
	text-decoration: none;
	font-size: 18px;
	border: none;
	cursor: pointer;
}

.btn-primary:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<h1>BoardMain</h1>

	<div class="container">
		<div class="test">
			<h2>
				후기게시판 <a href="list.do?category=latterboard" style="float: right;">[더보기]</a>
			</h2>
			<table>
				<c:forEach var="article" items="${latestLatterboardArticles}">
					<tr>
						<td><a href="read.do?no=${article.number}">${article.title}</a>
							<span>${article.writer.name} - ${article.formattedRegDate}</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="test">
			<h2>
				자유게시판 <a href="list.do?category=freeboard" style="float: right;">[더보기]</a>
			</h2>
			<table>
				<c:forEach var="article" items="${latestFreeboardArticles}">
					<tr>
						<td><a href="read.do?no=${article.number}">${article.title}</a>
							<span>${article.writer.name} - ${article.formattedRegDate}</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="test">
			<h2>
				동행게시판 <a href="list.do?category=togetherboard" style="float: right;">[더보기]</a>
			</h2>
			<table>
				<c:forEach var="article" items="${latestTogetherboardArticles}">
					<tr>
						<td><a href="read.do?no=${article.number}">${article.title}</a>
							<span>${article.writer.name} - ${article.formattedRegDate}</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<button type="button" class="btn-primary" onclick="FirstPage()">메인
			페이지로 이동</button>
	</div>

	<script type="text/javascript">
		function FirstPage() {
			window.location.href = 'home.do';
		}
	</script>
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