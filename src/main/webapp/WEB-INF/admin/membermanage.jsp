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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body * {
  font-family: 'Orbit';
}

.container {
  display: flex;
  gap: 35px;
  padding: 5px 70px;
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

/* 가입일과 작성일, 등록일은 다 나오게 너비 조정 */
th.admin_board_head:nth-child(1),
td:nth-child(1) {
  min-width: 99px;
}

th.admin_board_head:nth-child(2),
td:nth-child(2) {
  min-width: 99px;
}

th.admin_board_head:nth-child(3),
td:nth-child(3) {
  min-width: 99px;
}

th.admin_board_head:nth-child(4),
td:nth-child(4) {
  min-width: 99px;
}

th.admin_board_head:nth-child(6),
td:nth-child(6) {
  width: 105px;
}

th.admin_board_head:nth-child(7),
td:nth-child(7) {
  width: 80px;
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
.memberphoto{
  width: 200px;
  height: 200px;
}





@media (max-width: 995px) {
  .container {
    grid-template-columns: 1fr; /* 화면이 좁아지면 열이 하나로 나오도록 변경 */
  }

</style>
</head>
<script type="text/javascript">
$(function(){
	$(".searchmember").click(function(){
		let id = $(this).val();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./member/information",
				data:{"id":id},
				success:function(res){
	        		
					let s="";
					s+=
					`
			        	<div class="membername">이름 :</div>
			        	<div class="memberid">아이디 :</div>
			        	<div class="membernickname">닉네임 :</div>
			        	<div class="memberphone">연락처 : </div>
			        	<div class="memberemail">이메일 :</div>
			        	<div class="memberbirth">생년월일 :</div>
			        	<div class="memberregistereddate">등록일</div>
			        	<div>프로필 사진 <img src="../res/photo/noimage.png" class="memberphoto"> </div>
					`;
					$(".changemodalbodyform").html(s);
					
					$(".membername").html("이름 : "+res.name);
					$(".memberid").html("아이디 : "+res.id);
	        		$(".membernickname").html("닉네임 : "+res.nickname);
	        		$(".memberphone").html("연락처 : "+res.phone);
	        		$(".memberemail").html("이메일 : "+res.email);
	        		$(".memberbirth").html("생년월일 : "+res.birth);
	        		$(".memberregistereddate").html("등록일 : "+res.registereddate);
	        		$(".memberinfotitle").html(res.id+"님의 회원 정보");
	        		$(".memberinfotitle").val(res.usercode);
	        		$(".memberinformation").val(res.id);
	        		$(".memberphoto").attr('src',res.photo==null? '../res/photo/noimage.png' : "https://kr.object.ncloudstorage.com/jejugagga-cwt/profile_photo/"+res.photo);
					
				}
			});	
	});	
	
	$(".memberinformation").click(function(){
		let id = $(this).val();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./member/information",
				data:{"id":id},
				success:function(res){
	        		
	        		let s="";
					s+=
					`
			        	<div class="membername">이름 :</div>
			        	<div class="memberid">아이디 :</div>
			        	<div class="membernickname">닉네임 :</div>
			        	<div class="memberphone">연락처 : </div>
			        	<div class="memberemail">이메일 :</div>
			        	<div class="memberbirth">생년월일 :</div>
			        	<div class="memberregistereddate">등록일</div>
			        	<div>프로필 사진 <img src="../res/photo/noimage.png" class="memberphoto"> </div>
					`;
					$(".changemodalbodyform").html(s);
					
					$(".membername").html("이름 : "+res.name);
					$(".memberid").html("아이디 : "+res.id);
	        		$(".membernickname").html("닉네임 : "+res.nickname);
	        		$(".memberphone").html("연락처 : "+res.phone);
	        		$(".memberemail").html("이메일 : "+res.email);
	        		$(".memberbirth").html("생년월일 : "+res.birth);
	        		$(".memberregistereddate").html("등록일 : "+res.registereddate);
	        		$(".memberinfotitle").html(res.id+"님의 회원 정보");
	        		$(".memberinfotitle").val(res.usercode);
	        		$(".memberinformation").val(res.id);
	        		$(".memberphoto").attr('src',res.photo==null? '../res/photo/noimage.png' : "https://kr.object.ncloudstorage.com/jejugagga-cwt/profile_photo/"+res.photo);
					
				}
			});	
	});	
	
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
	
	$(".memberwritefree").click(function(){
		let usercode = $(".memberinfotitle").val();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./member/writefree",
				data:{"usercode":usercode},
				success:function(res){
					let s="";
					s+=
					`
					<table class="admin_board_wrap table table-hover" id="user-admin">
					<thead class="admin_boardList">
						<th class="admin_board_head">제목</th>
						<th class="admin_board_head">내용</th>
						<th class="admin_board_head">작성일</th>
					</thead>
					`;
					
					$.each(res, function(idx, item){
					s += 
						`
						<tr>
						<td>\${item.title }</td>
						<td>\${item.content }</td>
						<td>\${item.registereddate }</td>
						
						`;
					})
				
					
					s+=`
					</tbody>
					</table>
					`;
					$(".changemodalbodyform").html(s);
				}
			});	
	});
	
	$(".memeberwritereview").click(function(){
		let usercode = $(".memberinfotitle").val();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./member/writereview",
				data:{"usercode":usercode},
				success:function(res){
					let s="";
					s+=
					`
					<table class="admin_board_wrap table table-hover" id="user-admin">
					<thead class="admin_boardList">
						<th class="admin_board_head">제목</th>
						<th class="admin_board_head">내용</th>
						<th class="admin_board_head">작성일</th>
					</thead>
					`;
					
					$.each(res, function(idx, item){
					s += 
						`
						<tr>
						<td>\${item.title }</td>
						<td>\${item.content }</td>
						<td>\${item.registereddate }</td>
						
						`;
					})
				
					
					s+=`
					</tbody>
					</table>
					`;
					$(".changemodalbodyform").html(s);
				}
			});	
	});
});

</script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
	<h1 class="container" style="margin-top: 20px;">회원 관리</h1>
	<div class="container">
		<div class="item membertable">
			<div class="table-title">회원 목록
				<input type="text" style="float: right;"><button style="float: right;">검색</button>
			</div> 
			<table class="admin_board_wrap table table-hover" id="user-admin">
				<thead class="admin_boardList">
					<th class="admin_board_head">아이디</th>
					<th class="admin_board_head">이름</th>
					<th class="admin_board_head">닉네임</th>
					<th class="admin_board_head">이메일</th>
					<th class="admin_board_head">가입일</th>
					<th class="admin_board_head"></th>
					<th class="admin_board_head"></th>
				</thead>
				<tbody>
					<c:forEach var="member" items="${memberlist }">
						<tr>
							<td>${member.id }</td>
							<td>${member.name }</td>
							<td>${member.nickname }</td>
							<td>${member.email }</td>
							<td><fmt:formatDate value="${member.registereddate}"
									pattern="yyyy-MM-dd" /></td>
							<td><button class="searchmember triggerbtn" value="${member.id }" 
							data-bs-toggle="modal" data-bs-target="#myModal">상세정보</button></td>
							<td><button class="kickmemberbtn triggerbtn" value="${member.id }">추방</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- The Modal -->
<div class="modal fade" id="myModal" style="margin-top: 150px;">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title memberinfotitle">000 님의 회원정보</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<button class="memberinformation">회원정보</button>
      	<button class="memberwritefree">작성글</button>
      	<button class="memeberwritereview">작성후기</button>
        <div class="changemodalbodyform">
        
      	</div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>