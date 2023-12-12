package jeju.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dto.CourseDto;
import jeju.dto.CourseRouteDto;
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
	public String list(Model model) {
		List<CourseDto> courses = courseService.selectAllCourses();
		
		
		
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
		// course 정보 먼저 저장
		courseService.insertCourse(dto);
		
		// course_route 테이블 저장을 위한 배열
		List<String> route = new ArrayList<String>();
		route.add(route1);
		route.add(route2);
		route.add(route3);
		route.add(route4);
		route.add(route5);
		
		// 루트 저장
		for (int i = 0; i < route.size(); i++) {
			// 빈 문자가 온다면 그때부터 break
			if (route.get(i).equals(""))
				break;
			
			// course_route에 대한 dto
			CourseRouteDto routeDto = new CourseRouteDto();
			routeDto.setCoursecode(dto.getCoursecode()); // 앞서 저장된 코스의 코드 대입
			routeDto.setTourcode(Integer.parseInt(route.get(i))); // 코드를 int 타입으로 넣어주기
			routeDto.setRouteorder(i); // 그 코스에서의 인덱스로 삽입
			
			// course_route에도 insert해주기
			courseRouteService.insertCourseRoute(routeDto);
		}
		
		return "redirect:./list";
	}
}
