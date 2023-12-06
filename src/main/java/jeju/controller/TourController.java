package jeju.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class TourController {

	@GetMapping("/tour/list")
	public String list() {
		return "tour/tourlist";
	}
	
	//내용페이지
	@GetMapping("/tour/content")
	public String content()
	{
		return "tour/content";
	}
	
	@GetMapping("/tour/photo")
	public String photo()
	{
		return "tour/photo";
	}
	
	@GetMapping("/tour/info")
	public String info()
	{
		return "tour/info";
	}
	
	@GetMapping("/tour/review")
	public String review()
	{
		return "tour/review";
	}
	
}

