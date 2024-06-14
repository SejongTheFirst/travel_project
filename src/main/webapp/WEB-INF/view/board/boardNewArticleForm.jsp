<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 쓰기</title>
<link rel="stylesheet" href="/gza/css/header.css">
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style type="text/css">
.body {
	width: 90%;
}
</style>
</head>
<body>

	<%@include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="left">
			<div class="content-box">
				
				<div class="community-section">
					<h2>게시글 쓰기</h2>
					<div class="community-table-wrapper">
						<table class="community-table">
		<tr>
		<form action="write.do" method="post">
	
			<label for="category"> <select id="category" name="category"
				size="1">
					<option value="">카테고리를 선택해주세요.</option>
					<option value="freeboard">자유게시판</option>
					<option value="togetherboard">동행게시판</option>
					<option value="latterboard">후기게시판</option>
			</select>
			</label>

		<td>
			<p>
			제목:<br /> <input type="text" name="title" value="${param.title}">
			<c:if test="${errors.title}">제목을 입력하세요.</c:if>
		</p>
		<p>
			내용:<br />
			<textarea name="content" rows="5" cols="30">${param.title}</textarea>
		</p>

<form>
		<input type="submit" value="새 글 등록">
	</form>
	<form>
	<button onclick="goBackToPreviousPage()">이전 페이지로 돌아가기</button>
</form>
		</td>
</tr>

	
<script>
	const categorySelect = document.getElementById("category");
	const submitButton = document.querySelector("input[type='submit']");

	submitButton.addEventListener("click", function(event) {
		const selectedCategory = categorySelect.value;
		if (selectedCategory === "") {
			event.preventDefault();
			alert("카테고리를 선택해주세요.");
		}
	});
	function goBackToPreviousPage() {

		var isGoBack = confirm("게시글 작성 내용을 저장하지 않았습니다. 이전 페이지로 돌아가시겠습니까?");

		if (isGoBack) {
			history.back();
		}
	}
</script>

</table>
</div>
</div>
</div>
</div>
</div>
</body>
</div>
<%@include file="../includes/footer.jsp"%>
</html>
