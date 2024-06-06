<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>

<form action="delete.do?no=${delReq.productNum}" method="post">
<p>
번호 : <br/>${delReq.productNum}
</p>
<p>
제목 : <br/><input type="text" name="title" value="${delReq.productTitle}" readonly="readonly">
</p>
<p>
내용 : <br/>
<textarea rows="5" cols="30" name="content" readonly="readonly">${delReq.productContent}</textarea>
</p>

<input type="submit" value="글 삭제">
</form>

</body>
</html>