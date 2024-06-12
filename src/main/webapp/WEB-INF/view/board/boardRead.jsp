<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 읽기</title>
</head>
<body>
    <table border="1" width="100%">
        <tr>
            <td>번호</td>
            <td>${articleData.article.number}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${articleData.article.writer.name}</td>
        </tr>
        <tr>
            <td>제목</td>
            <td><c:out value="${articleData.article.title}" /></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><u:pre value="${articleData.content}" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
                <a href="list.do?category=${category}&pageNo=${pageNo}">[목록]</a>
                <c:if test="${authUser.id == articleData.article.writer.id}">
                    <a href="modify.do?no=${articleData.article.number}&category=${category}&pageNo=${pageNo}">[게시글수정]</a>
                    <a href="#" onclick="confirmDelete(event, ${articleData.article.number})">[게시글삭제]</a>
                </c:if>
            </td>
        </tr>
    </table>

    <!-- Display Comments -->
    <div>
        <h2>댓글</h2>
        <c:forEach var="comment" items="${comments}">
            <div>
                <strong>${comment.commentId}</strong>
                <span>${comment.formattedRegDate}</span>
                <p>${comment.content}</p>
                <c:if test="${authUser.id == comment.commentId}">
                    <a href="#" onclick="confirmDeleteComment(event, ${comment.comment_no})">[댓글삭제]</a>
                </c:if>

                <!-- Display Replies -->
                <div style="margin-left: 20px;">
                    <c:forEach var="reply" items="${comment.replies}">
                        <div>
                            <strong>${reply.replyId}</strong>
                            <span>${reply.formattedRegDate}</span>
                            <p>${reply.content}</p>
                            <c:if test="${authUser.id == reply.replyId}">
                                <a href="#" onclick="confirmDeleteReply(event, ${reply.reply_no})">[답글삭제]</a>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>

                <!-- Reply Form -->
                <form action="comment.do" method="post">
                    <input type="hidden" name="action" value="addReply" />
                    <input type="hidden" name="commentNo" value="${comment.comment_no}" />
                    <input type="hidden" name="articleNo" value="${articleData.article.number}" />
                    <input type="hidden" name="category" value="${category}" />
                    <input type="hidden" name="replyId" value="${authUser.id}" />
                    <input type="hidden" name="replyName" value="${authUser.memberName}" />
                    <textarea name="content" placeholder="답글을 입력하세요"></textarea>
                    <button type="submit">답글 달기</button>
                </form>
            </div>
        </c:forEach>

        <!-- Comment Form -->
        <form action="comment.do" method="post">
            <input type="hidden" name="action" value="addComment" />
            <input type="hidden" name="articleNo" value="${articleData.article.number}" />
            <input type="hidden" name="category" value="${category}" />
            <input type="hidden" name="commentId" value="${authUser.id}" />
            <input type="hidden" name="commentName" value="${authUser.memberName}" />
            <textarea name="content" placeholder="댓글을 입력하세요"></textarea>
            <button type="submit">댓글 달기</button>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function confirmDelete(event, articleNumber) {
        event.preventDefault();
        var isDelete = confirm("정말로 삭제하시겠습니까?");
        if (isDelete) {
            $.ajax({
                type: "POST",
                url: "delete.do",
                data: {
                    action: "deleteArticle",
                    id: articleNumber
                },
                success: function(response) {
                    alert(response);
                    window.location.href = "list.do?category=${category}&pageNo=${pageNo}";
                },
                error: function(xhr, status, error) {
                    alert("게시글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
                }
            });
        }
    }

    function confirmDeleteComment(event, commentNo) {
        event.preventDefault();
        var isDelete = confirm("정말로 댓글을 삭제하시겠습니까?");
        if (isDelete) {
            $.ajax({
                type: "POST",
                url: "commentdelete.do",
                data: {
                    action: "deleteComment",
                    id: commentNo
                },
                success: function(response) {
                    alert(response);
                    window.location.href = "read.do?no=${articleData.article.number}&category=${category}&pageNo=${pageNo}";
                },
                error: function(xhr, status, error) {
                    alert("댓글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
                }
            });
        }
    }

    function confirmDeleteReply(event, replyNo) {
        event.preventDefault();
        var isDelete = confirm("정말로 답글을 삭제하시겠습니까?");
        if (isDelete) {
            $.ajax({
                type: "POST",
                url: "commentdelete.do",
                data: {
                    action: "deleteReply",
                    id: replyNo
                },
                success: function(response) {
                    alert(response);
                    window.location.href = "read.do?no=${articleData.article.number}&category=${category}&pageNo=${pageNo}";
                },
                error: function(xhr, status, error) {
                    alert("답글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
                }
            });
        }
    }
    </script>
</body>
</html>
