<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시물</title>
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style>
.제목 {
    text-decoration: none; /* Remove underline */
    color: inherit; /* Keep default color */
    transition: color 0.3s; /* Smooth color transition */
}

a:visited {
    color: inherit; /* Keep visited link color the same */
}

a:hover {
    color: inherit; /* Keep hover link color the same */
}

a:active {
    color: inherit; /* Keep active link color the same */
}

.content-box {
    margin-bottom: 10px; /* Space between content boxes */
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.content-box .reply-box {
    margin-left: 20px; /* Indentation for replies */
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.number {
    color: #007bff; /* Blue color for numbers */
    font-weight: bold; /* Optional: Make numbers bold */
    transition: color 1s ;
    text-decoration: none;
}
</style>
</head>
<body>

<%@include file="../includes/sidebar.jsp"%>

    <div class="content">
        <div class="left">
            <div class="content-box">
                <h2>내가 작성한 게시글</h2>
                <div class="community-table-wrapper">
                    <table class="community-table">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>등록일</th>
                        </tr>
                        <c:if test="${articlePage.content.size() == 0}">
                            <tr>
                                <td colspan="5">게시글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="article" items="${articlePage.content}">
                            <tr>
                                <td class="numbers">${article.number}</td>
                                <td>
                                    <a class="제목" href="read.do?no=${article.number}&id=${id}&pageNo=${articlePage.currentPage}">
                                        ${article.title}
                                    </a>
                                </td>
                                <td>${article.writer.id}</td>
                                <td>${article.readCount}</td>
                                <td>${article.formattedRegDate}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${articlePage.total > 0}">
                            <tr>
                                <td colspan="5">
                                    <c:if test="${articlePage.currentPage > 1}">
                                        <a class="number" href="myboard.do?id=${id}&pageNo=${articlePage.currentPage - 1}"> 이전</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
                                        <c:if test="${pNo == articlePage.currentPage}">
                                            <span class="number">${pNo}</span>
                                        </c:if>
                                        <c:if test="${pNo != articlePage.currentPage}">
                                            <a class="number" href="myboard.do?id=${id}&pageNo=${pNo}">${pNo}</a>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${articlePage.currentPage < articlePage.totalPages}">
                                        <a class="number" href="myboard.do?id=${id}&pageNo=${articlePage.currentPage + 1}">다음</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="content-box">
                <h2>내가 작성한 댓글</h2>
                <div class="community-table-wrapper">
                    <table class="community-table">
                        <tr>
                            <th>작성된 글</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        <c:if test="${commentPage.content.size() == 0}">
                            <tr>
                                <td colspan="4">댓글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="comment" items="${commentPage.content}">
                            <tr>
                                <td>
                                    <a class="제목" href="read.do?no=${comment.article_no}&id=${id}&pageNo=${articlePage.currentPage}">
                                        ${comment.articleTitle}
                                    </a>
                                </td>
                                <td>${comment.content}</td>
                                <td>${comment.commentId}</td>
                                <td>${comment.formattedRegDate}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${commentPage.total > 0}">
                            <tr>
                                <td colspan="4">
                                    <c:if test="${commentPage.currentPage > 1}">
                                        <a class="number" href="myboard.do?id=${id}&commentPageNo=${commentPage.currentPage - 1}">이전</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${commentPage.totalPages}" var="pNo">
                                        <c:if test="${pNo == commentPage.currentPage}">
                                            <span class="number">${pNo}</span>
                                        </c:if>
                                        <c:if test="${pNo != commentPage.currentPage}">
                                            <a class="number" href="myboard.do?id=${id}&commentPageNo=${pNo}">${pNo}</a>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${commentPage.currentPage < commentPage.totalPages}">
                                        <a class="number" href="myboard.do?id=${id}&commentPageNo=${commentPage.currentPage + 1}">다음</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
            <div class="content-box">
                <h2>내가 작성한 답글</h2>
                <div class="community-table-wrapper">
                    <table class="community-table">
                        <tr>
                            <th>작성된 글</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        <c:if test="${replyPage.content.size() == 0}">
                            <tr>
                                <td colspan="4">답글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="reply" items="${replyPage.content}">
                            <tr>
                                <td>
                                    <a class="제목" href="read.do?no=${reply.board_num}&id=${id}&pageNo=${articlePage.currentPage}">
                                        ${reply.articleTitle}
                                    </a>
                                </td>
                                <td>${reply.content}</td>
                                <td>${reply.replyId}</td>
                                <td>${reply.formattedRegDate}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${replyPage.total > 0}">
                            <tr>
                                <td colspan="4">
                                    <c:if test="${replyPage.currentPage > 1}">
                                        <a class="number" href="myboard.do?id=${id}&replyPageNo=${replyPage.currentPage - 1}">이전</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${replyPage.totalPages}" var="pNo">
                                        <c:if test="${pNo == replyPage.currentPage}">
                                            <span class="number">${pNo}</span>
                                        </c:if>
                                        <c:if test="${pNo != replyPage.currentPage}">
                                            <a class="number" href="myboard.do?id=${id}&replyPageNo=${pNo}">${pNo}</a>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${replyPage.currentPage < replyPage.totalPages}">
                                        <a class="number" href="myboard.do?id=${id}&replyPageNo=${replyPage.currentPage + 1}">다음 </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</div>
<%@include file="../includes/footer.jsp"%>
</html>
