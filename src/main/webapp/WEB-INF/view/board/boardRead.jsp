<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<title>게시글 읽기</title>
<link rel="stylesheet" href="/gza/css/header.css">
<link rel="stylesheet" href="/gza/css/boardMain.css">
<link rel="stylesheet" href="/gza/css/boardRead.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<%@include file="../includes/sidebar.jsp"%>
<div class="content">
    <div class="left">
        <div class="content-box">
            <c:set var="category" value="${category}" />
            <div class="community-section">
                <h2>${category}</h2>
                <div class="community-table-wrapper">
                    <table class="community-table">
                        <tr>
                            <td>번호</td>
                            <td>${articleData.article.number}</td>
                        </tr>
                        <tr>
                            <td>작성자</td>
                            <td>${articleData.article.writer.id}</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><c:out value="${articleData.article.title}" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />&nbsp;
                                <a class="제목" href="list.do?category=${category}&pageNo=${pageNo}">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <c:if test="${authUser.id == articleData.article.writer.id}">
                                    <a class="제목" href="modify.do?no=${articleData.article.number}&category=${category}&pageNo=${pageNo}">게시글수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="제목" href="#" onclick="confirmDelete(event, ${articleData.article.number}, '${category}', ${pageNo})">게시글삭제</a>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                        <c:set var="userInput" value="${articleData.content }"></c:set>
                            <td colspan="3"><span id="output"></span></td>
                        </tr>
                    </table>
                    <br>
                    <div class="center">
                        <h2><i class="fa-icon fas fa-comments"></i>댓글</h2>
                        <c:forEach var="comment" items="${comments}">
                            <div class="comment-item">
                                <div class="comment-id">
                                    <i class="fa fa-user"></i>
                                    <strong>${comment.commentId}</strong>
                                </div>
                                <span style="float: right;">${comment.formattedRegDate}</span>
                                <div class="comment-actions">
                                    <c:if test="${authUser.id == comment.commentId}">
                                        <a href="#" class="제목" onclick="showEditCommentForm(${comment.comment_no}, '${comment.content}', ${articleData.article.number}, '${category}', ${pageNo})"><i class="fa-icon fas fa-edit"></i>댓글수정</a>
                                        <a href="#" class="제목" onclick="confirmDeleteComment(event, ${comment.comment_no}, ${articleData.article.number}, '${category}', ${pageNo})"><i class="fa-icon fas fa-trash-alt"></i>댓글삭제</a>
                                    </c:if>
                                </div>
                                <p>${comment.content}</p>
                                <c:if test="${not empty authUser}">
                                    <a class="제목" href="#" onclick="toggleReplyForm(${comment.comment_no})"><i class="fa-icon fas fa-reply"></i>답글 달기</a>
                                </c:if>
                                <form id="editCommentForm_${comment.comment_no}" style="display:none;" onsubmit="event.preventDefault(); updateComment(${comment.comment_no}, ${articleData.article.number}, '${category}', ${pageNo});">
                                    <textarea id="editCommentContent_${comment.comment_no}" name="content">${comment.content}</textarea>
                                    <button type="submit">수정하기</button>
                                    <button type="button" onclick="hideEditCommentForm(${comment.comment_no})">취소</button>
                                </form>
                                <div style="margin-left: 20px;">
                                    <c:forEach var="reply" items="${comment.replies}">
                                        <div class="reply-item">
                                            <div class="reply-id">
                                                <i class="fa fa-user"></i>
                                                <strong>${reply.replyId}</strong>
                                            </div>
                                            <span>${reply.formattedRegDate}</span>
                                            <div class="reply-actions">
                                                <c:if test="${authUser.id == reply.replyId}">
                                                    <a class="제목" href="#" onclick="confirmDeleteReply(event, ${reply.reply_no}, ${articleData.article.number}, '${category}', ${pageNo})"><i class="fa-icon fas fa-trash-alt"></i>답글삭제</a>
                                                    <a class="제목" href="#" onclick="showEditReplyForm(${reply.reply_no}, '${reply.content}', ${articleData.article.number}, '${category}', ${pageNo})"><i class="fa-icon fas fa-edit"></i>답글수정</a>
                                                </c:if>
                                            </div>
                                            <p>${reply.content}</p>
                                            <form id="editReplyForm_${reply.reply_no}" style="display:none;" onsubmit="event.preventDefault(); updateReply(${reply.reply_no}, ${articleData.article.number}, '${category}', ${pageNo});">
                                                <textarea id="editReplyContent_${reply.reply_no}" name="content">${reply.content}</textarea>
                                                <button type="submit">수정하기</button>
                                                <button type="button" onclick="hideEditReplyForm(${reply.reply_no})">취소</button>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>
                                <form id="replyForm_${comment.comment_no}" action="comment.do" method="post" style="display:none;">
                                    <input type="hidden" name="action" value="addReply" />
                                    <input type="hidden" name="commentNo" value="${comment.comment_no}" />
                                    <input type="hidden" name="articleNo" value="${articleData.article.number}" />
                                    <input type="hidden" name="category" value="${category}" />
                                    <textarea name="content" placeholder="답글을 입력하세요"></textarea>
                                    <button type="submit">답글 달기</button>
                                </form>
                            </div>
                        </c:forEach>
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
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function processText() {
    var userInput = `<c:out value='${fn:escapeXml(userInput)}' />`;
    var processedText = userInput.replace(/\n/g, '<br>');
    document.getElementById('output').innerHTML = processedText;
}
window.onload = processText;

