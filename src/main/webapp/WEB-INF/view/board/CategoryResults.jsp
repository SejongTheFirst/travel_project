<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>${category} 게시판</title>
<link rel="stylesheet" href="/gza/css/header.css">
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style type="text/css">
.body {
    width: 90%;
}
.footer{
margin-top: 600px;
}
</style>
</head>
<body>

    <div class="main-container">
        <%@include file="../includes/sidebar.jsp"%>
        <div class="content">
            <div class="content-box">
                <c:set var="category" value="${param.category}" />
                <div class="community-section">
                
                    <div class="community-table-wrapper">
                        <h2>${category} 게시판</h2>
                        
                        <!-- 검색 폼 -->
                        <form action="categorysearch.do" method="get">
                            <input type="hidden" name="category" value="${category}">
                            <select name="searchType">
                                <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                                <option value="writerName" ${searchType == 'writerName' ? 'selected' : ''}>작성자</option>
                            </select>
                            <input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요" required>
                            <button type="submit">검색</button>
                        </form>

                        <table class="community-table">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>등록일</th>
                            </tr>

                            <c:if test="${empty articlePage.content}">
                                <tr>
                                    <td colspan="5">게시글이 없습니다.</td>
                                </tr>
                            </c:if>

                            <c:forEach var="article" items="${articlePage.content}">
                                <tr>
                                    <td>${article.number}</td>
                                    <td><a href="read.do?no=${article.number}&category=${category}&pageNo=${articlePage.currentPage}">${article.title}</a></td>
                                    <td>${article.writer.name}</td>
                                    <td>${article.readCount}</td>
                                    <td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>

                            <c:if test="${articlePage.total > 0}">
                                <tr>
                                    <td colspan="5">
                                        <c:if test="${articlePage.currentPage > 1}">
                                            <a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${articlePage.currentPage - 1}">[이전]</a>
                                        </c:if>
                                        <c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
                                            <c:choose>
                                                <c:when test="${pNo == articlePage.currentPage}">
                                                    <span>[${pNo}]</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${pNo}">[${pNo}]</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${articlePage.currentPage < articlePage.totalPages}">
                                            <a href="categorysearch.do?category=${category}&searchType=${searchType}&keyword=${keyword}&pageNo=${articlePage.currentPage + 1}">[다음]</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </table>

                       
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
    </div>
    <div>
    <%@include file="../includes/footer.jsp"%>
</div>
</html>
