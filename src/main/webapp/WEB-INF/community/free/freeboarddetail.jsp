<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<style>
	body * {
       font-family: 'Orbit';
   }
   
   div.freedetail_app {
       padding: 30px 200px;
   }
   
   div.freedetail_photo img {
       max-width: 300px;
       max-height: 300px;
   }
   
   div.freedetail_text {
       padding: 20px;
       border: 2px solid #ccc;
   }
   
   div.freedetail_text>div {
       padding: 0 10px;
   }
   
   div.freedetail_buttons {
       margin: 30px;
   }
</style>
<script>

    // 게시글 삭제 확인
    function deleteItem() {
        var deleteItem = confirm("정말 삭제하시겠습니까?");
        if (deleteItem) {
            // jQuery를 사용하여 POST 요청 보내기
                $('.deletesubmitform').submit();
        }
    }
</script>

<body>
<div class="freedetail_app">
	<h1><b>자유게시판</b></h1>
	<br><br>
	<div class="freedetail_text">
	    <h3>${boardFreeDto.title}</h3>
	    <hr>
	    <div class="freedetail_photo">
	    	<c:if test="${boardFreeDto.photo != null}">
	    		<img src="${boardFreeDto.photo}">
	    	</c:if>
	    </div>
	    <div class="freedetail_content">
		    ${boardFreeDto.content}
	    </div>
	</div>
	<div class="freedetail_buttons">
		<button type="button" class="btn btn-secondary"
		onclick="location.href = './list'">목록으로</button>
	    <c:if test="${sessionScope.loginok != null && boardFreeDto.usercode == sessionScope.usercode}">
	    	<!-- 
	        <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px;"
	                onclick="location.href='${root}/community/free/updateBoardFree?freeboardcode=${boardFreeDto.freeboardcode}&usercode=${boardFreeDto.usercode}&usercode_str='+${boardFreeDto.usercode.toString()}">
	            수정
	        </button>
	         -->
	        <form class="deletesubmitform" action="${root}/community/free/delete" method="post" style="display: none">
	            <input type="hidden" value="${freeboardcode}" name="freeboardcode">
	            <button type="submit"></button>
	        </form>
	        <button type="button" class="btn btn-danger" onclick="deleteItem(${boardFreeDto.freeboardcode})">삭제</button>
	    </c:if>
    </div>
</div>
</body>
