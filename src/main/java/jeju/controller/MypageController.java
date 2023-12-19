package jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jeju.dao.UserPageDao;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.dto.BoardReviewDto;
import jeju.storage.NcpObjectStorageService;

@Controller
public class MypageController {
	
	@Autowired
	UserPageDao userPageDao;
	
	@GetMapping("/mypage/user")
	public String userpage() {
		
		return "mypage/userpage";
	}
	
	@GetMapping("/mypage/history")
	public String activeHistory(Model model, HttpSession session) {
		
		// 현재 로그인한 유저코드 얻기
		int usercode = (int)session.getAttribute("usercode");
		System.out.println(usercode);
		
		
		List<BoardFreeDto> freeBoardlist = userPageDao.selectOfFreeBoardByUsercode(usercode);
		List<BoardReviewDto> reviewBoardlist = userPageDao.selectOfReviewBoardByUsercode(usercode);
		List<BoardInquiryDto> inquiryBoardlist = userPageDao.selectOfInquiryBoardByUsercode(usercode);
		
		//request 에 담을 값들
		model.addAttribute("freeBoardlist", freeBoardlist);
		model.addAttribute("reviewBoardlist", reviewBoardlist);
		model.addAttribute("inquiryBoardlist", inquiryBoardlist);
		
		return "mypage/active_history";
	}
	
	
	
	@GetMapping("/mypage/mycourse")
	public String myTripCourse() {
		return "mypage/mytrip_course";
	}
}
