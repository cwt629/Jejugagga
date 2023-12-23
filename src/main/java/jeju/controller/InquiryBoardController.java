package jeju.controller;

import jeju.service.BoardInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;

@Controller
public class InquiryBoardController {

	@Autowired
	private BoardInquiryService boardInquiryService;



	@GetMapping("/community/inquiry/list")
	public String list(Model model) {
		List<Map<String, Object>> inquiryList = boardInquiryService.selectInquiryisanswer();
		model.addAttribute("inquiryList", inquiryList);
		return "community/inquiry/inquiryboardlist";
	}


//	@GetMapping("/community/inquiry/list")
//	public String search(Model model,
//						 @RequestParam(name = "searchType", required = false) String searchType,
//						 @RequestParam(name = "searchWord", required = false) String searchWord,
//						 @RequestParam(defaultValue = "1") int currentPage,
//						 @RequestParam(defaultValue = "5") int perPageNum) throws Exception {
//
//		// 검색 로직 처리
//		BoardInquiryPagingCriteria criteria = new BoardInquiryPagingCriteria();
//		criteria.setSearchType(searchType);
//		criteria.setSearchWord(searchWord);
//
//		// 검색 결과에 따른 총 게시물 수 구하기
//		int totalRowCount = boardInquiryService.searchTotalCount(searchType, searchWord); // 검색된 게시물 총 갯수 조회
//
//		// 페이징 처리
//		criteria.setPage(currentPage);
//		criteria.setPerPageNum(perPageNum);
//
//
//		List<BoardInquiryDto> result = boardInquiryService.getList(criteria);
//
//		// 창호나 주변 원찬이한테 한번 슬쩍 물어보기(점심 이후)
////        List<BoardFreeDto> result = boardFreeService.getBoardListWithUserNickname(searchWord);
//
//		// 여기서 usercode를 사용하여 닉네임을 적용시킨다.
//
//		// 총 페이지 수 계산
//		int totalPage = (int) Math.ceil((double) totalRowCount / perPageNum);
//		model.addAttribute("totalPage", totalPage);
//
//		// 현재 페이지와 시작 페이지 추가
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("startPage", criteria.getPageStart());
//		// 검색 결과만을 모델에 추가
//		model.addAttribute("list", result);
//		model.addAttribute("searchType", searchType);
//		model.addAttribute("searchWord", searchWord);
//		model.addAttribute("totalRowCount", totalRowCount); // 검색 결과에 따른 총 게시물 수 추가
//
//		return "community/inquiry/inquirylist";
//	}


	@PostMapping("/community/inquiry/write")
	public String write() {
		// 글쓰기 페이지의 뷰 이름을 반환합니다.
		// 'freewrite'는 글쓰기 페이지의 뷰 이름이며 실제 뷰 파일의 경로를 나타냅니다.
		return "community/inquiry/inquiryboardwrite";
	}

}
