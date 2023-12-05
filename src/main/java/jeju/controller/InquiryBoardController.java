package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InquiryBoardController {

	@GetMapping("/community/inquiry/list")
	public String list() {
		return "community/inquiry/inquirylist";
	}
	
}
