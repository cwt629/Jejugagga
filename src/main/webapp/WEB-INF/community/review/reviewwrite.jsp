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
    <link rel="stylesheet" href="${root}/res/review/reviewwriteform.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <style>

    </style>
</head>
<body>
<div aria-hidden="true" class="MuiBackdrop-root css-919eu4"
     style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
<div tabindex="0" data-test="sentinelStart"></div>
<div class="MuiDialog-container MuiDialog-scrollPaper css-ekeie0" role="presentation" tabindex="-1"
     style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
    <div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation24 MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiDialog-paperFullWidth css-mbdu2s"
         role="dialog" aria-labelledby="mui-6">
        <header class="css-1286rwr effbbsc4"><h2
                class="MuiTypography-root MuiTypography-h6 MuiDialogTitle-root effbbsc3 css-3bav5k" id="mui-6">후기
            작성</h2>
        </header>
        <div class="MuiDialogContent-root effbbsc5 css-4lpgzu">
            <div>
                <div class="css-1qln2j0 e1sj32154"><span
                        style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;"><span
                        style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;"><img
                        alt="" aria-hidden="true"
                        src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%2772%27%20height=%2772%27/%3e"
                        style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;"></span><img
                        alt="[오뚜기] 오뮤 가뿐한끼 현미밥 150g X 30입"
                        src="${root}/res/photo/reviewboard.png"
                        decoding="async" data-nimg="intrinsic" class="css-antbrd"
                        style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;"
                        srcset="${root}/res/photo/reviewboard.png 1x,${root}/res/photo/reviewboard.png 2x"><noscript></noscript></span>

                    <select class="product-select" name="product" style="width: 200px;">

                    </select>

                </div>
                <div class="css-4ej2a1 e17kplex4"><h2 class="css-g752yr e17kplex3">후기는 이렇게 작성해 보세요</h2>
                    <p class="css-54qg3g e17kplex2">공간의 <span>감동·느낌·맛</span> 등을 설명해주세요
                        <strong>좋았던 점, 아쉬웠던 점</strong>도 솔직하게 얘기해주세요</p>
                    <div class="css-d0alj1 e17kplex1">
                        <div class="css-1bvg9b5 e17kplex0"><span
                                style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;"><span
                                style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;"><img
                                alt="" aria-hidden="true"
                                src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27100%27%20height=%27100%27/%3e"
                                style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;"></span><img
                                alt="${root}/res/photo/course_dummy/dummy_tourphoto3.jpg"
                                src="${root}/res/photo/course_dummy/dummy_tourphoto3.jpg"
                                decoding="async" data-nimg="intrinsic" class="css-0"
                                style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; border-radius: 10px;"
                                srcset="${root}/res/photo/course_dummy/dummy_tourphoto3.jpg 1x, ${root}/res/photo/course_dummy/dummy_tourphoto3.jpg 2x"><noscript></noscript></span>
                            <p>방방곳곳 숨겨진
                                나만의 숨은 명소</p></div>
                        <div class="css-1bvg9b5 e17kplex0"><span
                                style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;"><span
                                style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;"><img
                                alt="" aria-hidden="true"
                                src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27100%27%20height=%27100%27/%3e"
                                style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;"></span><img
                                alt="${root}/res/photo/course_dummy/dummy_tourphoto2.jpg"
                                src="${root}/res/photo/course_dummy/dummy_tourphoto2.jpg"
                                decoding="async" data-nimg="intrinsic" class="css-0"
                                style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; border-radius: 10px;"
                                srcset="${root}/res/photo/course_dummy/dummy_tourphoto2.jpg 1x, ${root}/res/photo/course_dummy/dummy_tourphoto2.jpg 2x"><noscript></noscript></span>
                            <p>사진 안에 담겨진
                                생생한 풍경 사진</p></div>
                        <div class="css-1bvg9b5 e17kplex0"><span
                                style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;"><span
                                style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%; border-radius: 15px;"><img
                                alt="" aria-hidden="true"
                                src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27100%27%20height=%27100%27/%3e"
                                style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;"></span><img
                                alt="${root}/res/photo/course_dummy/dummy_tourphoto1.jpg"
                                src="${root}/res/photo/course_dummy/dummy_tourphoto1.jpg"
                                decoding="async" data-nimg="intrinsic" class="css-0"
                                style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; border-radius: 10px;"
                                srcset="${root}/res/photo/course_dummy/dummy_tourphoto1.jpg 1x,${root}/res/photo/course_dummy/dummy_tourphoto1.jpg 2x"><noscript></noscript></span>
                            <p>분위기를 느낄 수
                                있는 관광명소</p></div>
                    </div>
                </div>
                <form>
                    <div class="css-8gakwa eko23d613">
                        <div class="css-mevgy3 eko23d68"><label required="" class="css-14ai4tl eko23d612">내용<sup
                                class="css-19lkxd2">*</sup></label>
                            <div class="css-8atqhb e1tjt2bn7">
                                <div class="css-12julfn e1tjt2bn5"><textarea id="contents" inputmode="text"
                                                                             aria-label="textarea-message"
                                                                             name="contents"
                                                                             class="css-5etceh e1tjt2bn1"></textarea>
                                    <span class="content-length-counter css-dbwxb9 e1tjt2bn0"></span></div>
                            </div>
                        </div>
                        <div class="css-mevgy3 eko23d68"><label class="css-14ai4tl eko23d612">사진 첨부<br><span
                                class="css-1lxqnpp e13o839w1"><span class="css-0"></span>최대 8장</span></label>
                            <div class="css-mvvywf e13o839w0">
                                <div class="css-1s4qubi e1gl36jm1">
                                    <button type="button" class="css-zkol1g e1gl36jm0">
                                        <svg width="30" height="30" xmlns="http://www.w3.org/2000/svg">
                                            <g fill="none" fill-rule="evenodd">
                                                <path d="M0 0h30v30H0z"></path>
                                                <g transform="translate(4.779 6.111)" stroke="#333"
                                                   stroke-width="1.3">
                                                    <path d="M11.792 0c.399 0 .717.056.955.17.179.084.346.199.503.344l.153.155.631.703c.122.13.234.233.337.31a.95.95 0 0 0 .34.16c.125.031.292.047.503.047l2.906-.003c1.284 0 2.324 1.062 2.324 2.37v11.151c0 1.31-1.04 2.37-2.324 2.37H2.324c-1.283 0-2.324-1.06-2.324-2.37V4.257c0-1.31 1.04-2.37 2.324-2.37h2.983c.245-.009.432-.045.559-.108.11-.055.23-.145.36-.27l.134-.137.631-.703c.2-.22.418-.387.657-.5.19-.09.432-.144.725-.162L8.603 0h3.189z"></path>
                                                    <circle cx="10.142" cy="9.529" r="3.556"></circle>
                                                </g>
                                            </g>
                                        </svg>
                                    </button>
                                    <input type="file" accept="image/png, image/jpg, image/jpeg" multiple=""
                                           class="css-bvqroo"></div>
                            </div>
                        </div>
                        <div class="css-mevgy3 eko23d68"><label class="css-14ai4tl eko23d612"></label>
                            <ul class="css-1hpq3oe eko23d61">
                                <li class="css-189d09j eko23d60">사진은 최대 8장까지, 30MB 이하의 이미지만 업로드가 가능합니다.</li>
                                <li class="css-189d09j eko23d60">장소와 무관하거나 반복되는 동일 단어/문장을 사용하여 후기로 볼 수 없는 글,
                                    고객의 후기 이용을 방해한다고 판단되는 경우, 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하거나 불법적인
                                    내용은 통보없이 삭제 및 이용자격이 박탈될 수 있습니다.
                                </li>
                                <li class="css-189d09j eko23d60">전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해주세요.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="css-3exdeo eko23d66">
                        <button type="button" class="css-cyv420 eko23d65" id="bttn1" style="cursor: pointer">이전</button>
                        <button type="button" disabled="" class="css-6j45ao eko23d62" style="cursor: pointer">등록
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div tabindex="0" data-test="sentinelEnd"></div>
<script>
    document.getElementById('bttn1').addEventListener('click', function () {
        window.location.href = '${root}/community/review/list';
    });
