<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link rel="stylesheet" href="/gza/css/listbook.css">
</head>
<body>
    <main class="main-content">
        <div class="section">
            <div class="room">
                <h2>Bookings</h2>
            </div>
            <div class="wrapper">
                <c:forEach var="bookingData" items="${bookingPage.data}">
                    <div class="container">
                        <div class="img-box">
                            <img src="${bookingData.booking.imgUrl}" alt="${bookingData.booking.bookingTitle}">
                        </div>
                        <div class="title">
                            <a href="booking/read.do?no=${bookingData.booking.bookingId}">
                                <c:out value="${bookingData.booking.bookingTitle}" />
                            </a>
                        </div>
                        <div class="location">${bookingData.booking.location}</div>
                        <div class="dates">
                            <fmt:formatDate value="${bookingData.booking.startDate}" pattern="yyyy-MM-dd"/> ~ 
                            <fmt:formatDate value="${bookingData.booking.endDate}" pattern="yyyy-MM-dd"/>
                        </div>
                        <div class="products">
                            <ul>
                                <c:forEach var="product" items="${bookingData.bookedProducts}">
                                    <li>Product Num: ${product.productId}, Price: ${product.price}, Days: ${product.days}, Guests: ${product.guests}, Total Price: ${product.totalPrice}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${bookingPage.totalPages > 1}">
                <div class="pagination">
                    <c:if test="${bookingPage.startPage > 1}">
                        <a href="listBook?pageNo=${bookingPage.startPage - 1}">&laquo; Previous</a>
                    </c:if>
                    <c:forEach var="i" begin="${bookingPage.startPage}" end="${bookingPage.endPage}">
                        <a href="listBook?pageNo=${i}" class="${i == bookingPage.currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                    <c:if test="${bookingPage.endPage < bookingPage.totalPages}">
                        <a href="listBook?pageNo=${bookingPage.endPage + 1}">Next &raquo;</a>
                    </c:if>
                </div>
            </c:if>
        </div>
    </main>
    <%@ include file="../includes/footer.jsp" %>
</body>
</html>
