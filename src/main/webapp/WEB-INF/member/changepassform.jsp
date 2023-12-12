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
   }
   	.signupdiv {
		width: 450px;
		height: 350px;
		padding: 40px;
		position: absolute;
	    margin: 0 auto;
	    left: 0;
	    right: 0px;
	    TOP: 13%;
	}
	
	.signupdiv > .signup_logo_photo{
		width: 200px;
		height: 200px;
		margin-left: 55px;
	}
	
	#signupForm {
		margin-left: 0px;
		width: 600px;
	}
	
	#signupForm > input {
		width: 300px;
		height: 48px;
		padding: 0 10px;
		margin-bottom: 16px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}
	
	#signupForm > button {
		width: 80px;
		height: 40px;
		border-radius: 6px;
		background-color: #EEB182;
		color: #fff;
		font-size: 16px;
		margin-bottom: 16px;
		
	}
	
	#signupForm > input[type="submit"] {
		color: #fff;
		font-size: 16px;
		background-color: #EEB182;
		margin-top: 20px;
	}
	
	#signupForm > input[type="checkbox"] {
		display: none;
	}
	
	
	#signupForm input[type="checkbox"]+label {
		cursor: pointer;
		padding-left: 26px;
		background-image: url("checkbox.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
	
	#signupForm input[type="checkbox"]:checked+label {
		background-image: url("checkbox-active.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
</style>
<script>
    $(document).ready(function() {
        $("#signupForm").submit(function() {
            return validatePassword();
        });

        $("#password, #confirmPass").on("keyup", function() {
            validatePassword();
        });

        function validatePassword() {
            var password = $("#password").val();
            var confirmPassword = $("#confirmPass").val();

            // 비밀번호 일치 여부 확인
            if (password !== confirmPassword) {
                $("#passwordMismatch").show();
                return false;
            } else {
                $("#passwordMismatch").hide();
            }

            // 강력한 비밀번호 조건 확인
            // 8자리 이상 : .{8,} 특수문자 : (?=.*?[#?!@$%^&*-]) 대문자(?=.*[A-Z]) 정규식 문법 참고했음
            var passwordRegex = /^(?=.*[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
            if (!passwordRegex.test(password)) {
                $("#passwordStrength").show();
                return false;
            } else {
                $("#passwordStrength").hide();
            }

            return true;
        }
    });
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="signupdiv">
		<img alt="logo" src="${root }/res/photo/jejuhome.png" class="signup_logo_photo">
		<div>
		<b style="font-size: 18px; text-align: center; color: #EEB182;">
		변경할 비밀번호를 입력해주세요
		</b>
			<form id="signupForm" action="${root }/member/changepass/change" method="post" onsubmit="return check()">

			    <br><input type="password" name="password" id="password" required placeholder="변경할 비밀번호 입력">
			    <!-- 비번 조건 -->
			    <div id="passwordStrength" style="color: orange; display: none;">
			        비밀번호는 8자이상, 숫자와 특수문자가 포함되어야합니다.<br>
			    </div>
			    <br> 
			    <input type="password" name="confirmPass" id="confirmPass" required placeholder="비밀번호 확인"><br>
			    <!-- 비번 불일치 알림-->
			    <div id="passwordMismatch" style="color: red; display: none;">
			        비밀번호가 일치하지 않습니다.<br><br>
			    </div>
			    <input type="hidden" value="${id}"name="id">
			    <input type="submit" value="비밀번호 변경"> 
			</form>
		</div>
		<h1>${id }</h1>
	</div>
</body>
</html>
