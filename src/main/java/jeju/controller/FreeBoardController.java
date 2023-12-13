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
					   @RequestParam(defaultValue = "1") int currentPage)  {

		BoardFreePagingCriteria criteria = new BoardFreePagingCriteria();
		List<BoardFreeDto> result = boardFreeService.getList(criteria);

		// 페이징 정보를 모델에 추가
		int totalCount = boardFreeService.getTotalCount();
		int totalPage = (int) Math.ceil((double) totalCount / criteria.getPerPageNum());

		model.addAttribute("list", result);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);

		return "community/free/freelist";
	}




}
