<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="/gza/css/newProductForm.css">
<style>
    .image-upload-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .image-upload {
        border: 2px dashed #ccc;
        padding: 20px;
        cursor: pointer;
        text-align: center;
        position: relative;
        width: 150px;
        height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .image-upload.has-image {
        border: none;
    }
    .image-upload img {
        max-width: 100%;
        max-height: 100%;
        height: auto;
        width: auto;
    }
    .image-upload .delete-button {
        position: absolute;
        top: 5px;
        right: 5px;
        background: red;
        color: white;
        border: none;
        border-radius: 50%;
        cursor: pointer;
    }
</style>
</head>
<body>
	<main>
		<form class="product-form" action="register.do" method="post"
			enctype="multipart/form-data" accept="image/*">
			<div class="img-section">
				<h2>이미지 업로드</h2>
                <div id="image-upload-container" class="image-upload-container">
                    <div class="image-upload">
                        <input type="file" name="file1" accept="image/*">
                        <i class="fa fa-plus"></i>
                        <p>이미지 추가</p>
                    </div>
                    <div class="image-upload">
                        <input type="file" name="file2" accept="image/*">
                        <i class="fa fa-plus"></i>
                        <p>이미지 추가</p>
                    </div>
                    <div class="image-upload">
                        <input type="file" name="file3" accept="image/*">
                        <i class="fa fa-plus"></i>
                        <p>이미지 추가</p>
                    </div>
                    <div class="image-upload">
                        <input type="file" name="file4" accept="image/*">
                        <i class="fa fa-plus"></i>
                        <p>이미지 추가</p>
                    </div>
                    <div class="image-upload">
                        <input type="file" name="file5" accept="image/*">
                        <i class="fa fa-plus"></i>
                        <p>이미지 추가</p>
                    </div>
                </div>
			</div>
			<div class="horizontal-line"></div>
			<div class="details-pricing-container">
				<div class="details-section">
					<div class="basic-info">
						<label>main_title: <input type="text" name="title"
							value="${param.productTitle}"></label>
						<c:if test="${errors.title}">제목을 입력하세요.</c:if>
						<label>sub_title: <input type="text" name="subtitle"
							value="${param.productSubTitle}"></label>
						<c:if test="${errors.title}">서브제목을 입력하세요.</c:if>
						<label>location : <input type="text" name="location"
							value="${param.location}"></label>
					</div>
					<div class="content-info">
						<label>Product_Content: <br>
						<textarea name="content" rows="5" cols="100">${param.productContent}</textarea></label>
					</div>
				</div>
				<div class="vertical-line"></div>
				<div class="pricing-section">
					<label>₩ <input type="number" name="price"
						value="${param.price}"> Price/박
					</label>
					<c:if test="${errors.price}">가격을 입력하세요.</c:if>
					<label>유형: <select name="category">
							<option value="숙박"
								<c:if test="${param.category == '숙박'}">selected</c:if>>숙박</option>
							<option value="체험"
								<c:if test="${param.category == '체험'}">selected</c:if>>체험</option>
							<option value="활동"
								<c:if test="${param.category == '활동'}">selected</c:if>>활동</option>
					</select>
					</label> <label>최대인원: <input type="number" name="guests"
						value="${param.guests}"></label>
					<button class="registerBtn" type="submit">등록하기</button>
				</div>
			</div>
		</form>
	</main>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            function updateFileInputs() {
                document.querySelectorAll("input[type='file']").forEach(function(fileInput) {
                    fileInput.addEventListener('change', function(event) {
                        var file = event.target.files[0];
                        if (!file) return;

                        var reader = new FileReader();
                        reader.onload = function(e) {
                            var imgContainer = document.createElement('div');
                            var img = document.createElement('img');
                            img.src = e.target.result;
                            img.alt = "Uploaded Image";
                            var deleteButton = document.createElement('button');
                            deleteButton.type = 'button';
                            deleteButton.className = 'delete-button';
                            deleteButton.textContent = 'X';

                            imgContainer.appendChild(img);
                            imgContainer.appendChild(deleteButton);

                            var parentDiv = event.target.closest('.image-upload');
                            parentDiv.appendChild(imgContainer);

                            parentDiv.style.border = 'none';
                            fileInput.style.display = 'none';
                            var icon = parentDiv.querySelector("i");
                            var paragraph = parentDiv.querySelector("p");
                            if (icon) icon.style.display = 'none';
                            if (paragraph) paragraph.style.display = 'none';
                            parentDiv.classList.add('has-image');
                        }
                        reader.readAsDataURL(file);
                    });
                });
            }

            document.querySelectorAll('.image-upload').forEach(function(element) {
                element.addEventListener('click', function(event) {
                    if (!event.target.classList.contains('delete-button')) {
                        var fileInput = this.querySelector("input[type='file']");
                        if (fileInput) {
                            fileInput.click();
                            event.stopPropagation(); // 추가된 이벤트 전파 방지
                        }
                    }
                });
            });

            updateFileInputs();

            document.addEventListener('click', function(event) {
                if (event.target.classList.contains('delete-button')) {
                    var parentDiv = event.target.closest('.image-upload');
                    parentDiv.style.border = '2px dashed #ccc';
                    var img = parentDiv.querySelector('img');
                    var deleteButton = parentDiv.querySelector('.delete-button');
                    if (img) img.remove();
                    if (deleteButton) deleteButton.remove();
                    var fileInput = parentDiv.querySelector('input[type="file"]');
                    fileInput.value = '';
                    fileInput.style.display = 'block';
                    var icon = parentDiv.querySelector("i");
                    var paragraph = parentDiv.querySelector("p");
                    if (icon) icon.style.display = 'block';
                    if (paragraph) paragraph.style.display = 'block';
                    parentDiv.classList.remove('has-image');
                }
            });
        });
    </script>
	<%@include file="../includes/footer.jsp"%>

</body>
</html>
