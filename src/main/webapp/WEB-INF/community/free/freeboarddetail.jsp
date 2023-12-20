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

<script>
    // 전역 변수 설정
    var loginStatus = "${sessionScope.loginok != null ? 'true' : 'false'}";
    var boardFreeUserCode = "${boardFreeDto.usercode}";
    var writersNickname = "${sessionScope.loginok != null ? sessionScope.loginok.writersNickname : ''}";
    var userauth = "${sessionScope.loginok != null ? sessionScope.loginok.userauth : ''}";

    // 로그인하지 않은 사용자에 대한 모달창 표시
    function showNotLoggedInModal() {
        $("#agreeModal").show();
    }

    function hideModal() {
        $("#agreeModal").hide();
    }

    // 게시글 상세 페이지 이동
    function goToDetailPage(usercode, freeboardcode) {
        if (loginStatus === 'false') {
            showNotLoggedInModal();
            return;
        }

        if (usercode === boardFreeUserCode || userauth === 'A') {
            window.location.href = "${root}/community/free/detail?usercode=" + usercode + "&freeboardcode=" + freeboardcode;
        } else {
            showNotLoggedInModal();
        }
    }

    // 게시글 삭제 확인
    function deleteConfirm() {
        var confirmDelete = confirm("정말 삭제하시겠습니까?");
        if (confirmDelete) {
            location.href = "${root}/community/free/delete?freeboardcode=${boardFreeDto.freeboardcode}";
        }
    }
</script>

<body>
<h1>상세페이지</h1>
<div>
    <th>${boardFreeDto.title}</th>
    <th>${boardFreeDto.content}</th>
    <th><img src="${boardFreeDto.photo}"></th>
</div>
<c:if test="${empty sessionScope.loginok and empty boardFreeDto}">
    <p>세부페이지를 보려면 로그인이 필요합니다.</p>
    <button type="button" id="okButton2" class="btn btn-primary" onclick="showNotLoggedInModal()">OK</button>
</c:if>

<c:if test="${not empty sessionScope.loginok and not empty boardFreeDto}">
     <input type="hidden" name="loginStatus" id="loginStatus" value="${loginStatus}" />
    <c:if test="${loginStatus == '0'}">
        <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px;" onclick="showNotLoggedInModal()">수정</button>
        <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px;" onclick="showNotLoggedInModal()">삭제</button>
    </c:if>
    <c:if test="${loginStatus == '1'}">
        <a href="${root}/community/free/updateBoardFree?freeboardcode=${boardFreeDto.freeboardcode}">수정</a>
        <button type="button" class="btn btn-danger" onclick="deleteConfirm()">삭제</button>
    </c:if>
</c:if>

<%--<!-- 로그인한 사람이 쓴 글에만 수정,삭제 버튼이 보이도록 한다 -->--%>
<%--<c:if test="${sessionScope.loginok != null && dto.usercode == sessionScope.loginok.usercode}">--%>
<%--    <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px;"--%>
<%--            onclick="location.href='./updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>--%>

<%--    <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px;"--%>
<%--            onclick="location.href='./delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>--%>
<%--</c:if>--%>

<!-- 필수 항목 미동의 모달 창 -->
<div class="modal" id="agreeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">글작성을 하려면 로그인이 필요합니다.</h5>
            </div>
            <div class="modal-footer">
                <button type="button" id="okButton1" class="btn btn-primary" onclick="hideModal()">OK</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
