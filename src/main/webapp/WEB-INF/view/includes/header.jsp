<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G•za</title>
<link rel="icon" type="png" href="/gza/img/rogo.png">
<link rel="stylesheet" href="/gza/css/header.css">
<link rel="stylesheet" href="/gza/css/login.css">
<link rel="stylesheet" href="/gza/css/join.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="/gza/home.do" class="home-link">G•za</a>
        </div>
        <div class="search-container">
            <div class="search-bar">
                <input type="text" placeholder="검색" class="keyword" name="keyword">
            </div>
        </div>
        <div class="register">
            <a href="/gza/product/register.do" class="register-link" id="register">상품등록</a>
        </div>

        <div class="profile-icon" onclick="toggleMenu()">
            <c:choose>
                <c:when test="${authUser.id != null }">
                    <img src="/gza/img/login.png" alt="Profile Icon">
                </c:when>
                <c:otherwise>
                    <img src="/gza/img/profile.PNG" alt="Profile Icon">
                </c:otherwise>
            </c:choose>
        </div>
        <c:choose>
            <c:when test="${authUser.id != null }">
                <div class="toggle-menu">
                    <a href="/gza/modifyMem.do">내 정보 수정</a> <a href="#">내 상품</a> <a
                        href="#">예약 내역</a> <a href="/gza/myboard.do">내가 쓴 게시글</a><a href="/gza/logout.do">로그아웃</a> <a
                        href="/gza/cancelID.do">회원 탈퇴</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="toggle-menu">
                    <a href="javascript:void(0)" id="openJoinModal">회원 가입</a> <a
                        href="javascript:void(0)" id="openLoginModal">로그인</a>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Login Modal -->
        <div id="loginModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="/gza/login.do" method="post" class="form">
                    <input class="input" type="text" name="id" placeholder="아이디" value="${param.id}">
                    <div class="error_message <c:if test="${errors.id}">active</c:if>">
                        <c:if test="${errors.id}">아이디를 입력하세요.</c:if>
                    </div>
                    <input class="input" type="password" name="password" placeholder="비밀번호">
                    <div class="error_message <c:if test="${errors.password}">active</c:if>">
                        <c:if test="${errors.password}">비밀번호를 입력하세요.</c:if>
                    </div>
                    <input class="input" type="submit" value="로그인">
                    <div class="error_message <c:if test="${errors.idOrPwNotMatch}">active</c:if>">
                        <c:if test="${errors.idOrPwNotMatch}">
                            아이디와 암호가 일치하지 않습니다.
                        </c:if>
                    </div>
                </form>
            </div>
        </div>

        <!-- Join Modal -->
        <div id="joinModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="/gza/join.do" method="post" id="joinForm">
                    <div class="form-group">
                        <div class="form-row" id="divId">
                            <input type="text" name="id" placeholder="아이디" value="${joinReq.id}">
                            <div class="error_message <c:if test="${errors.id}">active</c:if>">
                                <c:if test="${errors.id}">아이디가 입력되지 않았습니다.</c:if>
                                <c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
                            </div>
                        </div>
                        <div class="form-row" id="divPassword">
                            <input type="password" placeholder="비밀번호" name="password">
                            <div class="error_message <c:if test="${errors.password}">active</c:if>">
                                <c:if test="${errors.password}">비밀번호가 입력되지 않았습니다.</c:if>
                            </div>
                        </div>
                        <div class="form-row">
                            <input type="password" placeholder="비밀번호 확인" name="confirmPassword">
                            <div class="error_message <c:if test="${errors.confirmPassword}">active</c:if>">
                                <c:if test="${errors.confirmPassword}">비밀번호 확인이 입력되지 않았습니다.</c:if>
                                <c:if test="${errors.notMatch}">비밀번호와 비밀번호 확인이 일치하지 않습니다.</c:if>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-row" id="divMemberName">
                            <input type="text" name="memberName" placeholder="닉네임을 입력하세요" value="${joinReq.memberName}">
                            <div class="error_message <c:if test="${errors.memberName}">active</c:if>">
                                <c:if test="${errors.memberName}">닉네임이 입력되지 않았습니다.</c:if>
                            </div>
                        </div>
                        <div class="form-row" id="divPhoneNum">
                            <input type="text" name="phoneNum" placeholder="휴대폰 번호 11자리를 입력하세요" value="${joinReq.phoneNum}">
                            <div class="error_message <c:if test="${errors.phoneNum}">active</c:if>">
                                <c:if test="${errors.phoneNum}">휴대폰 번호가 입력되지 않았습니다.</c:if>
                            </div>
                        </div>
                        <div class="form-row" id="divBirthday">
                            <input type="text" name="birthday" placeholder="생년월일 8자리를 입력하세요" value="${joinReq.birthday}">
                            <div class="error_message <c:if test="${errors.birthday}">active</c:if>">
                                <c:if test="${errors.birthday}">생년월일이 입력되지 않았습니다.</c:if>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="가입하기">
                </form>
            </div>
        </div>

    </header>
    <div class="categories">
        <a href="/gza/product/list.do">숙박 / 체험 / 활동</a> <a href="/gza/MainBoard.do">커뮤니티</a>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var showLoginModal = false;
            var showJoinModal = false;

            showLoginModal = ${showLoginModal ? 'true' : 'false'};
            showJoinModal = ${showJoinModal ? 'true' : 'false'};

            if (showLoginModal === false) {
                document.getElementById('loginModal').style.display = 'none';
            }

            if (showJoinModal === false) {
                document.getElementById('joinModal').style.display = 'none';
            }

            
            if (showLoginModal === true) {
                document.getElementById('loginModal').style.display = 'block';
            }

            if (showJoinModal === true) {
                document.getElementById('joinModal').style.display = 'block';
            }

            var loginClose = document.getElementsByClassName("close")[0];
            var joinClose = document.getElementsByClassName("close")[1];

            loginClose.onclick = function() {
                document.getElementById('loginModal').style.display = 'none';
            }

            window.onclick = function(event) {
                if (event.target == document.getElementById('loginModal')) {
                    document.getElementById('loginModal').style.display = 'none';
                }
            }

            joinClose.onclick = function() {
                document.getElementById('joinModal').style.display = 'none';
            }

            window.onclick = function(event) {
                if (event.target == document.getElementById('joinModal')) {
                    document.getElementById('joinModal').style.display = 'none';
                }
            }

            document.getElementById('openLoginModal').onclick = function() {
                document.getElementById('loginModal').style.display = 'block';
            };

            document.getElementById('openJoinModal').onclick = function() {
                document.getElementById('joinModal').style.display = 'block';
            };
        });
    </script>
</body>
</html>
