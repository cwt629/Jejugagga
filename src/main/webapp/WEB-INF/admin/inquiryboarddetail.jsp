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
    <link rel="stylesheet" type="text/css" href="${root}/res/board_free_write/board_free_write.css/">
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>1:1 문의</strong>
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
				<div class="title">
					<dl>
						<dt>답변 제목</dt>
						<dd>${dto.title }</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>답변 내용</dt>
						<dd>${dto.content }</dd>
					</dl>
				</div>
			</div>

			<div class="bt_wrap">
				 <a href="${root}/admin/adminpage">목록</a>
			</div>
			<input type="hidden" name="usercode" value="${sessionScope.usercode}" />
			<input type="hidden" name="questioncode" value="${questioncode}" />
		</div>
	</div>
</body>
</html>