</script>
<script>
    $(document).ready(function () {
        // Select2 플러그인을 초기화하고 ajax 옵션을 설정합니다.
        $('.product-select').select2({
            ajax: {
                url: '경로/제품검색', // 백엔드 검색 API URL을 여기에 입력합니다.
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return {
                        q: params.term // 검색어 'q'에 사용자 입력값 'term'을 전달합니다. 백엔드에서 이 파라미터를 기준으로 검색을 수행해야 합니다.
                    };
                },
                processResults: function (data) {
                    // 백엔드에서 반환된 데이터를 Select2가 처리할 수 있는 형식으로 변환합니다.
                    return {
                        results: data.items // 백엔드 응답의 객체 구조에 따라 여기를 수정해야 할 수 있습니다.
                    };
                },
                cache: true
            },
            minimumInputLength: 1, // 사용자가 최소한 1개 이상의 문자를 입력해야 검색을 시작합니다.
            templateResult: formatRepo, // 검색 결과 항목의 포맷을 정의하는 함수입니다. 필요에 따라 커스텀화할 수 있습니다.
            templateSelection: formatRepoSelection // 선택된 항목의 포맷을 정의하는 함수입니다. 필요에 따라 커스텀화할 수 있습니다.
        });
    });

    function formatRepo(repo) {
        if (repo.loading) {
            return repo.text;
        }

        // 검색 결과 항목을 표시하는 방법을 정의합니다. 필요에 따라 HTML 구조를 수정할 수 있습니다.
        var $container = $("<div class='select2-result-repository clearfix'>" + repo.text + "</div>");

        return $container;
    }

    function formatRepoSelection(repo) {
        // 선택된 항목을 표시하는 방법을 정의합니다. 보통 검색 결과와 동일한 텍스트를 반환합니다.
        return repo.text || repo.id;
    }
</script>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>
