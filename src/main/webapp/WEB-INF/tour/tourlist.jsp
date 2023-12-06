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

	div.box{
		width: 500px;
		height: 160px;
		padding:10px;
		border: 2px solid gray;
		box-shadow: 3px 3px 3px gray;
		margin-bottom: 10px;
	}
</style>	
<script>
	$(function() {
		list();
	});
	
	function list() {
		$.ajax({
			type : "get",
			dataType : "json",
			url:"../view",
			success:function(res){
				let s="";
				$.each(res, function(idx,item) {
					s+=
						`
						<div class="box">
							<a href="../content?tourcode=\${item.tourcode}">
								<h1>\${item.title}</h1>
							</a>
						</div>
						`;
				});
				$(".tourlist").html(s);
			}
		});
		
	}

</script>
</head>
<body>
<h1>
	투어
</h1>

<div class="tourlist">
 리스트
</div>
</body>
</html>