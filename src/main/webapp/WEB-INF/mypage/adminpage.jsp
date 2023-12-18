<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body * {
	font-family: 'Orbit';
}

.container {
	display: grid;
	grid-template-columns: 1fr 1fr;
	padding: 30px;
	gap: 20px;
	grid-auto-rows: minmax(100px, auto);
}

.color1 {
	width: 100%;
	height: 100%:
}

.item {
	display: flex;
	justify-content: center;
	align-content: center;
	border: 1px solid; #181818;
	border-radius: 10px;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	$(".kickmemberbtn").click(function(){
		let id = $(this).val();
		let checkkick = confirm(id+'님을 정말 추방하실거 ㅋㅋ?');
		if(checkkick){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./member/delete",
				data:{"id":id},
				success:function(res){
					location.reload();
				}
			});	
			
		}
		
	});
	
	$(".kickfreeboardbtn").click(function(){
		let freeboardcode = $(this).val();
		let checkkick = confirm('자유게시판 글을 삭제하시겠습니까??');
		if(checkkick){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./freeboard/delete",
				data:{"freeboardcode":freeboardcode},
				success:function(res){
					location.reload();
				}
			});	
			
		}
		
	});
	
	$(".kickReviewbtn").click(function(){
		let reviewcode = $(this).val();
		let checkkick = confirm('후기게시판 글을 삭제하시겠습니까?');
		if(checkkick){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./reviewboard/delete",
				data:{"reviewcode":reviewcode},
				success:function(res){
					location.reload();
				}
			});	
			
		}
		
	});
});

</script>
<body>
	<div class="container">
		<div class="item color1">
			<table class="admin_board_wrap table-border" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">아이디</th>
					<th class="admin_board_head">이름</th>
					<th class="admin_board_head">닉네임</th>
					<th class="admin_board_head">가입일</th>
				</thead>
				<tbody>
					<c:forEach var="member" items="${memberlist10 }">
						<tr>
							<td>${member.id }</td>
							<td>${member.name }</td>
							<td>${member.nickname }</td>
							<td><fmt:formatDate value="${member.registereddate}"
									pattern="yyyy-MM-dd" /></td>
							<td><button class="kickmemberbtn" value="${member.id }">추방</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item color2">
			<table class="admin_board_wrap table-border" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">유저코드</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">등록일</th>
				</thead>
				<tbody>
					<c:forEach var="inquiry" items="${inquiryisanswer }">
						<tr>
							<td>${inquiry.usercode }</td>
							<td>${inquiry.title }</td>
							<td>${inquiry.content }</td>
							<td><fmt:formatDate value="${inquiry.registereddate}"
									pattern="yyyy-MM-dd" /></td>
							<!-- <td><button class="kickmemberbtn" value="${inquiry.id }">추방</button></td> -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item color4">
			<table class="admin_board_wrap table-border" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">작성일</th>
				</thead>
				<tbody>
					<c:forEach var="freeboard" items="${freeBoardandNickname }">
						<tr>
							<td>${freeboard.nickname }</td>
							<td>${freeboard.title }</td>
							<td>${freeboard.content }</td>
							<td><fmt:formatDate value="${freeboard.registereddate}"
									pattern="yyyy-MM-dd" /></td>
	          				<td><button class="kickfreeboardbtn" value="${freeboard.freeboardcode }">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="item color5">
			<table class="admin_board_wrap table-border" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">작성일</th>
				</thead>
				<tbody>
					<c:forEach var="reviewboard" items="${reviewBoardandNickname }">
						<tr>
							<td>${reviewboard.nickname }</td>
							<td>${reviewboard.title }</td>
							<td>${reviewboard.content }</td>
							<td><fmt:formatDate value="${reviewboard.registereddate}"
									pattern="yyyy-MM-dd" /></td>
		          			<td><button class="kickReviewbtn" value="${reviewboard.reviewcode }">삭제</button></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item color2">여행지 관리</div>
		<div class="item color3">코스 관리</div>

	</div>
</body>
</html>