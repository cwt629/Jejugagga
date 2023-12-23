<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${root}/res/board_free_write/board_free_write.css/">
<style>
.board_wrap {
	width: 1000px;
	margin: 100px auto;
}

.board_title {
	margin-bottom: 30px;
}

.board_title strong {
	font-size: 3rem;
}

.board_title p {
	margin-top: 5px;
	font-size: 1.4rem;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

/* 버튼 스타일을 기존 a 태그에서 input 타입으로 변경합니다 */
.bt_wrap input[type="submit"], .bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin: 10px 5px; /* 좌우 마진을 줄여서 버튼 간격 조정 */
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 1.4rem;
	text-align: center; /* 텍스트 중앙 정렬 추가 */
	background: #000;
	color: #fff;
}

/* 등록 버튼 스타일 변경 */
.bt_wrap input[type="submit"] {
	background: #A52A2A; /* 검은색에서 갈색으로 변경 */
	color: #fff; /* 텍스트 색상을 흰색으로 유지 */
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title {
	display: block;
}

.board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
}

.board_write .title dl, .board_write .info dl {
	font-size: 0;
}

.board_write .info dl {
	width: 100%; /* 한 줄로 표시 */
}

.board_write .title dt, .board_write .title dd {
	/*width: calc(100% - 100px);*/
	
}

.board_write .info dt, .board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 1.4rem;
}

.board_write .title dt {
	padding: 15px;
	display: inline-block; /* 인라인 블록으로 변경 */
	vertical-align: middle; /* 수직 중앙 정렬 유지 */
}

.board_write .info dt {
	padding: 15px;
	display: flex; /* flexbox를 사용하여 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
}

.board_write .title dt, .board_write .info dt {
	margin-right: 10px; /* 라벨과 입력 필드 사이 간격 조정 */
}

.board_write .title dd {
	width: calc(100% - 120px); /* 입력 필드 너비를 라벨 너비와 패딩을 고려하여 조정 */
}

.board_write .info dd {
	flex: 0; /* 남은 공간을 모두 차지하도록 설정 */
}

/* 입력 필드 스타일 변경 */
.board_write .title input[type="text"] {
	padding: 10px;
	box-sizing: border-box;
	width: 100%; /* 입력 필드 너비를 100%로 설정 */
	margin-bottom: 10px; /* 입력 필드 하단 마진 추가 */
}

.board_write .info input[type="file"] {
	box-sizing: border-box;
	width: 100%; /* 파일 입력 필드 너비를 100%로 설정 */
	margin-bottom: 10px; /* 파일 입력 필드 하단 마진 추가 */
	padding: 10px; /* 파일 입력 필드 내부 패딩 추가 */
	line-height: normal; /* 파일 입력 필드 높이 조정 */
}

.board_write .cont {
	border-bottom: 1px solid #000;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}
</style>
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>1:1 문의 답변</strong>
			<p></p>
		</div>
		<div class="board_write_wrap">

			<div class="board_write">
				<div class="title">
					<dl>
						<dt>질문 제목</dt>
						<dd>${title }</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>질문 내용</dt>
						<dd>${content }</dd>
					</dl>
				</div>
				<form action="${root}/admin/inquiryanswer/insert" method="post">
					<div class="title">
                    <dl>
                        <dt>답변</dt>
                        <dd><input type="text" name="title" placeholder="답변 제목 입력" /></dd>
                    </dl>
					<dd>
					<div class="cont">
						<textarea name="content" placeholder="답변 내용 입력"></textarea>
					</div>
					</dd>
			</div>

			<div class="bt_wrap">
				<input type="submit" value="등록" class="on" /> <a
					href="${root}/admin/adminpage">취소</a>
			</div>
			<input type="hidden" name="usercode" value="${sessionScope.usercode}" />
			<input type="hidden" name="questioncode" value="${questioncode}" />
			</form>
		</div>
	</div>
</body>
</html>