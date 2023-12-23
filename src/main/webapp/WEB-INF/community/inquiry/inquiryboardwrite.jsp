<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${root}/res/board_inquiry_write/board_inquiry_write.css/">
</head>
<style>
/* Basic Grey */
body * {
       font-family: 'Orbit';
   }
form {
    margin-left:auto;
    margin-right:auto;
    max-width: 500px;
    background: #F7F7F7;
    padding: 25px 15px 25px 10px;
    font: 12px Georgia, "Times New Roman", Times, serif;
    color: #888;
    text-shadow: 1px 1px 1px #FFF;
    border:1px solid #E4E4E4;
}
h1 {
    font-size: 25px;
    padding: 0px 0px 10px 40px;
    display: block;
    border-bottom:1px solid #E4E4E4;
    margin: -10px -15px 30px -10px;;
    color: #888;
}
h1>span {
    display: block;
    font-size: 11px;
}
label {
    display: block;
    margin: 0px;
}
label>span {
    float: left;
    width: 20%;
    text-align: right;
    padding-right: 10px;
    margin-top: 10px;
    color: #888;
}
input[type="text"], input[type="email"], textarea, select {
    border: 1px solid #DADADA;
    color: #888;
    height: 30px;
    margin-bottom: 16px;
    margin-right: 6px;
    margin-top: 2px;
    outline: 0 none;
    padding: 3px 3px 3px 5px;
    width: 70%;
    font-size: 14px;
    line-height:15px;
    box-shadow: inset 0px 1px 4px #ECECEC;
    -moz-box-shadow: inset 0px 1px 4px #ECECEC;
    -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
}
textarea{
    padding: 5px 3px 3px 5px;
}
select {
    background: #FFF url('down-arrow.png') no-repeat right;
    background: #FFF url('down-arrow.png') no-repeat right);
    appearance:none;
    -webkit-appearance:none; 
    -moz-appearance: none;
    text-indent: 0.01px;
    text-overflow: '';
    width: 70%;
    height: 35px;
    line-height: 25px;
}
textarea{
    height:100px;
}
.button {
    background: #E27575;
    border: none;
    padding: 10px 25px 10px 25px;
    color: #FFF;
    box-shadow: 1px 1px 5px #B6B6B6;
    border-radius: 3px;
    text-shadow: 1px 1px 1px #9E3F3F;
    cursor: pointer;
}
.button:hover {
    background: #CF7A7A
}

</style>
<body>





<div class="board_wrap" style="margin-top:20px;">
	<form action="${root}/community/inquiry/insert" method="post" class="multipart/form-data">
    <h1>문의 글 작성
        <span>관리자가 확인하는대로 신속하게 답변드리겠습니다.</span>
    </h1>
    <label>
        <span style="font-size: 14px;">제목 :</span>
        <input id="title" type="text" name="title" placeholder="제목을 입력해주세요" />
    </label>
  
    <label>
        <span style="font-size: 14px;">내용 :</span>
        <textarea id="content" name="content" placeholder="내용을 입력해주세요"></textarea>
    </label> 
     <input type="hidden" name="usercode" value="${sessionScope.usercode}"/>
     <label>
        <span>&nbsp;</span> 
        <input type="submit" class="button" value="등록" /> 
        <input type="button" class="button" value="이전으로" onclick="location.href = './list'"/> 
    </label>    
</form>

    	

</body>
</html>