// rootPath 쓸수있음
const pages = {
    '회원/가입-수정': `
        <div class="accordion">
    <div class="accordion-item">
    <button id="accordion-button-1" aria-expanded="false">
        <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
    <span class="accordion-title" style="margin-left: 0px;">아이디를 분실했습니다.</span>
<span class="icon" aria-hidden="true"></span>
</button>
<div class="accordion-content">
    <p> ○ 로그인 → 아이디찾기를 통해 확인이 가능합니다. </p>
</div>
</div>
<div class="accordion-item">
    <button id="accordion-button-2" aria-expanded="false">
        <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
            <span class="accordion-title" style="margin-left: 0px;">비밀번호를 분실했습니다</span>
            <span class="icon" aria-hidden="true"></span>
    </button>
    <div class="accordion-content">
        <p>○ 로그인 → 비밀번호 찾기를 통해 확인이 가능합니다.</p>
    </div>
</div>

<div class="accordion-item">
    <button id="accordion-button-3" aria-expanded="false">
        <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
            <span class="accordion-title" style="margin-left: 0px;">회원 탈퇴는 어떻게 하나요?</span>
            <span class="icon" aria-hidden="true"></span>
    </button>
    <div class="accordion-content">
        <p>회원탈퇴 유의사항을 꼭 확인하신 다음에 직접 탈퇴할 수 있습니다.<br>
            ○ 로그인 → MY PAGE → 회원탈퇴를 통해 탈퇴 가능합니다.</p>
    </div>
</div>
<div class="accordion-item">
    <button id="accordion-button-4" aria-expanded="false">
        <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
            <span class="accordion-title" style="margin-left: 0px;">비밀번호 변경은 어떻게 하나요?</span>
            <span class="icon" aria-hidden="true"></span>
    </button>
    <div class="accordion-content">
        <p>회원 로그인 이후 또는 비밀번호 찾기 경로를 통해 변경할 수 있습니다.
            단, 비밀번호를 변경할 경우 자동로그인을 이용 중이라면 로그인이 해제됩니다.</p>
    </div>
</div>
<div class="accordion-item">
    <button id="accordion-button0" aria-expanded="false">
        <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
            <span class="accordion-title" style="margin-left: 0px;">회원정보 수정은 어떻게 하나요?</span>
            <span class="icon" aria-hidden="true"></span>
    </button>
    <div class="accordion-content">
        <p>○ 로그인 → MY PAGE → 프로필 수정을 통해 변경할수 있습니다.</p>
    </div>
</div>
</div>
`, '규정': `
<div class="accordion">
    <div class="accordion-item">
        <button id="accordion-button-6" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">커뮤니티 이용 규정</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 회원가입후 24시간 이후 사용 가능합니다 <br>
                커뮤니티에서의 심한 욕설 비방등의 표현은 제제 사유가 될수있습니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-7" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">아이디 중복 사용이 가능한가요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 하나의 계정은 여러 사람의 사용이 불가능합니다.
                <br>위반시 제 47조 제주가까 헌법에 위반하여 과태료 3000천만원이 부과 됩니다.</p>
        </div>
    </div>

    <div class="accordion-item">
        <button id="accordion-button-8" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">요금 규정이 어떻게 되나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 제주가까의 요금은 오픈기념 무료로 진행되고 있습니다.<br>
                하지만 커플일경우 추가요금 25만원을 지불하셔야 합니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-9" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">저작권 규정</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 저희 업체에서 제공하는 모든 정보와 이미지들은 저작권 허가를 받은 상품들입니다 마음놓고 이용하셔도 무관합니다.</p>
        </div>
    </div>
</div>
`, '여행': `
<div class="accordion">
    <div class="accordion-item">
        <button id="accordion-button0" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">여행 정보는 광고인가요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 지자체와 협업하는 어떠한 행사들도 돈을 받고 하는 광고가 아님을 명시해드립니다</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-11" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">여행 정보 추가 건의는 어디서 하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 여행 정보 검색란에 여행 정보 추가 건의 게시판으로 이동 가능합니다.</p>
        </div>
    </div>

    <div class="accordion-item">
        <button id="accordion-button-12" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">후기 게시판 사진에 대해서</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 여행 후기에 관한 사진의 규격은 작성 홈페이지에 명시되어있습니다. <br>
                사진은 여러장 등록가능하며 저작권에 위배되지 않습니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-13" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">내가 등록한 코스정보는 어디서 확인하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 로그인 > MyPage > 나의 코스사용내역에서 확인가능합니다</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-14" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">목적지에 가고있는 사람의 수 정보는 알수없나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 현재 그러한 기능은 존재하지 않습니다. 빠른 시간내에 기능추가건의 게시판을 만들어 고객님들의 추가 요청사항을 받도록 하겠습니다.</p>
        </div>
    </div>
</div>
`, 'BEST': `
<div class="accordion">
    <div class="accordion-item">
        <button id="accordion-button-15" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">명의 도용</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 하나의 계정은 여러 사람의 사용이 불가능합니다.
                <br>위반시 제 47조 제주가까 헌법에 위반하여 과태료 3000천만원이 부과 됩니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-16" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">요금 규정이 어떻게 되나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 제주가까의 요금은 오픈기념 무료로 진행되고 있습니다.<br>
                하지만 커플일경우 추가요금 25만원을 지불하셔야 합니다.</p>
        </div>
    </div>

    <div class="accordion-item">
        <button id="accordion-button-17" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">여행 정보는 광고인가요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 지자체와 협업하는 어떠한 행사들도 돈을 받고 하는 광고가 명시해드립니다</p>
        </div>
    </div>
</div>
`,
    '전체': `
<div class="accordion">
    <div class="accordion-item">
        <button id="accordion-button-18" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">아이디를 분실했습니다.</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 로그인 → 아이디찾기를 통해 확인이 가능합니다. </p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-19" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">비밀번호를 분실했습니다</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 로그인 → 비밀번호 찾기를 통해 확인이 가능합니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-20" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">회원 탈퇴는 어떻게 하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>회원탈퇴 유의사항을 꼭 확인하신 다음에 직접 탈퇴할 수 있습니다.<br>
                ○ 로그인 → MY PAGE → 회원탈퇴를 통해 탈퇴 가능합니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-21" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">비밀번호 변경은 어떻게 하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>회원 로그인 이후 또는 비밀번호 찾기 경로를 통해 변경할 수 있습니다.
                단, 비밀번호를 변경할 경우 자동로그인을 이용 중이라면 로그인이 해제됩니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-22" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">회원정보 수정은 어떻게 하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 로그인 → MY PAGE → 프로필 수정을 통해 변경할수 있습니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-23" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">커뮤니티 이용 규정</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 회원가입후 24시간 이후 사용 가능합니다 <br>
                커뮤니티에서의 심한 욕설 비방등의 표현은 제제 사유가 될수있습니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-24" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">아이디 중복 사용이 가능한가요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 하나의 계정은 여러 사람의 사용이 불가능합니다.
                <br>위반시 제 47조 제주가까 헌법에 위반하여 과태료 3000천만원이 부과 됩니다.</p>
        </div>
    </div>

    <div class="accordion-item">
        <button id="accordion-button-25" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">요금 규정이 어떻게 되나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 제주가까의 요금은 오픈기념 무료로 진행되고 있습니다.<br>
                하지만 커플일경우 추가요금 25만원을 지불하셔야 합니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-26" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">저작권 규정</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 저희 업체에서 제공하는 모든 정보와 이미지들은 저작권 허가를 받은 상품들입니다 마음놓고 이용하셔도 무관합니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-27" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">여행 정보는 광고인가요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p> ○ 지자체와 협업하는 어떠한 행사들도 돈을 받고 하는 광고가 명시해드립니다</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-28" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">여행 정보 추가 건의는 어디서 하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 여행 정보 검색란에 여행 정보 추가 건의 게시판으로 이동 가능합니다.</p>
        </div>
    </div>

    <div class="accordion-item">
        <button id="accordion-button-29" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">후기 게시판 사진에 대해서</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 여행 후기에 관한 사진의 규격은 작성 홈페이지에 명시되어있습니다. <br>
                사진은 여러장 등록가능하며 저작권에 위배되지 않습니다.</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-30" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">내가 등록한 코스정보는 어디서 확인하나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 로그인 > MyPage > 나의 코스사용내역에서 확인가능합니다</p>
        </div>
    </div>
    <div class="accordion-item">
        <button id="accordion-button-31" aria-expanded="false">
            <img src="${rootPath}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                <span class="accordion-title" style="margin-left: 0px;">목적지에 가고있는 사람의 수 정보는 알수없나요?</span>
                <span class="icon" aria-hidden="true"></span>
        </button>
        <div class="accordion-content">
            <p>○ 현재 그러한 기능은 존재하지 않습니다. 빠른 시간내에 기능추가건의 게시판을 만들어 고객님들의 추가 요청사항을 받도록 하겠습니다.</p>
        </div>
    </div>
</div>
    </div>
`
};

