<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

<form action="modify.do?no=${modReq.productNum}" method="post">
<p>
번호 : <br/>${modReq.productNum}
</p>
<p>
제목 : <br/><input type="text" name="title" value="${modReq.productTitle}">
<c:if test="${errors.title}">제목을 입력하세요</c:if>
</p>
<p>
내용 : <br/>
<textarea rows="5" cols="30" name="content">${modReq.productContent}</textarea>
</p>

<input type="submit" value="글 수정">
</form>

</body>
</html>