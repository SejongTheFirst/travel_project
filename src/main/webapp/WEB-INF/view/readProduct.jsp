<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>작성자</td>
			<td>${productData.product.writer.id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${productData.product.productTitle}</td>
		</tr>
		<tr>
			<td>서브제목</td>
			<td>${productData.content.productSubTitle}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><img src="/gza/imageStorage/${productData.image.storeName}" alt="${productData.image.originalName}" width="100" height="100"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><c:out value="${productData.content.productContent}" /></td>
		</tr>
		<tr>
			<td>유형</td>
			<td>${productData.content.productType}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td><span id="price">${productData.product.price}</span>원</td>
		</tr>
		<tr>
			<td>게스트 수</td>
			<td>${productData.content.guests}</td>
		</tr>
		<tr>
			<td>위치</td>
			<td>${productData.content.location}</td>
		</tr>
		<tr>
			<td>시작 날짜</td>
			<td><input type="date" id="start_date" name="start_date" onchange="calculateTotalPrice()"></td>
		</tr>
		<tr>
			<td>종료 날짜</td>
			<td><input type="date" id="end_date" name="end_date" onchange="calculateTotalPrice()"></td>
		</tr>
		<tr>
			<td>총 가격</td>
			<td><span id="total_price">0원</span></td>
		</tr>
	</table>

	<a href="list.do">목록으로 돌아가기</a>
	<c:if test="${authUser.id == productData.product.writer.id}">
		<c:if test="${not empty productData.product.productNum}">
			<a href="modify.do?no=${productData.product.productNum}">[게시글 수정]</a>
			<a href="delete.do?no=${productData.product.productNum}">[게시글 삭제]</a>
		</c:if>
	</c:if>
	<c:if test="${authUser.id != productData.product.writer.id}">
        <form action="verify.do" method="post">
            <input type="hidden" name="productNum" value="${productData.product.productNum}">
            <input type="hidden" name="title" value="${productData.product.productTitle}">
            <input type="hidden" name="price" value="${productData.product.price}">
            <input type="hidden" name="guest" value="${productData.content.guests}">
            <input type="hidden" name="location" value="${productData.content.location}">
            <input type="hidden" name="writerId" value="${productData.product.writer.id}">
            <input type="hidden" name="imageUrl" value="/gza/imageStorage/${productData.image.storeName}">
            <input type="hidden" name="start_date" id="start_date_input">
            <input type="hidden" name="end_date" id="end_date_input">
            <input type="hidden" name="total_price" id="total_price_input">
            <input type="hidden" name="days" id="days_input">
            <input type="submit" value="예약하기" onclick="return validateForm()">
        </form>
    </c:if>

<script type="text/javascript">

function calculateTotalPrice() {
    const startDateValue = document.getElementById('start_date').value;
    const endDateValue = document.getElementById('end_date').value;
    const startDate = new Date(startDateValue);
    const endDate = new Date(endDateValue);
    const price = parseFloat(document.getElementById('price').innerText);
    const timeDiff = endDate - startDate;
    const daysDiff = timeDiff / (1000 * 3600 * 24);
    const totalPrice = daysDiff * price;
    
    if (!startDateValue || !endDateValue || daysDiff<=0) {
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
</body>
</html>
