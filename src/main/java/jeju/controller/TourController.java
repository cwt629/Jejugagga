package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TourController {

	@GetMapping("/tour/list")
	public String list() {
		return "tour/tourlist";
	}
	
}
