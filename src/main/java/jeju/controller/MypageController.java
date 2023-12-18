package jeju.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.storage.NcpObjectStorageService;

@Controller
public class MypageController {

	@Autowired
	MemberTableDao memberTableDao;
	
	@GetMapping("/mypage/user")
	public String userpage() {
		
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
