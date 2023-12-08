package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CourseController {

	@GetMapping("/course/list")
	public String list() {
		return "course/courselist";
	}
	
	@GetMapping("/course/add")
	public String add() {
		return "course/courseadd";
	}
	
	@PostMapping("/course/addcourse")
	public String addCourse() {
		// TODO DB에 저장
		
		return "redirect:./list";
	}
}
