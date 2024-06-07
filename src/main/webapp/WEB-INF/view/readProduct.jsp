<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="guestbook.model.Message"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ page import="guestbook.service.WriteMessageService"%>
<%@ page import="guestbook.model.Message"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>작성자</td>
			<td>${productData.product.writer.id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${productData.product.productTitle}</td>
		</tr>
		<tr>
			<td>서브제목</td>
			<td>${productData.content.productSubTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><c:out value="${productData.content.productContent}" /></td>
		</tr>
		<tr>
			<td>유형</td>
			<td>${productData.content.productType}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${productData.product.price}</td>
		</tr>
		<tr>
			<td>게스트 수</td>
			<td>${productData.content.guests}</td>
		</tr>
		<tr>
			<td>위치</td>
			<td>${productData.content.location}</td>
		</tr>

	</table>

	<a href="read.do">목록으로 돌아가기</a>
	<c:if test="${authUser.id == productData.product.writer.id}">
		<c:if test="${not empty productData.product.productNum}">
		</c:if>
	</c:if>
	<br/>
<%
    String pageNumberStr = request.getParameter("page");
    int pageNumber = 1;
    if (pageNumberStr != null) {
        pageNumber = Integer.parseInt(pageNumberStr);
    }
      GetMessageListService messageListService = GetMessageListService.getInstance();
      MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>" /> 

    <title>Guestbook Message List</title>
</head>
<body>
    <form action="writeMessage.jsp" method="post">
        Name: <input type="text" name="guestName"><br>
        Password: <input type="password" name="password"><br>
        Message: <textarea name="message" cols="30" rows="3"></textarea><br>
        <input type="submit" value="Post Message">
    </form>
    <hr>
    <c:if test="${empty viewData.messageList}">
        No messages
    </c:if>
    <c:if test="${!empty viewData.messageList}">
        <table border="1">
            <c:forEach var="message" items="${viewData.messageList}">
                <tr>
                    <td>
                        Message ID: ${message.id}<br>
                        Name: ${message.guestName}<br>
                        Message: ${message.message}<br>
                    </td>
                </tr>
            </c:forEach> 
        </table>
        <c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
            <a href="writeMessage.jsp?page=${pageNum}">[${pageNum}]</a>
        </c:forEach>
    </c:if>
</body>
</html>