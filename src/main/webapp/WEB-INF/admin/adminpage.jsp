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
  grid-template-columns: repeat(2, 1fr);
  gap: 35px;
  padding: 5px 0px;
  align-items: start; /* 그리드 아이템을 시작 부분에 정렬하여 높이를 유동적으로 유지 */
}


.item {
  border: 1px solid #ddd;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  display: grid;
  grid-template-rows: auto;
  
  
}

table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed; /* 테이블 레이아웃을 고정 */
}

th, td {
  padding: 12px;
  text-align: left;
  overflow: hidden;
  text-overflow: ellipsis; /* 글자가 너무 길 경우 ...으로 표시 */
  white-space: nowrap; /* 긴 문자열을 줄 바꿈하지 않고 표시 */
  vertical-align: middle;
}

/* 버튼 스타일 */
.triggerbtn {
  display: inline-block;
  padding: 5px 10px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  border: 2px solid #CA8462; /* 테두리 스타일 및 색상 */
  color: #CA8462; /* 텍스트 색상 */
  background-color: transparent; /* 배경색 투명 */
  border-radius: 5px; /* 테두리 둥글게 만들기 */
  transition: background-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
}

/* 마우스 호버 시의 스타일 */
.triggerbtn:hover {
  background-color: #CA8462; /* 배경색 변경 */
  color: #fff; /* 텍스트 색상 변경 */
}

.commentcomple{
  text-decoration: none; 
  color: black; 
  font-weight: bolder;
  
}

.commentcomple:hover{
  color: tomato; 
}

/* 가입일과 작성일, 등록일은 다 나오게 너비 조정 */
th.admin_board_head:nth-child(1),
td:nth-child(1) {
  width: 99px;; 
}

th.admin_board_head:nth-child(2),
td:nth-child(2) {
  width: 99px;; 
}

th.admin_board_head:nth-child(4),
td:nth-child(4) {
  width: 120px; 
}

th.admin_board_head:nth-child(5),
td:nth-child(5) {
  width: 85px;; 
}

.membertable, .inquirytable, .freeboardtable, .reviewboardtable {
}

.table-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
  padding-top: 15px;
  padding-left: 30px;
  padding-right: 15px;
  padding-bottom: 15px;
  background-color: rgba(202, 132, 98, 0.3);
}

th.admin_board_head{
  text-decoration: underline;
}






