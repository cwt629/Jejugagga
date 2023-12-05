package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FreeBoardController {

	@GetMapping("/community/free/list")
	public String list() {
		return "community/free/freelist";
	}
	
}
