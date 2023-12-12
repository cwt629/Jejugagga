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
		tourDto = tourDao.getData(tourcode);
		
		model.addAttribute("tourDto", tourDto);
		return "tour/content";
	}
	
	@GetMapping("/tour/photo")
	public String photo(Model model, @RequestParam int tourcode)
	{
		TourDto tourDto = new TourDto();
		tourDto = tourDao.getData(tourcode);
		
		model.addAttribute("tourDto", tourDto);
		return "tour/photo";
	}
	
	@GetMapping("/tour/info")
	public String info(Model model, @RequestParam int tourcode)
	{
		TourDto tourDto = new TourDto();
		tourDto = tourDao.getData(tourcode);
		
		model.addAttribute("tourDto", tourDto);
		return "tour/info";
	}
	
	@GetMapping("/tour/review")
	public String review(Model model, @RequestParam int tourcode)
	{
		TourDto tourDto = new TourDto();
		tourDto = tourDao.getData(tourcode);
		
		model.addAttribute("tourDto", tourDto);
		return "tour/review";
	}
	
}

