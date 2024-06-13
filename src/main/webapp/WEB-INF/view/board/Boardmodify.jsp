<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
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
	<%@include file="../includes/sidebar.jsp"%>

	<div class="content">
		<div class="left">
			<div class="content-box">
				<h2>게시글 수정</h2>
				<div class="community-table-wrapper">
					<table class="community-table">

						<form action="modify.do" method="post">
							<input type="hidden" name="no" value="${modReq.articleNumber}">
							<input type="hidden" name="category" value="${category}">
							<p>
								번호:<br />${modReq.articleNumber}
							</p>
							<p>
								제목:<br /> <input type="text" name="title"
									value="${modReq.title}">
								<c:if test="${errors.title}">제목을 입력하세요.</c:if>
							</p>
							<p>
								내용:<br />
								<textarea name="content" rows="5" cols="30">${modReq.content}</textarea>
							</p>
							<input type="submit" value="글 수정">
						</form>
						<button onclick="goBackToPreviousPage()">취소</button>
					</table>
				</div>
			</div>

			<script>
				function goBackToPreviousPage() {

					var isGoBack = confirm("게시글 수정을 완료하지 않았습니다. 이전 페이지로 돌아가시겠습니까?");

					if (isGoBack) {
						history.back();
					}
				}
			</script>
		</div>

	</div>


</div>
</div>
</body>
<%@include file="../includes/footer.jsp"%>
</html>





