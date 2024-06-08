<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/index.css">
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
			<img src="data:image/png;base64,{{base64_profile_image}}"
				alt="Profile Icon">
		</div>
		<div class="toggle-menu">
			<a href="#">프로필</a> <a href="#">설정</a> <a href="#">로그아웃</a>
		</div>
	</header>
	<div class="categories">
		<a href="#">캘리포니아</a> <a href="#">와이파이 가능</a> <a href="#">휴양지</a> <a
			href="#">체험</a> <a href="#">로맨틱</a> <a href="#">독특한 숙소</a>
	</div>
	<main>
		<div class="section">
			<h2>숙박</h2>
			<div class="card-container">
				<div class="card">
					<img src="data:image/png;base64,{{base64_accommodation_image}}"
						alt="숙박 이미지 1">
					<div class="content">
						<div class="title">숙소 1</div>
						<div class="price">가격 1</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_accommodation_image}}"
						alt="숙박 이미지 2">
					<div class="content">
						<div class="title">숙소 2</div>
						<div class="price">가격 2</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_accommodation_image}}"
						alt="숙박 이미지 3">
					<div class="content">
						<div class="title">숙소 3</div>
						<div class="price">가격 3</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_accommodation_image}}"
						alt="숙박 이미지 4">
					<div class="content">
						<div class="title">숙소 4</div>
						<div class="price">가격 4</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<h2>체험</h2>
			<div class="card-container">
				<div class="card">
					<img src="data:image/png;base64,{{base64_experience_image}}"
						alt="체험 이미지 1">
					<div class="content">
						<div class="title">체험 1</div>
						<div class="price">가격 1</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_experience_image}}"
						alt="체험 이미지 2">
					<div class="content">
						<div class="title">체험 2</div>
						<div class="price">가격 2</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_experience_image}}"
						alt="체험 이미지 3">
					<div class="content">
						<div class="title">체험 3</div>
						<div class="price">가격 3</div>
					</div>
				</div>
				<div class="card">
					<img src="data:image/png;base64,{{base64_experience_image}}"
						alt="체험 이미지 4">
					<div class="content">
						<div class="title">체험 4</div>
						<div class="price">가격 4</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer> Footer Content </footer>
	<script src="/gza/script/index.js"></script>
</body>
</html>
