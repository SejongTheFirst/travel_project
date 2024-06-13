<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<link rel="stylesheet" href="/gza/css/deleteForm.css">
</head>
<body>

	<form action="delete.do?no=${delReq.productNum}" method="post"
		enctype="multipart/form-data" accept="image/*">
		<div class="main">
			<div class="form-container">
				<div class="form-item">
					<p>번호:</p>
					<span id="productNum">${delReq.productNum}</span>
				</div>
				<div class="form-item">
					<p>제목:</p>
					<input type="text" id="title" name="title" value="${delReq.productTitle}"
						readonly="readonly">
				</div>
				<div class="form-item">
					<p>이미지 파일:</p>
					<div class="image-preview">
						<img src="/gza/imageStorage/${delReq.imageFileName}"
							alt="${delReq.imageFileName}" class="product-image">
					</div>
				</div>
				<div class="form-item">
					<p>내용:</p>
					<textarea rows="5" cols="30" id="content" name="content" readonly="readonly">${delReq.productContent}</textarea>
				</div>
				<div class="form-item">
					<input class="btn" type="submit" value="글 삭제">
				</div>
			</div>
		</div>
	</form>
	<%@include file="includes/footer.jsp"%>
</body>
</html>