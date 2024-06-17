<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
<style type="text/css">
.board {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 기본 색상 유지 */
    transition: color 0.3s; /* 색상 변환 시 애니메이션 적용 (선택 사항) */
}
</style>
</head>
<body>
    <main class="main-content">
        <div class="section">
            <div class="room">
                <h2>숙박</h2>
            </div>
            <div class="wrapper">
                <c:forEach var="display" items="${roomPage.displays}">
                    <div class="container">
                        <div class="img-box">
                            <img src="/gza/imageStorage/${display.thumbnail.fileName}"
                                alt="${display.thumbnail.fileName}">
                        </div>
                        <div class="title">
                            <a href="product/read.do?no=${display.product.productId}"> 
                                <c:out value="${display.product.productTitle}" />
                            </a>
                        </div>
                        <div class="price">${display.product.price}원/박</div>
                    </div>
                </c:forEach>
            </div>

            <div class="room">
                <h2>체험</h2>
            </div>
            <div class="wrapper">
                <c:forEach var="display" items="${experiencePage.displays}">
                    <div class="container">
                        <div class="img-box">
                            <img src="/gza/imageStorage/${display.thumbnail.fileName}"
                                alt="${display.thumbnail.fileName}">
                        </div>
                        <div class="title">
                            <a href="product/read.do?no=${display.product.productId}"> 
                                <c:out value="${display.product.productTitle}" />
                            </a>
                        </div>
                        <div class="price">${display.product.price}원/일</div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="room">
                <h2>활동</h2>
            </div>
            <div class="wrapper">
                <c:forEach var="display" items="${activityPage.displays}">
                    <div class="container">
                        <div class="img-box">
                            <img src="/gza/imageStorage/${display.thumbnail.fileName}"
                                alt="${display.thumbnail.fileName}">
                        </div>
                        <div class="title">
                            <a href="product/read.do?no=${display.product.productId}"> 
                                <c:out value="${display.product.productTitle}" />
                            </a>
                        </div>
                        <div class="price">${display.product.price}원/일</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="community-section">
            <h2>게시판 최신글</h2>
            <div class="community-table-wrapper">
                <table class="community-table">
                    <tr>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>카테고리</th>
                    </tr>
                    <c:forEach var="community" items="${AllList}">
                        <tr>
                            <td><a class="board" href="read.do?no=${community.number}&category=${community.category}" class="truncate">${community.title}</a></td>
                            <th>${community.regDate}</th>
                            <th>${community.writer.id}</th>
                            <th>${community.readCount}</th>
                            <th>${community.category}</th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </main>
    <%@include file="includes/footer.jsp"%>
</body>
</html>
