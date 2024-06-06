<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>

    <form action="write.do" method="post">
        <p>
            제목 : <br/><input type="text" name="title" value="${param.productTitle}">
            <c:if test="${errors.title}">제목을 입력하세요.</c:if>
        </p>
        
        <p>
            서브제목 : <br/><input type="text" name="subtitle" value="${param.productSubTitle}">
            <c:if test="${errors.title}">서브제목을 입력하세요.</c:if>
        </p>
        
        <p>
            내용 : <br/><textarea name="content" rows="5" cols="100">${param.productContent}</textarea>
        </p>
        
        <p>
            유형 : <br/>
            <select name="type">
                <option value="숙박" <c:if test="${param.type == '숙박'}">selected</c:if>>숙박</option>
                <option value="체험" <c:if test="${param.type == '체험'}">selected</c:if>>체험</option>
                <option value="활동" <c:if test="${param.type == '활동'}">selected</c:if>>활동</option>
            </select>
        </p>
        
        <p>
            가격 : <br/><input type="number" name="price" value="${param.price}">
            <c:if test="${errors.price}">가격을 입력하세요.</c:if>
        </p>
        
        <p>
            이미지 URL : <br/><input type="text" name="imgUrl" value="${param.imgUrl}">
        </p>
        
        <p>
            게스트 수 : <br/><input type="number" name="guests" value="${param.guests}">
        </p>
        
        <p>
            위치 : <br/><input type="text" name="location" value="${param.location}">
        </p>
        
        <input type="submit" value="새 글 등록">
    </form>

</body>
</html>