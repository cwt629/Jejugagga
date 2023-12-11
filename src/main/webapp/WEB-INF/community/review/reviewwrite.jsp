<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이미지 업로드 버튼</title>
    <style>
        .image-upload-container {
            text-align: center; /* 이미지와 버튼을 가운데 정렬합니다. */
            margin-left: 250px;
        }

        .image-placeholder {
            display: block;
            width: 200px;
            height: 150px;
            background-color: #f0f0f0;
            line-height: 150px;
            color: #bbb;
            margin-bottom: 10px;
        }

        .image-placeholder img {
            height: auto;
            min-width: 500px;
            max-width: 500px;
            vertical-align: middle;
        }

        .upload-button {
            display: block;
            padding: 10px 20px;
            background-color: #f2f2f2;
            border: none;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            font-size: 16px;
            width: 100px;
            margin-left: 170px;
            margin-top: 300px;
        }

        .upload-button:hover {
            background-color: #75444A;
            opacity: 0.7;
        }

        .image-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start; /* 아이템들을 왼쪽 정렬로 시작합니다. */
        }

        .image-grid-item {
            flex: 0 0 25%; /* flex-grow, flex-shrink, flex-basis 값 설정 */
            margin: 5px; /* 각 아이템 주위에 1%의 마진을 줍니다. */
            height: 150px; /* 높이는 실제 이미지에 맞춰 조정해주세요 */
            display: flex;ß
            align-items: center;
            justify-content: center;
            box-sizing: border-box; /* 패딩과 테두리를 너비에 포함합니다. */
            max-width: 50px; /* 이미지가 그리드 아이템을 넘지 않도록 설정합니다. */
            max-height: 50px; /* 이미지가 그리드 아이템의 높이를 넘지 않도록 설정합니다. */
        }


    </style>
</head>
<body>

<div class="image-upload-container">
    <div class="image-placeholder">
        <img src="${root}/res/photo/noimage.png">
    </div>
    <label class="upload-button">
        사진 첨부하기
        <input type="file" style="display: none;" onchange="uploadImage(this)"/>
    </label>

    <div class="image-grid">
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
        <div class="image-grid-item">
            <img src="${root}/res/photo/imageplus.png" class="gridImage"/>
        </div>
    </div>

</div>

<script>

</script>

</body>
</html>
