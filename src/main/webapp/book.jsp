<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 요청</title>
<link rel="stylesheet" href="/gza/css/book.css">
</head>
<body>
<div class="container">
    <div class="left-panel">
        <div class="title">예약 요청</div>
        <div class="info">
            <div class="section-title">예약 정보</div>
            <p>날짜: ${param.start_date} ~ ${param.end_date}</p>
            <p>게스트: ${param.guest}</p>
        </div>
        <div class="info">
            <div class="section-title">결제 수단</div>
            <div class="payment-methods">
                <label><input type="radio" name="payment_method" value="card" checked> 카드</label>
                <label><input type="radio" name="payment_method" value="kakao"> 카카오페이</label>
                <label><input type="radio" name="payment_method" value="naver"> 네이버페이</label>
            </div>
        </div>
    </div>
    <div class="right-panel">
        <div class="image-box">
            <img src="${param.image_url}" alt="상품 이미지">
        </div>
        <div class="info">
            <div class="section-title">${param.title}</div>
        </div>
        <div class="price-details">
            <p>₩${param.price} x ${param.days}박</p>
            <p>총 합계 (KRW): ₩${param.total_price}</p>
        </div>
        <button id="payment-button">결제하기</button>
    </div>
</div>

<script type="text/javascript">
        $(document).ready(function() {
            IMP.init('imp58657748');

            $('#payment-button').click(function() {

            	var merchantUid = 'merchant_' + new Date().getTime();

                var paymentData = {
                    pg: 'kcp',
                    pay_method: 'card',
                    merchant_uid: merchantUid,
                    name: '${param.product_name}',
                    amount: ${param.product_price},
                    buyer_email: 'buyer@example.com',
                    buyer_name: '홍길동',
                    buyer_tel: '010-1234-5678',
                    buyer_addr: '서울특별시 강남구 삼성동',
                    buyer_postcode: '123-456'
                };

                IMP.request_pay(paymentData, function(response) {
                    if (response.success) {
                        $.ajax({
                            url: '/registerReservation',
                            method: 'POST',
                            data: {
                                merchant_uid: response.merchant_uid,
                                amount: response.paid_amount,
                                buyer_email: response.buyer_email,
                                buyer_name: response.buyer_name,
                                buyer_tel: response.buyer_tel,
                                product_id: '${param.product_id}',
                                product_name: '${param.product_name}',
                                product_price: '${param.product_price}',
                                product_description: '${param.product_description}'
                            },
                            success: function(data) {
                                alert('결제 및 예약이 성공적으로 완료되었습니다.');
                            },
                            error: function(err) {
                                alert('결제는 성공했으나 예약 등록에 실패하였습니다.');
                            }
                        });
                        alert('결제가 성공적으로 완료되었습니다.');
                    } else {
                        alert('결제에 실패하였습니다. 오류 내용: ' + response.error_msg);
                    }
                });
            });
        });
    </script>
</body>
</html>
