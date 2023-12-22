package jeju.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeju.dao.TourDao;
import jeju.dto.BoardReviewDto;
import jeju.dto.TourDto;
import jeju.service.ReviewBoardService;
import jeju.service.TourService;


@Controller
public class TourController {
	@Autowired
	private TourDao tourDao;
	@Autowired
	private TourService tourService;
	@Autowired
	private ReviewBoardService reviewBoardService;
	
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
		
		List<BoardReviewDto> reviews = reviewBoardService.getReviewListOfTour(tourcode);
		Map<Integer, String> photos = new HashMap<>();
		Map<Integer, String> nicknames = new HashMap<>();

		for (BoardReviewDto review : reviews) {
			photos.put(review.getReviewcode(), reviewBoardService.getLatestPhotoByReviewcode(review.getReviewcode()));
			nicknames.put(review.getUsercode(), reviewBoardService.getNicknameByUsercode(review.getUsercode()));
		}

		model.addAttribute("reviews", reviews);
		model.addAttribute("photos", photos);
		model.addAttribute("nicknames", nicknames);
		
		return "tour/content";
	}
	
	
}

