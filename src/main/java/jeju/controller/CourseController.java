package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {

	@GetMapping("/course/list")
	public String list() {
		return "course/courselist";
	}
	
}
