package jeju.controller;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.service.BoardFreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FreeBoardController {

	private final BoardFreeService boardFreeService;

	@GetMapping("/community/free/list")
	public String list(Model model,
					   @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "5") int perPageNum)  {

		BoardFreePagingCriteria criteria = new BoardFreePagingCriteria();
		criteria.setPage(currentPage);
		criteria.setPerPageNum(perPageNum);
		List<BoardFreeDto> result = boardFreeService.getList(criteria);

		// 페이징 정보를 모델에 추가
		int totalCount = boardFreeService.getTotalCount();
		int totalPage = (double) totalCount / criteria.getPerPageNum() > 0 ? (int) Math.ceil((double) totalCount / criteria.getPerPageNum()) : 1;


		model.addAttribute("list", result);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage); // totalPage를 정확하게 계산하여 추가
		model.addAttribute("startPage", criteria.getPageStart()); // 시작페이지 정보를 추가
		model.addAttribute("currentPage", currentPage); // 현재 페이지 정보 추가

		return "community/free/freelist";
	}
}