@media (max-width: 995px) {
  .container {
    grid-template-columns: 1fr; /* 화면이 좁아지면 열이 하나로 나오도록 변경 */
  }

</style>
</head>
<script type="text/javascript">
$(function(){
	$(".kickmemberbtn").click(function(){
		let id = $(this).val();
		let checkkick = confirm(id+'님을 추방하시겠습니까??');
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
	$(".kickCourse").click(function(){
		let coursecode = $(this).val();
		let checkkick = confirm('해당 코스를 삭제하시겠습니까?');
		if(checkkick){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"./course/delete",
				data:{"coursecode":coursecode},
				success:function(res){
					location.reload();
				}
			});	
			
		}
		
	});
});

</script>
<script>
function submitform() {
document.getElementById('detail').submit();
}
</script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
	<h1 class="container" style="margin-top: 20px;">관리자 페이지</h1>
	<div class="container">
		<div class="item membertable">
			<div class="table-title">회원 목록
				<a href="./membermanage" style="float: right; font-size: 16px; color: gray; margin-right: 10px; margin-top: 5px;">전체보기</a>
			</div> 
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">아이디</th>
					<th class="admin_board_head">이름</th>
					<th class="admin_board_head">닉네임</th>
					<th class="admin_board_head">가입일</th>
					<th class="admin_board_head"></th>
				</thead>
				<tbody>
					<c:forEach var="member" items="${memberlist10 }">
						<tr>
							<td>${member.id }</td>
							<td>${member.name }</td>
							<td>${member.nickname }</td>
							<td><fmt:formatDate value="${member.registereddate}"
									pattern="yyyy-MM-dd" /></td>
							<td><button class="kickmemberbtn triggerbtn" value="${member.id }">추방</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item inquirytable">
			<div class="table-title">문의 목록
				<a href="${root}/community/inquiry/list" style="float: right; font-size: 16px; color: gray; margin-right: 10px; margin-top: 5px;">전체보기</a>			
			</div>
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">등록일</th>
					<th class="admin_board_head"></th>
				</thead>
				<tbody>
					<c:forEach var="inquiry" items="${inquiryisanswer }">
						<tr>
							<td>${inquiry.nickname }</td>
							<td>${inquiry.title }</td>
							<td>${inquiry.content }</td>
							<td><fmt:formatDate value="${inquiry.registereddate}"
									pattern="yyyy-MM-dd" /></td>
							<c:choose>
								<c:when test="${inquiry.hasAnswer==0 }">
									<td>
									<form action="${root}/admin/inquiryanswer?${inquiry.questioncode }" method="post">
										<input type="hidden" name="title" value="${inquiry.title }">
										<input type="hidden" name="content" value="${inquiry.content }">
										<input type="hidden" name="questioncode" value="${inquiry.questioncode }">
										<button type="submit" class=" triggerbtn">답변</button>
									</form>
								</c:when>
								<c:otherwise>
									<form action="${root}/admin/inquirydetail?${inquiry.questioncode }" method="post" id="detail">
										<input type="hidden" name="title" value="${inquiry.title }">
										<input type="hidden" name="content" value="${inquiry.content }">
										<input type="hidden" name="questioncode" value="${inquiry.questioncode }">
										<button style="display: none;" type="submit" class=" triggerbtn">답변</button>
									</form>
									<td><a href="#" class="commentcomple" onclick="return submitform()">답변완료</a></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item freeboardtable">
			<div class="table-title">자유게시판 목록
				<a href="${root }/community/free/list" style="float: right; font-size: 16px; color: gray; margin-right: 10px; margin-top: 5px;">전체보기</a>			
			</div>
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">작성일</th>
					<th class="admin_board_head"></th>
				</thead>
				<tbody>
					<c:forEach var="freeboard" items="${freeBoardandNickname }">
						<tr>
							<td>${freeboard.nickname }</td>
							<td>${freeboard.title }</td>
							<td>${freeboard.content }</td>
							<td><fmt:formatDate value="${freeboard.registereddate}"
									pattern="yyyy-MM-dd" /></td>
	          				<td><button class="kickfreeboardbtn triggerbtn" value="${freeboard.freeboardcode }">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="item reviewboardtable">
			<div class="table-title">후기게시판 목록
				<a href="${root }/community/review/list" style="float: right; font-size: 16px; color: gray; margin-right: 10px; margin-top: 5px;">전체보기</a>			
			</div>
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">작성일</th>
					<th class="admin_board_head"></th>
					
				</thead>
				<tbody>
					<c:forEach var="reviewboard" items="${reviewBoardandNickname }">
						<tr>
							<td>${reviewboard.nickname }</td>
							<td>${reviewboard.title }</td>
							<td>${reviewboard.content }</td>
							<td><fmt:formatDate value="${reviewboard.registereddate}"
									pattern="yyyy-MM-dd" /></td>
		          			<td><button class="kickReviewbtn triggerbtn" value="${reviewboard.reviewcode }">삭제</button></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item reviewboardtable">
			<div class="table-title">코스 목록
				<a href="${root }/course/list" style="float: right; font-size: 16px; color: gray; margin-right: 10px; margin-top: 5px;">전체보기</a>			
			</div>
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">작성자</th>
					<th class="admin_board_head">제목</th>
					<th class="admin_board_head">내용</th>
					<th class="admin_board_head">작성일</th>
					<th class="admin_board_head"></th>
					
				</thead>
				<tbody>
					<c:forEach var="course" items="${courseAndNickname }">
						<tr>
							<td>${course.nickname }</td>
							<td>${course.name }</td>
							<td>${course.briefcontent }</td>
							<td><fmt:formatDate value="${course.registereddate}"
									pattern="yyyy-MM-dd" /></td>
		          			<td><button class="kickCourse triggerbtn" value="${course.coursecode }">삭제</button></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>