function loadPage() {
    document.querySelector('.tab-content').innerHTML = pages['전체'];

    updateAccordionListeners();

    // 각 탭에 해당하는 버튼 이벤트 리스너 추가.
    document.querySelectorAll('.tab-masonry .btn-active, .tab-masonry .btn-ta').forEach(btn => {
        btn.addEventListener('click', function () {
            const pageContent = pages[btn.innerText.trim()] || pages['전체'];
            document.querySelector('.tab-content').innerHTML = pageContent;

            document.querySelectorAll('.tab-masonry .btn-active, .tab-masonry .btn-ta').forEach(button => {
                button.classList.remove('btn-active');
            });
            btn.classList.add('btn-active');

            updateAccordionListeners();
        });
    });
}

// 아코디언 버튼에 대한 이벤트 리스너를 설정하는 함수입니다.
function updateAccordionListeners() {
    const items = document.querySelectorAll(".tab-content .accordion button");

    items.forEach(item => {
        item.removeEventListener('click', toggleAccordion); // 이전 리스너를 제거합니다.
        item.addEventListener('click', toggleAccordion); // 새 리스너를 추가합니다.
    });
}

// 아코디언 토글 기능을 처리하는 함수
function toggleAccordion() {
    const itemToggle = this.getAttribute('aria-expanded');

    // 모든 아코디언 항목을 닫습니다.
    document.querySelectorAll(".tab-content .accordion button").forEach(item => {
        item.setAttribute('aria-expanded', 'false');
    });

    // 현재 클릭된 항목의 상태에 따라 토글합니다.
    if (itemToggle == 'false') {
        this.setAttribute('aria-expanded', 'true');
    }
}

// 페이지 로드 시 loadPage 함수를 실행합니다.
document.addEventListener('DOMContentLoaded', loadPage);

