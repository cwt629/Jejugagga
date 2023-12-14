package jeju.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jeju.service.CourseLikesService;
import jeju.service.CourseService;

@RestController
public class CourseLikesController {
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseLikesService courseLikesService;
	
	@PostMapping("/course/like/grant")
	public Map<String, Integer> addLike(@RequestParam int coursecode, @RequestParam int usercode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// 이미 좋아요가 있지 않은 경우에 추가해주도록 하자.
		if (!courseLikesService.isLikedByUser(usercode, coursecode)) {
			courseLikesService.addLike(usercode, coursecode);
		}
		
		// 이후의 좋아요 수를 받아온다
		int currentLikes = courseLikesService.getLikesCount(coursecode);
		
		map.put("totalLikes", currentLikes);
		
		return map;
	}
	
	@PostMapping("/course/like/remove")
	public Map<String, Integer> removeLike(@RequestParam int coursecode, @RequestParam int usercode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// 좋아요가 있으면 삭제하도록 하자.
		courseLikesService.removeLike(usercode, coursecode);
		
		// 이후의 좋아요 수를 받아온다
		int currentLikes = courseLikesService.getLikesCount(coursecode);
		
		map.put("totalLikes", currentLikes);
		
		return map;
	}
}
