package jeju.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@GetMapping("/mypage/user")
	public String userpage(HttpServletRequest request, Model model) {
		
                String currentUrl = request.getRequestURI();

                model.addAttribute("currentUrl", currentUrl);
		return "mypage/userpage";
	}
	
	@GetMapping("/mypage/history")
	public String activeHistory() {
		return "mypage/active_history";
	}
	
	@GetMapping("/mypage/mycourse")
	public String myTripCourse() {
		return "mypage/mytrip_course";
	}
	
}
