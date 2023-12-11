package jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dto.CourseDto;
import jeju.dto.TourDto;
import jeju.service.CourseRouteService;
import jeju.service.CourseService;
import jeju.service.TourService;

@Controller
public class CourseController {

	@Autowired
	private TourService tourService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseRouteService courseRouteService;
	
	@GetMapping("/course/list")
	public String list() {
		return "course/courselist";
	}
	
	@GetMapping("/course/add")
	public String add() {
		return "course/courseadd";
	}
	
	@GetMapping("/course/searchtour")
	@ResponseBody public List<TourDto> searchTourByQuery(@RequestParam String name, @RequestParam List<String> categories){
		return tourService.getSearchedListByQueries(name, categories);
	}
	
	@PostMapping("/course/addcourse")
	public String addCourse(@ModelAttribute CourseDto dto, 
			@RequestParam(defaultValue = "") String route1,
			@RequestParam(defaultValue = "") String route2,
			@RequestParam(defaultValue = "") String route3,
			@RequestParam(defaultValue = "") String route4,
			@RequestParam(defaultValue = "") String route5
			) {
		// TODO DB에 저장
		System.out.println("다음 줄부터 쭈루룩 코드들");
		System.out.println(route1);
		System.out.println(route2);
		System.out.println(route3);
		System.out.println(route4);
		System.out.println(route5);
		
		return "redirect:./list";
	}
}
