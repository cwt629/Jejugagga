<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body * {
		font-family: 'Orbit';
		font-size: 14px;
	}
	
	.logindiv {
		width: 400px;
		height: 350px;
		padding: 40px;
		position: absolute;
	    margin: 0 auto;
	    left: 0;
	    right: 0px;
	    TOP: 13%;
		
	}
	
	
	#loginform > input {
		width: 300px;
		height: 48px;
		padding: 0 10px;
		margin-bottom: 16px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}
	
	#loginform > input[type="submit"] {
		color: #fff;
		font-size: 16px;
		background-color: #EEB182;
		margin-top: 20px;
	}
	
	#loginform > input[type="checkbox"] {
		display: none;
	}
	
	#loginform > label {
		color: #999999;
	}
	
	#loginform input[type="checkbox"]+label {
		cursor: pointer;
		padding-left: 26px;
		background-image: url("checkbox.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
	
	#loginform input[type="checkbox"]:checked+label {
		background-image: url("checkbox-active.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="logindiv">
		<img alt="logo" src="${root }/res/photo/jejuhome.png" style="margin-left: 55px">
		<form action="login/check" method="post" id="loginform">
			<c:if test="${sessionScope.saveid=='yes'}">
	                <input type="text" name="id" placeholder="id" class="loginidsave" value="${sessionScope.id }">
			</c:if>	
			<c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
	                <input type="text" name="id" placeholder="id" class="loginidsave" autofocus="autofocus">
			</c:if>	
			
			<input type="password" name="password" placeholder="Password" autofocus="autofocus">
			
			<c:if test="${sessionScope.saveid==null || sessionScope.saveid=='no' }">
				<label for="saveid">
	                <input type="checkbox" id="saveid">아이디 저장하기
	            </label>
			</c:if>	
			<c:if test="${sessionScope.saveid=='yes' }">
				<label for="saveid">
	                <input type="checkbox" id="saveid" checked="checked">아이디 저장하기
	            </label>
			</c:if>	
			
			<input type="hidden" name="saveidvalue" value="false"> <!-- 기본값은 false로 설정 체크박스해제할때는 값을 안주기 떄문 -->
			<input type="submit" value="로그인"> 
			<a href="./login/findpass">비밀번호 찾기</a>
		</form>
	</div>

	<script>
		 $(document).ready(function() {
	         // 페이지 로딩 시 체크박스의 상태에 따라 아이디 저장 여부를 설정
	         var saveIdCheckbox = $('#saveid');
	         var saveIdValueInput = $('[name="saveidvalue"]');
	         saveIdValueInput.val(saveIdCheckbox.prop('checked'));
	         
	         // 체크박스의 상태가 변할 때마다 아이디 저장 여부를 갱신
	         saveIdCheckbox.change(function() {
	             saveIdValueInput.val(this.checked);
	         });
	     });
	</script>
	
</body>


</html>