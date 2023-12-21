package jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jeju.dao.TourDao;
import jeju.dto.TourDto;


@Controller
public class MainController {
	
	@Autowired
	private TourDao tourDao;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		List<TourDto> tourDto = tourDao.selectFestivalOfTour();
		
		model.addAttribute("tourDto", tourDto);
		return "layout/main";
	}
	
	@GetMapping("/test")
	public String test() {

		return "layout/test";

	}
	
	@GetMapping("/community/nav")
	public String community() {
		return "community/communitypage";
	}
}
