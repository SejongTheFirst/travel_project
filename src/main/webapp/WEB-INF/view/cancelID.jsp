<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<link rel="stylesheet" href="/gza/css/join.css">
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