<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙박 및 체험활동 예약</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f8f9fa;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        header .logo {
            font-size: 24px;
            font-weight: bold;
            color: #ff385c;
        }
        header .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            display: flex;
            align-items: center;
        }
        header .search-bar input {
            width: 100%;
            padding: 12px 20px;
            border: 1px solid #ddd;
            border-radius: 50px;
            font-size: 16px;
            transition: box-shadow 0.3s;
        }
        header .search-bar input:focus {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            outline: none;
        }
        header .nav-icons {
            display: flex;
            gap: 20px;
        }
        header .nav-icons a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            font-weight: 600;
            transition: color 0.3s;
        }
        header .nav-icons a:hover {
            color: #ff385c;
        }
        .categories {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 20px 0;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }
        .categories a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
            font-weight: 600;
            transition: color 0.3s;
        }
        .categories a:hover {
            color: #ff385c;
        }
        main {
            padding: 40px;
        }
        .section {
            margin-bottom: 60px;
        }
        .section h2 {
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
            color: #333;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            width: calc(25% - 20px);
            background-color: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .card .content {
            padding: 20px;
            text-align: center;
        }
        .card .title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #333;
        }
        .card .price {
            font-size: 16px;
            font-weight: 400;
            color: #777;
        }
        footer {
            padding: 20px 40px;
            text-align: center;
            background-color: #fff;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">Airbnb</div>
        <div class="search-bar">
            <input type="text" placeholder="여행지 검색">
        </div>
        <div class="nav-icons">
            <a href="#">숙소</a>
            <a href="#">체험</a>
            <a href="#">온라인 체험</a>
            <a href="http://localhost:8080/gza/login.do">로그인</a>
        </div>
    </header>
    <div class="categories">
        <a href="#">캘리포니아</a>
        <a href="#">와이파이 가능</a>
        <a href="#">휴양지</a>
        <a href="#">체험</a>
        <a href="#">로맨틱</a>
        <a href="#">독특한 숙소</a>
    </div>
    <main>
        <div class="section">
            <h2>숙박</h2>
            <div class="card-container">
                <div class="card">
                    <img src="data:image/png;base64,{{base64_accommodation_image}}" alt="숙박 이미지 1">
                    <div class="content">
                        <div class="title">숙소 1</div>
                        <div class="price">가격 1</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_accommodation_image}}" alt="숙박 이미지 2">
                    <div class="content">
                        <div class="title">숙소 2</div>
                        <div class="price">가격 2</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_accommodation_image}}" alt="숙박 이미지 3">
                    <div class="content">
                        <div class="title">숙소 3</div>
                        <div class="price">가격 3</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_accommodation_image}}" alt="숙박 이미지 4">
                    <div class="content">
                        <div class="title">숙소 4</div>
                        <div class="price">가격 4</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <h2>체험</h2>
            <div class="card-container">
                <div class="card">
                    <img src="data:image/png;base64,{{base64_experience_image}}" alt="체험 이미지 1">
                    <div class="content">
                        <div class="title">체험 1</div>
                        <div class="price">가격 1</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_experience_image}}" alt="체험 이미지 2">
                    <div class="content">
                        <div class="title">체험 2</div>
                        <div class="price">가격 2</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_experience_image}}" alt="체험 이미지 3">
                    <div class="content">
                        <div class="title">체험 3</div>
                        <div class="price">가격 3</div>
                    </div>
                </div>
                <div class="card">
                    <img src="data:image/png;base64,{{base64_experience_image}}" alt="체험 이미지 4">
                    <div class="content">
                        <div class="title">체험 4</div>
                        <div class="price">가격 4</div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        Footer Content
    </footer>
</body>
</html>