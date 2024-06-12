<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴</title>
<style>
.error_message {
	color: red;
	display: none;
}

.error_message.active {
	display: block;
}

.modal {
	display: none;
	position: absolute;
	text-align:center;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: flex;
	justify-content: center;
    align-items: center;
}

.modal-content {
	background-color: #fefefe;
	border-radius: 10px;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	max-width: 500px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

input[type="text"], input[type="password"] {
    width: calc(60% - 20px);
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {
    width: calc(60% - 20px);
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #5cd5fb;
    color: white;
    font-size: 16px;
    cursor: pointer;
}
</style>
</head>
<body>
<div id="cancelIDModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
    <form action="cancelID.do" method="post" id="cancelIDForm">
    	가입된 회원정보가 모두 삭제됩니다.<br/>
    	작성하신 게시물은 삭제되지 않습니다.<br/>
    	회원 탈퇴를 진행하시겠습니까?<br/><br/>
        <input type="submit" value="탈퇴하기">
    </form>
    </div>
    </div>
    
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			var showCancelIDModal = 'true';
			if (showCancelIDModal === 'true'){
				document.getElementById('cancelIDModal').style.display = 'block';
			}
			
			var span = document.getElementsByClassName("close")[0];
			
			span.onclick = function(){
				document.getElementById('cancelIDModal').style.display = 'none';
			}
			
			window.onclick = function(event){
				if (event.target == document.getElementById('cancelIDModal')){
					document.getElementById('cancelIDModal').style.display = 'none';
				}
			}
		});
	</script>
</body>
</html>