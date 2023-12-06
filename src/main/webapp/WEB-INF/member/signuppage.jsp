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
<body>
<form id="signupForm" action="/jeju/member/signup/submit" method="post">
    <input type="text" name="name" required>이름<br>
    <input type="datetime" name="birth" required>생년월일 0000-00-00 00:00:00<br>
    <input type="text" name="id" required>아이디<br>
    <input type="password" name="password" id="password" required>비밀번호<br>
    <input type="password" name="confirmPass" id="confirmPass" required>비밀번호 확인<br>
       성별 <select name="gender" id="gender">
    		<option value="남자">남자</option>
    		<option value="여자">여자</option>
  		</select>
  <br>
    <input type="email" name="email" required>이메일<br>
    <input type="text" name="nickname" required>닉네임<br>
    <input type="text" name="phone" required>핸드폰 번호<br>
    <input type="submit" value="회원가입">
</form>
    <!-- 비번 불일치 알림-->
    <div id="passwordMismatch" style="color: red; display: none;">
        비밀번호가 일치하지 않습니다.
    </div>

    <!-- 비번 조건 -->
    <div id="passwordStrength" style="color: orange; display: none;">
        비밀번호는 8자이상, 숫자와 특수문자가 포함되어야해요~
    </div>

</body>
</html>
