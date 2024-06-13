<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
</head>
<body>
	<main class="main-content">
		<div class="section">
			<div class="room">
				<h2>숙박</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${roomPage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="product/read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<div class="room">
				<h2>체험</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${experiencePage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="product/read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<div class="room">
				<h2>활동</h2>
			</div>
			<div class="wrapper">
				<c:forEach var="product" items="${activityPage.content}">
					<div class="container">
						<c:forEach var="image" items="${product.images}">
							<div class="img-box">
								<img src="/gza/imageStorage/${image.storeName}"
									alt="${image.originalName}">
							</div>
						</c:forEach>
						<c:forEach var="pro" items="${product.product}">
							<div class="title">
								<a href="product/read.do?no=${pro.productNum}"> <c:out
										value="${pro.productTitle}" />
								</a>
							</div>
							<div class="price">${pro.price}</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>

		</div>
		<div class="community-section">
			<h2>커뮤니티 게시판</h2>
			<div class="community-table-wrapper">
				<table class="community-table">

					<tr>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>카테고리</th>
					</tr>
					<%-- <c:forEach var="comunity" items="${AllList}"> --%>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
						<tr>
							<td><a href="read.do?no=${comunity.number}" class="truncate">${comunity.title}</a></td>
							<th>${comunity.regDate}1</th>
							<th>${comunity.writer.id}1</th>
							<th>${comunity.readCount}1</th>
							<th>${comunity.category}1</th>
						</tr>
					<%-- </c:forEach> --%>

				</table>
			</div>
		</div>
	</main>
	<%@include file="includes/footer.jsp"%>
</html>
