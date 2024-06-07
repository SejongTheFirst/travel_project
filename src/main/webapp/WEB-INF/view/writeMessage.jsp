<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.WriteMessageService"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="guestbook.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
WriteMessageService writeService = WriteMessageService.getInstance();
writeService.write(message);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	comment 하셨습니다~
	<br />
	<a href="readProduct.jsp"> [목록보기]</a>
</body>
</html>