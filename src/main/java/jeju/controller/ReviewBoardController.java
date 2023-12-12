package jeju.controller;

import jeju.dto.BoardReviewDto;
import jeju.service.ReviewTitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ReviewBoardController {

	@GetMapping("/community/review/list")
	public String reviewlist() {
		return "community/review/reviewlist";
	}

	@GetMapping("/community/review/write")
	public String reviewwrite() { return "community/review/reviewwrite"; }
}

@Controller
public class TitleController {

	private final ReviewTitleService reviewTitleService;

	@Autowired
	public TitleController(ReviewTitleService reviewTitleService) {
		this.reviewTitleService = reviewTitleService;
	}

	@GetMapping("/titleDropdown")
	public String tourDropdown(Model model) {
		List<BoardReviewDto> titles = reviewTitleService.selectAllTitles();
		model.addAttribute("titles", titles);
		return "${root}/community/review/write"; // JSP 파일 이름
	}
}
