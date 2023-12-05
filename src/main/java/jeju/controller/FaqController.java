package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {

	@GetMapping("/community/faq/list")
	public String faq() {
		return "community/faq/faqpage";
	}
	
}
