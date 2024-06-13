<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/gza/css/join.css">
</head>
<body>
<div id="modifyModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
<form action="modifyMem.do" method="post" id="modifyMemForm">
    <div class="form-group">
		<div class="form-row" id="divId">
        	<input type="text" name="id" placeholder="아이디" value="${member.id}" readonly>
    	</div>
    	<div class="form-row" id="divPassword">
        	<input type="password" placeholder="기존 비밀번호 입력" name="curPwd">
        	<div class="error_message <c:if test="${errors.curPwd}">active</c:if><c:if test="${errors.badCurPwd}">active</c:if>">
        		<c:if test="${errors.curPwd}">현재 비밀번호를 입력하세요.</c:if>
        		<c:if test="${errors.badCurPwd}">현재 비밀번호가 일치하지 않습니다.</c:if>
        	</div>
        </div>
    	<div class="form-row">
        	<input type="password" placeholder="새 비밀번호 입력" name="newPwd">
        	<div class="error_message <c:if test="${errors.newPwd}">active</c:if>">
        		<c:if test="${errors.newPwd}">새 비밀번호를 입력하세요.</c:if>
        	</div>
        </div>
    </div>
    
    <div class="form-group">
		<div class="form-row" id="divMemberName">
        	<input type="text" name="newMemberName" placeholder="닉네임을 입력하세요" value="${member.memberName}">
        <div class="error_message <c:if test="${errors.memberName}">active</c:if>">
			<c:if test="${errors.memberName}">닉네임이 입력되지 않았습니다.</c:if>
		</div>
	</div>

		<div class="form-row" id="divPhoneNum">
        	<input type="text" name="newPhoneNum" placeholder="휴대폰 번호 11자리를 입력하세요" value="${member.phoneNum}">
        	<div class="error_message <c:if test="${errors.phoneNum}">active</c:if>">
				<c:if test="${errors.phoneNum}">휴대폰 번호가 입력되지 않았습니다.</c:if>
			</div>
		</div>

		<div class="form-row" id="divBirthday">
        	<input type="text" name="newBirthday" placeholder="생년월일 8자리를 입력하세요" value="${member.birthday}">
        	<div class="error_message <c:if test="${errors.birthday}">active</c:if>">
				<c:if test="${errors.birthday}">생년월일이 입력되지 않았습니다.</c:if>
			</div>
		</div>
	</div>
    <input type="submit" value="확인">
</form>
</div>
</div>

<script>
		document.addEventListener("DOMContentLoaded", function(){
			var showModifyModal = '<c:out value="${showModifyModal}"/>';
			if (showModifyModal === 'true'){
				document.getElementById('modifyModal').style.display = 'block';
			}
			
			var span = document.getElementsByClassName("close")[0];
			
			span.onclick = function(){
				document.getElementById('modifyModal').style.display = 'none';
			}
			
			window.onclick = function(event){
				if (event.target == document.getElementById('modifyModal')){
					document.getElementById('modifyModal').style.display = 'none';
				}
			}
		});
	</script>

</body>
</html>