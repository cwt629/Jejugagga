package jeju.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jeju.service.CourseLikesService;
import jeju.service.CourseService;
import jeju.service.TourLikesService;
import jeju.service.TourService;

@RestController
public class TourLikesController {
	@Autowired
	private TourService tourService;
	
	@Autowired
	private TourLikesService tourLikesService;
	
	@PostMapping("/tour/like/grant")
	public Map<String, Integer> addLike(@RequestParam int tourcode, @RequestParam int usercode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		System.out.println("================================ here we gonig ");
		
		// 이미 좋아요가 있지 않은 경우에 추가해주도록 하자.
		if (!tourLikesService.isLikedByUser(usercode, tourcode)) {
			tourLikesService.addLike(usercode, tourcode);
		}
		
		// 이후의 좋아요 수를 받아온다
		int currentLikes = tourLikesService.getLikesCount(tourcode);
		
		map.put("totalLikes", currentLikes);
		
		return map;
	}
	
	@PostMapping("/tour/like/remove")
	public Map<String, Integer> removeLike(@RequestParam int tourcode, @RequestParam int usercode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// 좋아요가 있으면 삭제하도록 하자.
		tourLikesService.removeLike(usercode, tourcode);
		
		// 이후의 좋아요 수를 받아온다
		int currentLikes = tourLikesService.getLikesCount(tourcode);
		
		map.put("totalLikes", currentLikes);
		
		return map;
	}
}
