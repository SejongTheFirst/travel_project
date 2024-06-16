<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="stylesheet" href="/gza/css/home.css">
<link rel="stylesheet" href="/gza/css/board.css">
</head>
<body>
    <div class="quick">
        <div class="center">
            <h1>게시판 이용 수칙!</h1>
            <br>
            <h2>1. 배려와 예의</h2>
            <h3>(1) 욕설, 비속어의 사용을 금지합니다. (욕설임을 알 수 있는 자음, 기호 등 포함)</h3>
            <h3>(2) 타인에 대한 무분별한 비난이나 인신공격을 하지 않습니다.</h3>
            <h3>(3) 비방 또는 분란을 조장하는 허위사실이나 근거 없는 정보를 유포해서는 안됩니다.</h3>
            <br>
            <h2>2. 타인의 권리를 침해하는 행위 제한</h2>
            <h3>(1) 저작권을 침해하는 게시물을 작성하지 않습니다. (기사 전문전재, 음악 배포 등)</h3>
            <h3>(2) 식별가능한 타인의 초상을 무단으로 게시하여서는 안됩니다. (허용된 경우 제외)</h3>
            <h3>(3) 타인의 재산권을 침해하는 내용이거나 허위의 사실로 영업을 방해할 목적의 게시물을 작성하지 않습니다.</h3>
            <br>
            <h2>3. 다른 이용자의 이용에 방해가 되는 행위 금지</h2>
            <h3>(1) 타인에게 혐오감을 주거나 불쾌하게 할 수 있는 게시물 작성을 금지합니다.</h3>
            <h3>(2) 특수문자의 과도한 사용, 도배성 게시물/댓글 등 다른 이용자에게 불편을 주는 경우 해당 게시물은 삭제될 수 있습니다.</h3>
            <h3>(3) 고의적으로 규칙위반 게시물 작성 후 삭제를 반복하는 경우 작성자는 이용이 제한될 수 있습니다.</h3>
            <br>
            <h2>4. 특정 집단에 대한 차별 및 무조건적 비난 금지</h2>
            <h3>(1) 인종, 성별, 국적, 연령, 지역, 장애 등 구분이 가능한 집단에 대하여 그 구성원에게 굴욕감이나 불이익을 줄 수 있는 게시물을 작성하지 않습니다.</h3>
            <h3>(2) 학벌, 재산, 직업, 생활양식, 취향, 종교, 정치적 견해 등을 이유로 무조건적인 비난을 하지 않습니다.</h3>
            <br>
        </div>

        <div class="main-content">
            <div class="test">
                <h2>
                    후기게시판 <a href="list.do?category=latterboard" class="link">더보기</a>
                </h2>
                <table class="community-table">
                    <tr>
                        <td><span>제목</span><span style="float: right;">작성자&emsp;작성일</span></td>
                    </tr>
                    <c:forEach var="article" items="${latestLatterboardArticles}">
                        <tr>
                            <td><a href="read.do?no=${article.number}&category=latterboard">${article.title}</a>
                                <span style="float: right;">${article.writer.name}&emsp;
                                    ${article.formattedRegDate}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="test">
                <h2>
                    자유게시판 <a href="list.do?category=freeboard" class="link">더보기</a>
                </h2>
                <table class="community-table">
                    <tr>
                        <td><span>제목</span><span style="float: right;">작성자&emsp;작성일</span></td>
                    </tr>
                    <c:forEach var="article" items="${latestFreeboardArticles}">
                        <tr>
                            <td><a href="read.do?no=${article.number}&category=freeboard">${article.title}</a>
                                <span style="float: right;">${article.writer.name}&emsp;
                                    ${article.formattedRegDate}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="test">
                <h2>
                    동행게시판 <a href="list.do?category=togetherboard" class="link">더보기</a>
                </h2>
                <table class="community-table">
                    <tr>
                        <td><span>제목</span><span style="float: right;">작성자&emsp;작성일</span></td>
                    </tr>
                    <c:forEach var="article" items="${latestTogetherboardArticles}">
                        <tr>
                            <td><a href="read.do?no=${article.number}&category=togetherboard">${article.title}</a>
                                <span style="float: right;">${article.writer.name}&emsp;
                                    ${article.formattedRegDate}</span></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="search">
                <form action="search.do" method="get">
                    <select name="searchType">
                        <option value="title">제목</option>
                        <option value="writerName">작성자</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" required>
                    <button type="submit">검색</button>
                </form>
            </div>
        </div>
    </div>
</body>
<%@include file="../includes/footer.jsp"%>
</html>
