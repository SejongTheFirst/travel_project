<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 수정</title>
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style>
.body {
	width: 90%;
}

/* Adjusted button and form styling */
.community-table form {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.community-table form label {
	flex: 1 1 100%; /* Full width for label */
	margin-bottom: 10px; /* Add margin between form elements */
}

.community-table form .form-input {
	flex: 1 1 100%; /* Full width for input fields */
}

.community-table form .form-input input[type="text"], .community-table form .form-input textarea
	{
	width: calc(100% - 20px); /* Adjust width of input and textarea */
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	transition: box-shadow 0.3s;
}

.community-table form .form-input textarea {
	height: 150px; /* Adjust height for textarea */
}

.btn-primary, .btn-secondary {
	padding: 8px 16px; /* Reduced padding for buttons */
	font-size: 14px; /* Adjusted font size */
	border-radius: 4px; /* Rounded corners */
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

.btn-primary {
	background-color: #007bff; /* Blue background */
	color: #fff; /* White text */
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3; /* Darker shade of blue on hover */
}

.btn-secondary {
	background-color: skyblue; /* Sky blue background */
	color: #fff; /* White text */
	border: none;
}

.btn-secondary:hover {
	background-color: lighblue; /* Light blue background on hover */
}
</style>
</head>
<body>
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="left">
			<div class="content-box">
				<h2>게시글 수정</h2>
				<div class="community-table-wrapper">
					<table class="community-table">
						<tr>
							<td>
								<form action="modify.do" method="post">
									<div class="form-input">

										<input type="hidden" name="no" value="${modReq.articleNumber}">
										<input type="hidden" name="category" value="${category}">
									</div>
									<div class="form-input">
										<p>
											번호:<br />${modReq.articleNumber}</p>
									</div>
									<div class="form-input">
										<p>
											제목:<br /> <input type="text" name="title"
												value="${modReq.title}">
											<c:if test="${errors.title}">제목을 입력하세요.</c:if>
										</p>
									</div>
									<div class="form-input">
										<p>
											내용:<br />
											<textarea name="content" rows="5" cols="30">${modReq.content}</textarea>
										</p>
									</div>
									<div class="form-input">
										<input type="submit" class="btn-primary" value="글 수정">
										<button type="button" class="btn-secondary"
											onclick="goBackToPreviousPage()">취소</button>
									</div>


								</form>
							</td>
						</tr>
					</table>

				</div>
			</div>
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
</body>
</div>
<%@ include file="../includes/footer.jsp"%>

</html>
