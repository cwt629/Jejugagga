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
</head>

<style>
	body * {
       font-family: 'Orbit';
   }
   
   div.inquirydetail_app {
       padding: 30px 200px;
   }
   
   div.inquirydetail_photo img {
       max-width: 300px;
       max-height: 300px;
   }
   
   div.inquirydetail_text {
       padding: 20px;
       border: 2px solid #ccc;
   }
   
   div.inquirydetail_text>div {
       padding: 0 10px;
   }
   
   div.inquirydetail_buttons {
       margin: 30px;
   }
</style>
<body>

<div class="inquirydetail_app">
	<h1>1대1문의</h1>
	<br><br>
	<div class="inquirydetail_text">
	    <h3>${biDto.title}</h3>
	    <hr>
	    <div class="inquirydetail_content">
		    ${biDto.content}
	    </div>
	</div>
	<div class="inquirydetail_text">
	    <h3>${answer.title }</h3>
	    <hr>
	    <div class="inquirydetail_content">
		    ${answer.content }
	    </div>
	    
	</div>
	<div class="inquirydetail_buttons">
		<button type="button" class="btn btn-secondary"
		onclick="location.href = './list'">이전으로</button>
    </div>
</div>
</body>
</html>