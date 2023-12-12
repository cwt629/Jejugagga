package jeju.controller;

import jeju.common.PagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.service.BoardFreeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FreeBoardController {

	private final BoardFreeService boardFreeService;

	@GetMapping("/community/free/list")
	public String list(Model model,
					   @RequestParam(defaultValue = "1") int currentPage) {

		PagingCriteria criteria = new PagingCriteria();
		List<BoardFreeDto> result = boardFreeService.getList(criteria);
		return "community/free/freelist";
	}

	/*@GetMapping("/tour/list")
	public String list(Model model,
					   @RequestParam(defaultValue = "1") int currentPage) {

		//페이징처리
		//페이징에 처리에 필요한 변수들
		int perPage=8; //한페이지당 보여지는 게시글의 갯수
		int totalCount=0; //총 개시글의 개수
		int totalPage;//총페이지수
		int startNum;//각페이지당 보여지는 글의 시작번호
		int perBlock=5; //한블럭당 보여지는 페이지의 개수
		int startPage; //각블럭당 보여지는 페이지의 시작번호
		int endPage;
		//총 글갯수
		totalCount=tourDao.getTotalCount();
		//총페이지수,나머지가 있으면 무조건올림
		//총게시글이 37-한페이지 3-12.3333....13페이지
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		//각블럭의 시작페이지와 끝페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//endPage는 totalPage를 넘지않도록 한다
		if(endPage>totalPage)
			endPage=totalPage;
		//각페이지당 불러올 글의 번호
		//10개씩일 경우 기준
		//1페이지:0~9 2페이지:10~19
		startNum=(currentPage-1)*perPage;
		//각 페이지의 시작 번호
		int no=totalCount-(currentPage-1)*perPage;

		//request에 담을 값
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("no",no);

		return "tour/tourlist";
	};*/
	
}
