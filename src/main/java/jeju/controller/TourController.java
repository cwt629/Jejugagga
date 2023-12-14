package jeju.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeju.dao.TourDao;
import jeju.dto.TourDto;
import jeju.service.TourService;


@Controller
public class TourController {
	@Autowired
	private TourDao tourDao;
	
	private TourService tourService;
	
	//첫화면
	@GetMapping("/tour/list")
	public String list(Model model, @RequestParam (defaultValue = "1") int currentPage) {
		model.addAttribute("currentPage",currentPage);
		return "tour/tourlist";
	}
	
	//내용페이지
	@GetMapping("/tour/content")
	public String content(Model model, @RequestParam int tourcode)
	{
		TourDto tourDto = new TourDto();
		tourDto = tourDao.getTourData(tourcode);
		
		model.addAttribute("tourDto", tourDto);
		return "tour/content";
	}
	
	
}

