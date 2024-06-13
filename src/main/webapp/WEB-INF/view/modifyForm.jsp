<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="/gza/css/modifyForm.css">
</head>
<body>
	<form action="modify.do?no=${modReq.productNum}" method="post"
		enctype="multipart/form-data" accept="image/*">
		
		
		<div class="main">
			<div class="form-container">
				<div class="form-item">
					<p>이미지 파일 선택:</p>
					<input id="file-upload" type="file" name="file"
						onchange="previewImage()">
					<div class="image-preview">
						<h2>이미지 미리보기</h2>
						<img id="image-preview" src="" alt="Image Preview">
					</div>
				</div>
				<div class="form-item">
					<p>번호:</p>
					<span id="productNum">${modReq.productNum}</span>
				</div>
				<div class="form-item">
					<p>제목:</p>
					<input type="text" id="title" name="title" value="${modReq.productTitle}">
					<c:if test="${errors.title}">제목을 입력하세요</c:if>
				</div>
				<div class="form-item">
					<p>서브제목:</p>
					<input type="text" id="subtitle" name="subtitle" value="${modReq.productSubtitle}">
				</div>
				<div class="form-item">
					<p>가격:</p>
					<input type="number" id="price" name="price" value="${modReq.price}">
				</div>
				<div class="form-item">
					<p>내용:</p>
					<textarea rows="5" cols="30" name="content" id="content">${modReq.productContent}</textarea>
				</div>
				<div class="form-item">
					<input class="btn" type="submit" value="글 수정">
				</div>
			</div>
		</div>
	</form>

	<%@include file="includes/footer.jsp"%>
</body>
</html>