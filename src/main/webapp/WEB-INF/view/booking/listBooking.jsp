<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<div class="horizontal-line"></div>
			<div class="wrapper">
				<c:forEach var="bookingData" items="${bookingPage.data}">
					<div class="container">
						<div class="title">
							<a href="booking/read.do?no=${bookingData.booking.bookingId}">
								<c:out value="${bookingData.booking.bookingTitle}" />
							</a>
						</div>
						<div class="horizontal-line-container"></div>
						<div class="img-box">
							<img src="${bookingData.booking.imgUrl}"
								alt="${bookingData.booking.bookingTitle}">
						</div>
						<div class="location">
							<span class="label"># &nbsp;</span><span class="value">
								${bookingData.booking.location}</span>
						</div>
						<div class="dates">
							<span class="label"># &nbsp;</span>
							<fmt:formatDate value="${bookingData.booking.startDate}"
								pattern="yyyy-MM-dd" />
							~
							<fmt:formatDate value="${bookingData.booking.endDate}"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="products">
							<ul>
								<c:forEach var="product" items="${bookingData.bookedProducts}">
									<span class="label"># &nbsp;</span>
									<span>Product Num: ${product.productId}</span>
									<br>
									<span class="label"># &nbsp;</span>
									<span>Total Price: ${product.totalPrice} ₩</span>
									<div class="hover-text">
										<span class="label"># &nbsp;</span><span class="value">Price: ${product.price}</span><br>
										<span class="label"># &nbsp;</span><span class="value">Days: ${product.days}</span><br>
										<span class="label"># &nbsp;</span><span class="value">Guests: ${product.guests}</span>
									</div>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>
	
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', () => {
	    const containers = document.querySelectorAll('.container');

	    containers.forEach(container => {
	        const hoverText = container.querySelector('.hover-text');

	        container.addEventListener('mousemove', (event) => {
	            // Calculate the position relative to the container
	            const rect = container.getBoundingClientRect();
	            const x = event.clientX - rect.left;
	            const y = event.clientY - rect.top;

	            hoverText.style.left = x+`px`;
	            hoverText.style.top = y+`px`;
	        });

	        container.addEventListener('mouseenter', () => {
	            hoverText.style.visibility = 'visible';
	        });

	        container.addEventListener('mouseleave', () => {
	            hoverText.style.visibility = 'hidden';
	        });
	    });
	});

	</script>
</body>
</html>