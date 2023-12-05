package jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("/mypage/user")
	public String userpage() {
		return "mypage/userpage";
	}
	
	@GetMapping("/mypage/admin")
	public String signup() {
		return "mypage/adminpage";
	}
	
}
