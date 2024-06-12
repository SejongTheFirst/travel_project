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