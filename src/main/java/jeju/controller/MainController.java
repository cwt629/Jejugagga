package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	@GetMapping("/main")
	public String main() {

		return "layout/main";
	}
	
	@GetMapping("/community/nav")
	public String community() {
		return "community/communitypage";
	}
}
