<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
<link rel="stylesheet" href="/gza/css/readProduct.css">
<style>
    .image-gallery {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .thumbnail-container {
        display: flex;
        gap: 10px;
        margin-top: 10px;
    }
    .thumbnail-container img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        cursor: pointer;
    }
    .product-image {
        max-width: 100%;
        max-height: 500px;
        width: auto;
        height: auto;
    }
</style>
</head>
<body>
    <div class="main">
        <div class="product-container-img">
            <div class="product-item-img image-gallery">
                <img id="mainImage" src="/gza/imageStorage/${productData.images[0].fileName}"
                    alt="${productData.images[0].fileName}" class="product-image">
                <div class="thumbnail-container">
                    <c:forEach var="image" items="${productData.images}">
                        <img src="/gza/imageStorage/${image.fileName}" alt="${image.fileName}"
                             onclick="changeMainImage(this)">
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="horizontal-line"></div>
        <div class="product-details">
            <div class="product-info">
                <div class="product-container-title">
                    <div class="product-item-title">
                        <span class="value">${productData.product.productTitle}</span>
                    </div>
                </div>
                <div class="product-container-subtitle">
                    <div class="product-item-subtitle">
                        <span class="value">${productData.content.productSubTitle}</span>
                    </div>
                </div>
                <div class="product-container-seller">
                    <div class="product-item-seller">
                        <span class="label">Host - </span><span class="value">${productData.product.seller.id}</span>
                    </div>
                </div>
                <div class="product-container-content">
                    <div class="product-item-content">
                        <c:set var="userInput" value="${productData.content.productContent}" />
                        <div class="value" id="output"></div>
                    </div>
                </div>
                <div class="product-container-location">
                    <div class="product-item-location">
                        <span class="value">${productData.product.location}</span>
                    </div>
                </div>
            </div>
            <div class="vertical-line"></div>
            <div class="product-book">
                <div class="product-container-book">
                    <div class="product-item-type">
                        <span class="value">${productData.product.productCategory}</span>
                    </div>
                    <div class="product-item-price">
                        <span class="label">₩</span> <span class="value" id="price">${productData.product.price}</span>
                    </div>
                    <div class="product-item-guests">
                        <span class="label">Guests : </span> <span class="value">${productData.content.maxGuests}명</span>
                    </div>
                    <div class="product-item-startdate">
                        <span class="label">Check In : </span> <input type="date"
                            id="start_date" name="start_date"
                            onchange="calculateTotalPrice()">
                    </div>
                    <div class="product-item-enddate">
                        <span class="label">Check Out :</span> <input type="date"
                            id="end_date" name="end_date" onchange="calculateTotalPrice()">
                    </div>
                    <div class="product-item-totalprice">
                        <span class="label">Total Price : </span> <span id="total_price">0원</span>
                    </div>
                    <div class="product-item-btn">
                        <c:choose>
                            <c:when test="${authUser.id != productData.product.seller.id}">
                                <button class="btn" type="button" onclick="handleReservation()">예약하기</button>
                            </c:when>
                            <c:otherwise>
                                <div class="link-container">
                                    <a class="modifyBtn" href="modify.do?no=${productData.product.productId}">게시글 수정</a>
                                    <a class="deleteBtn" href="delete.do?no=${productData.product.productId}">게시글 삭제</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${authUser.id != productData.product.seller.id}">
        <form action="book.do" method="post" id="reservationForm">
            <input type="hidden" name="productId" value="${productData.product.productId}">
            <input type="hidden" name="title" value="${productData.product.productTitle}">
            <input type="hidden" name="price" value="${productData.product.price}">
            <input type="hidden" name="maxGuests" value="${productData.content.maxGuests}">
            <input type="hidden" name="location" value="${productData.product.location}">
            <input type="hidden" name="sellerId" value="${productData.product.seller.id}">
            <input type="hidden" name="imageUrl" value="/gza/imageStorage/${productData.images[0].fileName}">
            <input type="hidden" name="start_date" id="start_date_input">
            <input type="hidden" name="end_date" id="end_date_input">
            <input type="hidden" name="total_price" id="total_price_input">
            <input type="hidden" name="days" id="days_input">
        </form>
    </c:if>
    <script>
        function processText() {
            var userInput = `<c:out value='${fn:escapeXml(userInput)}' />`;
            var processedText = userInput.replace(/\n/g, '<br>');
            document.getElementById('output').innerHTML = processedText;
        }
        window.onload = processText;

        function changeMainImage(imgElement) {
            var mainImage = document.getElementById('mainImage');
            mainImage.src = imgElement.src;
            mainImage.alt = imgElement.alt;
        }

        function handleReservation() {
            if (validateForm()) {
                document.getElementById('reservationForm').submit();
            }
        }

        function calculateTotalPrice() {
            const startDateValue = document.getElementById('start_date').value;
            const endDateValue = document.getElementById('end_date').value;
            const startDate = new Date(startDateValue);
            const endDate = new Date(endDateValue);
            const price = parseFloat(document.getElementById('price').innerText);
            const timeDiff = endDate - startDate;
            const daysDiff = timeDiff / (1000 * 3600 * 24);
            const totalPrice = daysDiff * price;

            if (!startDateValue || !endDateValue || daysDiff <= 0) {
                document.getElementById('total_price').innerText = '0원';
                document.getElementById('total_price_input').value = '0';
                document.getElementById('start_date_input').value = '';
                document.getElementById('end_date_input').value = '';
                document.getElementById('days_input').value = '0';
                return;
            }

            document.getElementById('total_price').innerText = totalPrice.toFixed() + '원';
            document.getElementById('total_price_input').value = totalPrice.toFixed();
            document.getElementById('start_date_input').value = startDateValue;
            document.getElementById('end_date_input').value = endDateValue;
            document.getElementById('days_input').value = daysDiff;
        }

        function validateForm() {
            const startDateValue = document.getElementById('start_date').value;
            const endDateValue = document.getElementById('end_date').value;

            if (!startDateValue || !endDateValue) {
                alert('날짜를 선택해 주세요.');
                return false;
            }

            const startDate = new Date(startDateValue);
            const endDate = new Date(endDateValue);
            const timeDiff = endDate - startDate;
            const daysDiff = timeDiff / (1000 * 3600 * 24);

            if (daysDiff <= 0) {
                alert('종료 날짜는 시작 날짜보다 나중이어야 합니다.');
                return false;
            }

            calculateTotalPrice();
            return true; // 폼 제출을 허용
        }
    </script>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>