function confirmDelete(event, articleNumber, category, pageNo) {
    event.preventDefault();
    var isDelete = confirm("정말로 삭제하시겠습니까?");
    if (isDelete) {
        $.ajax({
            type: "POST",
            url: "delete.do",
            data: {
                no: articleNumber,
                category: category,
                pageNo: pageNo
            },
            success: function(response) {
                alert("게시글이 삭제되었습니다.");
                window.location.href = "list.do?category=" + category + "&pageNo=" + pageNo;
            },
            error: function(xhr, status, error) {
                alert("게시글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
            }
        });
    }
}

function confirmDeleteComment(event, commentNo, articleNo, category, pageNo) {
    event.preventDefault();
    var isDelete = confirm("정말로 댓글을 삭제하시겠습니까?");
    if (isDelete) {
        $.ajax({
            type: "POST",
            url: "commentdelete.do",
            data: {
                action: "deleteComment",
                id: commentNo,
                articleNo: articleNo,
                category: category,
                pageNo: pageNo
            },
            success: function(response) {
                alert("댓글이 삭제되었습니다.");
                window.location.href = "read.do?no=" + articleNo + "&category=" + category + "&pageNo=" + pageNo;
            },
            error: function(xhr, status, error) {
                alert("댓글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
            }
        });
    }
}

function confirmDeleteReply(event, replyNo, articleNo, category, pageNo) {
    event.preventDefault();
    var isDelete = confirm("정말로 답글을 삭제하시겠습니까?");
    if (isDelete) {
        $.ajax({
            type: "POST",
            url: "commentdelete.do",
            data: {
                action: "deleteReply",
                id: replyNo,
                articleNo: articleNo,
                category: category,
                pageNo: pageNo
            },
            success: function(response) {
                alert("답글이 삭제되었습니다.");
                window.location.href = "read.do?no=" + articleNo + "&category=" + category + "&pageNo=" + pageNo;
            },
            error: function(xhr, status, error) {
                alert("답글 삭제에 실패했습니다. 다시 시도해주세요. 오류: " + error);
            }
        });
    }
}

function showEditCommentForm(commentNo, content, articleNo, category, pageNo) {
    document.getElementById('editCommentForm_' + commentNo).style.display = 'block';
    document.getElementById('editCommentContent_' + commentNo).value = content;
}

function hideEditCommentForm(commentNo) {
    document.getElementById('editCommentForm_' + commentNo).style.display = 'none';
}

function updateComment(commentNo, articleNo, category, pageNo) {
    var content = document.getElementById('editCommentContent_' + commentNo).value;
    $.ajax({
        type: "POST",
        url: "commentupdate.do",
        data: {
            action: "updateComment",
            id: commentNo,
            content: content,
            articleNo: articleNo,
            category: category,
            pageNo: pageNo
        },
        success: function(response) {
            alert("댓글이 수정되었습니다.");
            window.location.href = "read.do?no=" + articleNo + "&category=" + category + "&pageNo=" + pageNo;
        },
        error: function(xhr, status, error) {
            alert("댓글 수정에 실패했습니다. 다시 시도해주세요. 오류: " + error);
        }
    });
}

function showEditReplyForm(replyNo, content, articleNo, category, pageNo) {
    document.getElementById('editReplyForm_' + replyNo).style.display = 'block';
    document.getElementById('editReplyContent_' + replyNo).value = content;
}

function hideEditReplyForm(replyNo) {
    document.getElementById('editReplyForm_' + replyNo).style.display = 'none';
}

function updateReply(replyNo, articleNo, category, pageNo) {
    var content = document.getElementById('editReplyContent_' + replyNo).value;
    $.ajax({
        type: "POST",
        url: "commentupdate.do",
        data: {
            action: "updateReply",
            id: replyNo,
            content: content,
            articleNo: articleNo,
            category: category,
            pageNo: pageNo
        },
        success: function(response) {
            alert("답글이 수정되었습니다.");
            window.location.href = "read.do?no=" + articleNo + "&category=" + category + "&pageNo=" + pageNo;
        },
        error: function(xhr, status, error) {
            alert("답글 수정에 실패했습니다. 다시 시도해주세요. 오류: " + error);
        }
    });
}

function toggleReplyForm(commentNo) {
    var form = document.getElementById('replyForm_' + commentNo);
    if (form.style.display === 'none' || form.style.display === '') {
        form.style.display = 'block';
    } else {
        form.style.display = 'none';
    }
}
</script>
</div>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
