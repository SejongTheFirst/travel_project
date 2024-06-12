<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 요청</title>
<link rel="stylesheet" href="/gza/css/book.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
<div class="container">
    <div class="left-panel">
        <div class="title">예약 요청</div>
        <div class="info">
            <div class="section-title">예약 정보</div>
            <p>날짜: ${verifyRequest.startDate} ~ ${verifyRequest.endDate}</p>
            <p>게스트: ${verifyRequest.guest}</p>
        </div>
        <div class="info">
            <div class="section-title">결제 수단</div>
            <div class="payment-methods">
                <label><input type="radio" name="payment_method" value="card" checked> 카드</label>
                <label><input type="radio" name="payment_method" value="kakaopay"> 카카오페이</label>
                <label><input type="radio" name="payment_method" value="naver"> 네이버페이</label>
            </div>
        </div>
        <div class="info">
            <div class="section-title">사용자 정보</div>
            <p>
                <label for="buyer_email">이메일:</label>
                <input type="email" id="buyer_email" name="buyer_email" required>
            </p>
            <p>
                <label for="buyer_name">이름:</label>
                <input type="text" id="buyer_name" name="buyer_name" required>
            </p>
            <p>
                <label for="buyer_tel">전화번호:</label>
                <input type="tel" id="buyer_tel" name="buyer_tel" required>
            </p>
        </div>
    </div>
    <div class="right-panel">
        <div class="image-box">
            <img src="${verifyRequest.imageUrl}" alt="상품 이미지">
        </div>
        <div class="info">
            <div class="section-title">${verifyRequest.title}</div>
        </div>
        <div class="price-details">
            <p>₩${verifyRequest.price} x ${verifyRequest.days}박</p>
            <p>총 합계 (KRW): ₩${verifyRequest.totalPrice}</p>
        </div>
        <form action="book.do" method="post">
            <input type="hidden" name="merchant_uid">
            <input type="hidden" name="amount" value="${verifyRequest.totalPrice}"> <!--  -->
            <input type="hidden" name="buyer_email" id="buyer_email_hidden">
            <input type="hidden" name="buyer_name" id="buyer_name_hidden">
            <input type="hidden" name="buyer_tel" id="buyer_tel_hidden">
            <input type="hidden" name="product_id" value="${verifyRequest.productNum}"> <!--  -->
            <input type="hidden" name="product_name" value="${verifyRequest.title}"> <!--  -->
            <input type="hidden" name="product_price" value="${verifyRequest.price}"> <!--  -->
            <input type="hidden" name="start_date" value="${verifyRequest.startDate}"> <!--  -->
            <input type="hidden" name="end_date" value="${verifyRequest.endDate}"> <!--  -->
            <input type="hidden" name="days" value="${verifyRequest.days}"> <!--  -->
            <input type="hidden" name="guest" value="${verifyRequest.guest}"> <!--  -->
            <input type="hidden" name="sellerId" value="${verifyRequest.sellerId}"> <!--  -->
            <input type="hidden" name="imageUrl" value="${verifyRequest.imageUrl}"> <!--  -->
            <input type="hidden" name="title" value="${verifyRequest.title}"> <!--  -->
            <input type="hidden" name="location" value="${verifyRequest.location}"> <!--  -->
            <input type="hidden" name="payment_method" id="payment_method_hidden">
            <button type="button" id="payment-button">결제하기</button>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        IMP.init('imp58657748');

        $('#payment-button').click(function() {
            var selectedPaymentMethod = $('input[name="payment_method"]:checked').val();
            var pg, pay_method;

            if (selectedPaymentMethod === 'card') {
                pg = 'html_inicis';
                pay_method = 'card';
            } else if (selectedPaymentMethod === 'kakaopay') {
                pg = 'kakaopay';
                pay_method = 'card';
            } else if (selectedPaymentMethod === 'naver') {
                pg = 'naverpay';
                pay_method = 'easy';
            }

            var currentDate = new Date().toISOString().split('T')[0]; // 현재 날짜를 YYYY-MM-DD 형식으로 가져오기
            var merchantUid = "${verifyRequest.sellerId}_" + currentDate;

            var paymentData = {
                pg: pg,
                pay_method: pay_method,
                merchant_uid: merchantUid,
                name: '${verifyRequest.title}',
                amount: ${verifyRequest.totalPrice},
                buyer_email: $('#buyer_email').val(),
                buyer_name: $('#buyer_name').val(),
                buyer_tel: $('#buyer_tel').val(),
            };

            IMP.request_pay(paymentData, function(response) {
                if (response.success) {
                    $('#buyer_email_hidden').val(response.buyer_email);
                    $('#buyer_name_hidden').val(response.buyer_name);
                    $('#buyer_tel_hidden').val(response.buyer_tel);
                    $('#payment_method_hidden').val(selectedPaymentMethod);
                    $('form input[name="merchant_uid"]').val(merchantUid); // 생성된 merchant_uid 설정
                    $('form').submit();
                } else {
                    alert('결제에 실패하였습니다. 오류 내용: ' + response.error_msg);
                }
            });
        });
    });
</script>
</body>
</html>
