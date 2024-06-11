<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="/gza/css/newProductForm.css">
</head>
<body>
	<header>
		<div class="logo">G•za</div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색">
			</div>
		</div>
		<div class="register">
			<a href="/gza/product/write.do" class="register-link" id="register">상품등록</a>
		</div>
		<div class="profile-icon" onclick="toggleMenu()">
			<img src="/gza/img/profile.PNG" alt="Profile Icon">
		</div>
		<c:choose>
			<c:when test="${authUser.id != null }">
				<div class="toggle-menu">
					<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그아웃</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="toggle-menu">
					<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
	<div class="categories">
		<a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a href="#">커뮤니티</a>
	</div>

	<main>
		<form class="product-form" action="write.do" method="post"
			enctype="multipart/form-data" accept="image/*">
			<div class="img-section">
				이미지 업로드 <br /> <input id="file-upload" type="file" name="file"
					onchange="previewImage()">
				<div class="image-preview">
					<h2>이미지 미리보기</h2>
					<img id="image-preview" src="" alt="Image Preiview">
				</div>
			</div>
			<div class="horizontal-line"></div>
			<div class="details-pricing-container">
				<div class="details-section">
					<div class="basic-info">
						<label>main_title: <input type="text" name="title"
							value="${param.productTitle}"></label>
						<c:if test="${errors.title}">제목을 입력하세요.</c:if>
						<label>sub_title: <input type="text" name="subtitle"
							value="${param.productSubTitle}"></label>
						<c:if test="${errors.title}">서브제목을 입력하세요.</c:if>
						<label>location : <input type="text" name="location"
							value="${param.location}"></label>
					</div>
					<div class="content-info">
						<label>Product_Content: <br><textarea name="content" rows="5"
								cols="100">${param.productContent}</textarea></label>
					</div>
				</div>
				<div class="vertical-line"></div>
				<div class="pricing-section">
					<label>₩ <input type="number" name="price"
						value="${param.price}"> Price/박
					</label>
					<c:if test="${errors.price}">가격을 입력하세요.</c:if>
					<label>유형: <select name="type">
							<option value="숙박"
								<c:if test="${param.type == '숙박'}">selected</c:if>>숙박</option>
							<option value="체험"
								<c:if test="${param.type == '체험'}">selected</c:if>>체험</option>
							<option value="활동"
								<c:if test="${param.type == '활동'}">selected</c:if>>활동</option>
					</select>
					</label> <label>최대인원: <input type="number" name="guests"
						value="${param.guests}"></label>
					<button class="registerBtn" type="submit">등록하기</button>
				</div>
			</div>
		</form>
	</main>
	<footer> Footer Content </footer>
	<script src="/gza/script/newProductForm.js"></script>

</body>
</html>
