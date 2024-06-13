<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Book List</title>
<link rel="stylesheet" href="/gza/css/listbook.css">
</head>
<body>
    <main class="main-content">
        <div class="section">
            <div class="room">
                <h2>Books</h2>
            </div>
            <div class="wrapper">
                <c:forEach var="bookData" items="${bookPage.data}">
                    <div class="container">
                        <c:forEach var="book" items="${bookData.book}">
                            <div class="img-box">
                                <img src="${book.imgUrl}" alt="${book.title}" >
                            </div>
                            <div class="title">
                                <a href="book/read.do?no=${book.bookCode}">
                                    <c:out value="${book.title}" />
                                </a>
                            </div>
                            <div class="location">${book.location}</div>
                            <div class="dates">
                                <fmt:formatDate value="${book.startDate}" pattern="yyyy-MM-dd"/> ~ 
                                <fmt:formatDate value="${book.endDate}" pattern="yyyy-MM-dd"/>
                            </div>
                            <div class="products">
                                <ul>
                                    <c:forEach var="product" items="${bookData.bookProd}">
                                        <li>Product Num: ${product.productNum}, Price: ${product.price}, Days: ${product.days}, Guests: ${product.guests}, Total Price: ${product.totalPrice}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${bookPage.totalPages > 1}">
                <div class="pagination">
                    <c:if test="${bookPage.startPage > 1}">
                        <a href="listBook?pageNo=${bookPage.startPage - 1}">&laquo; Previous</a>
                    </c:if>
                    <c:forEach var="i" begin="${bookPage.startPage}" end="${bookPage.endPage}">
                        <a href="listBook?pageNo=${i}" class="${i == bookPage.currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                    <c:if test="${bookPage.endPage < bookPage.totalPages}">
                        <a href="listBook?pageNo=${bookPage.endPage + 1}">Next &raquo;</a>
                    </c:if>
                </div>
            </c:if>
        </div>
    </main>
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
