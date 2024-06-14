<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내가 쓴 게시물</title>
<link rel="stylesheet" href="/gza/css/boardMain.css">
<style>
.no-style-link {
	text-decoration: none;
	color: inherit;
}

.no-style-link:hover {
	text-decoration: none;
	color: inherit;
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
                                    <td>${article.number}</td>
                                    <td>
                                        <a href="read.do?no=${article.number}&id=${id}&pageNo=${articlePage.currentPage}">
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
                                            <a href="myboard.do?id=${id}&pageNo=${articlePage.currentPage - 1}">[이전]</a>
                                        </c:if>
                                        <c:forEach begin="1" end="${articlePage.totalPages}" var="pNo">
                                            <c:if test="${pNo == articlePage.currentPage}">
                                                <span>[${pNo}]</span>
                                            </c:if>
                                            <c:if test="${pNo != articlePage.currentPage}">
                                                <a href="myboard.do?id=${id}&pageNo=${pNo}">[${pNo}]</a>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${articlePage.currentPage < articlePage.totalPages}">
                                            <a href="myboard.do?id=${id}&pageNo=${articlePage.currentPage + 1}">[다음]</a>
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
                                        <a href="read.do?no=${comment.article_no}&id=${id}&pageNo=${articlePage.currentPage}">
                                            ${comment.articleTitle}
                                        </a>
                                    </td>
                                    <td>${comment.content}</td>
                                    <td>${comment.commentName}</td>
                                    <td>${comment.formattedRegDate}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${commentPage.total > 0}">
                                <tr>
                                    <td colspan="4">
                                        <c:if test="${commentPage.currentPage > 1}">
                                            <a href="myboard.do?id=${id}&commentPageNo=${commentPage.currentPage - 1}">[이전]</a>
                                        </c:if>
                                        <c:forEach begin="1" end="${commentPage.totalPages}" var="pNo">
                                            <c:if test="${pNo == commentPage.currentPage}">
                                                <span>[${pNo}]</span>
                                            </c:if>
                                            <c:if test="${pNo != commentPage.currentPage}">
                                                <a href="myboard.do?id=${id}&commentPageNo=${pNo}">[${pNo}]</a>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${commentPage.currentPage < commentPage.totalPages}">
                                            <a href="myboard.do?id=${id}&commentPageNo=${commentPage.currentPage + 1}">[다음]</a>
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
                                        <a href="read.do?no=${reply.board_num}&id=${id}&pageNo=${articlePage.currentPage}">
                                            ${reply.articleTitle}
                                        </a>
                                    </td>
                                    <td>${reply.content}</td>
                                    <td>${reply.replyName}</td>
                                    <td>${reply.formattedRegDate}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${replyPage.total > 0}">
                                <tr>
                                    <td colspan="4">
                                        <c:if test="${replyPage.currentPage > 1}">
                                            <a href="myboard.do?id=${id}&replyPageNo=${replyPage.currentPage - 1}">[이전]</a>
                                        </c:if>
                                        <c:forEach begin="1" end="${replyPage.totalPages}" var="pNo">
                                            <c:if test="${pNo == replyPage.currentPage}">
                                                <span>[${pNo}]</span>
                                            </c:if>
                                            <c:if test="${pNo != replyPage.currentPage}">
                                                <a href="myboard.do?id=${id}&replyPageNo=${pNo}">[${pNo}]</a>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${replyPage.currentPage < replyPage.totalPages}">
                                            <a href="myboard.do?id=${id}&replyPageNo=${replyPage.currentPage + 1}">[다음]</a>
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
<%@include file="../includes/footer.jsp"%>
</html>
