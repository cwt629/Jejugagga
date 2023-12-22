package jeju.controller;

import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.service.BoardInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class InquiryBoardController {

	@Autowired
	private BoardInquiryService boardInquiryService;


	@GetMapping("/community/inquiry/list")
	public String list(Model model) {
		List<BoardInquiryDto> inquiryList = boardInquiryService.selectAllInquiries();
		model.addAttribute("inquiryList", inquiryList);
		return "/community/inquiry/inquirylist";
	}

	@GetMapping("/detail/{questioncode}")
	public String inquiryDetail(@PathVariable int questioncode, Model model) {
		BoardInquiryDto inquiry = boardInquiryService.selectInquiryByCode(questioncode);
		List<BoardInquiryAnswerDto> answers = boardInquiryService.selectAnswersForQuestion(questioncode);
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("answers", answers);
		return "inquiry/inquiryDetail";
	}

}
