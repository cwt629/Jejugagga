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
	
	.checkdiv {
		width: 400px;
		height: 350px;
		padding: 40px;
		position: absolute;
	    margin: 0 auto;
	    left: 0;
	    right: 0px;
	    TOP: 13%;
		
	}
	
	.checkdiv > .login_logo_photo{
		width: 200px;
		height: 200px;
	}
	
	.findtext{
		text-align: left;
		color: 	#EEB182;	
	}
		
	.backbutton {
		width: 80px;
		height: 40px;
		border-radius: 6px;
		background-color: #EEB182;
		color: #fff;
		font-size: 18px;
		margin-top: 16px;
		
	}
	.findtext > button{
		width: 130px;
		height: 50px;
		border-radius: 6px;
		background-color: #EEB182;
		color: #fff;
		font-size: 18px;
		margin-top: 16px;
	}
	
	.pluscomment{
		color: red;
		font-size: 18px;
	}
</style>
</head>
<script> //타이머 스크립트
	let timeover=false;
	var time = 60*3; //기준시간 작성
	var min = ""; //분
	var sec = ""; //초

	//setInterval(함수, 시간) : 주기적인 실행
	var x = setInterval(function() {
		//parseInt() : 정수를 반환
		min = parseInt(time/60); //몫을 계산
		sec = time%60; //나머지를 계산

		document.getElementById("timer").innerHTML = min + "분" + sec + "초";
		time--;

		//타임아웃 시
		if (time < 0) {
			timeover = true;
			clearInterval(x); //setInterval() 실행을 끝냄
			document.getElementById("timer").innerHTML = "시간초과";
			$(".tempcode").val("");
			$(".submittempcode").val("");
			
			$(".submittempcode").css("display","none");
		}
	}, 1000);
	
	function check(){
		if(timeover){
			alert("시간이 초과됐습니다!!!!!!!!!!!!!!!!!!!!!");
			return false;
			
			
		}		
	}
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="checkdiv">
		<img alt="logo" src="${root }/res/photo/jejuhome.png" style="margin-left: 55px" class="login_logo_photo">
		<c:if test="${tempcode==null}">
			<div class="findtext" style="text-align: center;"><b>회원정보가 일치하지 않습니다.</b><br>
			<button onclick="location.href='./'" class="backbutton">다시 입력</button>
			</div>
		</c:if>
		<c:if test="${tempcode!=null}">
			<div class="findtext" style="text-align: center;">
				<div>인증 코드가 <br><b>${email} </b> <br>주소로 발급되었습니다</div><br>
				<div class="pluscomment">* 제한 시간 내에 <br>인증코드를 입력해주세요</div>
				<div id="timer"></div>
				<input class="tempcode" type="hidden" value="${tempcode}">
				<input class="submittempcode" type="text">
				<button class="tempcodecheck">확인</button>
				<button onclick=location.reload(); class="loginbutton">코드 재전송</button> <!-- 새로고침 -->
				<form action="${root }/member/changepass" class="changepassform" onsubmit="return check()" method="post">
					<input type="hidden" name="id" value="${id }">
				</form>
				
			</div>
		</c:if>
	</div>
<script type="text/javascript">
//확인 누를 경우 두 값을 비교하고 일치하면 폼서브밋
$(function(){
	$(".tempcodecheck").click(function(){
		let tempcode=$(".tempcode").val();
		let submittempcode=$(".submittempcode").val();
		if(tempcode==submittempcode) //숨겨져있는 인풋에 있는 세션코드랑 지금 치는 게 일치할 경우 
			$('.changepassform').trigger('submit');
		else
			alert("코드가 일치하지 않습니다");
	});
});
</script>
	
</body>
</html>