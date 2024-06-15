<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 쓰기</title>
    <link rel="stylesheet" href="/gza/css/header.css">
    <link rel="stylesheet" href="/gza/css/boardMain.css">
    <style type="text/css">
        .body {
            width: 90%;
        }

        /* Adjusted button and form styling */
        .community-table form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .community-table form label {
            flex: 1 1 100%; /* Full width for label */
            margin-bottom: 10px; /* Add margin between form elements */
        }

        .community-table form .form-input {
            flex: 1 1 100%; /* Full width for input fields */
        }

        .community-table form .form-input input[type="text"],
        .community-table form .form-input textarea {
            width: calc(100% - 20px); /* Adjust width of input and textarea */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: box-shadow 0.3s;
        }

        .community-table form .form-input textarea {
            height: 150px; /* Adjust height for textarea */
        }

        .btn-primary,
        .btn-secondary {
            padding: 8px 16px; /* Reduced padding for buttons */
            font-size: 14px; /* Adjusted font size */
            border-radius: 4px; /* Rounded corners */
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-primary {
            background-color: #007bff; /* Blue background */
            color: #fff; /* White text */
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker shade of blue on hover */
        }

        .btn-secondary {
            background-color: skyblue/* Red background */
            color: #fff; /* White text */
            border: none;
        }

        .btn-secondary:hover {
            background-color: lighblue /* Darker shade of red on hover */
        }
    </style>
</head>
<body>
    <%@ include file="../includes/sidebar.jsp" %>
    <div class="content">
        <div class="left">
            <div class="content-box">
                <div class="community-section">
                    <h2>게시글 쓰기</h2>
                    <div class="community-table-wrapper">
                        <table class="community-table">
                            <tr>
                                <td>
                                    <form action="write.do" method="post">
                                        <div class="form-input">
                      
                                            <select id="category" name="category" size="1">
                                                <option value="">카테고리를 선택해주세요.</option>
                                                <option value="freeboard">자유게시판</option>
                                                <option value="togetherboard">동행게시판</option>
                                                <option value="latterboard">후기게시판</option>
                                            </select>
                                        </div>
                                        <div class="form-input">
                                            <label for="title">제목:</label>
                                            <input type="text" id="title" name="title" value="${param.title}">
                                            <c:if test="${errors.title}">제목을 입력하세요.</c:if>
                                        </div>
                                        <div class="form-input">
                                            <label for="content">내용:</label>
                                            <textarea id="content" name="content" rows="5" cols="30">${param.content}</textarea>
                                        </div>
                                        <div class="form-input">
                                            <input type="submit" class="btn-primary" value="새 글 등록">
                                            <button type="button" class="btn-secondary" onclick="goBackToPreviousPage()">이전 페이지로 돌아가기</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        const categorySelect = document.getElementById("category");
        const submitButton = document.querySelector(".btn-primary");

        submitButton.addEventListener("click", function(event) {
            const selectedCategory = categorySelect.value;
            if (selectedCategory === "") {
                event.preventDefault();
                alert("카테고리를 선택해주세요.");
            }
        });

        function goBackToPreviousPage() {
            var isGoBack = confirm("게시글 작성 내용을 저장하지 않았습니다. 이전 페이지로 돌아가시겠습니까?");
            if (isGoBack) {
                history.back();
            }
        }
    </script>
   </div>
</body>
 <%@ include file="../includes/footer.jsp" %>
</html>
