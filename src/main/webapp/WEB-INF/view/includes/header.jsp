<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="icon" type="png" href="/gza/img/rogo.png">
<link rel="stylesheet" href="/gza/css/header.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/gza/home.do" class="home-link">G•za</a>
		</div>
		<div class="search-container">
			<div class="search-bar">
				<input type="text" placeholder="검색" class="keyword" name="keyword">
			</div>
		</div>
		<div class="register">
			<a href="/gza/product/write.do" class="register-link" id="register">상품등록</a>
		</div>

		<div class="profile-icon" onclick="toggleMenu()">
			<c:choose>
				<c:when test="${authUser.id != null }">
					<img src="/gza/img/login.png" alt="Profile Icon">
				</c:when>
				<c:otherwise>
					<img src="/gza/img/profile.PNG" alt="Profile Icon">
				</c:otherwise>
			</c:choose>
		</div>
		<c:choose>
			<c:when test="${authUser.id != null }">
				<div class="toggle-menu">
					<a href="/gza/modifyMem.do">내 정보 수정</a> <a href="#">내 상품</a> <a
						href="#">예약 내역</a> <a href="/gza/logout.do">로그아웃</a> <a
						href="/gza/cancelID.do">회원 탈퇴</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="toggle-menu">
					<a href="/gza/join.do" id="openJoinModal">회원 가입</a> <a
						href="/gza/login.do" id="openLoginModal">로그인</a>
				</div>
			</c:otherwise>
		</c:choose>

		<div id="joinModalContainer"></div>
		<div id="loginModalContainer"></div>
		<div id="modifyModalContainer"></div>
		<div id="cancelIDModalContainer"></div>

	</header>
	<div class="categories">
		<a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a
			href="/gza/MainBoard.do">커뮤니티</a>
	</div>