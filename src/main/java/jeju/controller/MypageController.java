package jeju.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jeju.dao.UserPageDao;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.dto.BoardReviewDto;
import jeju.dto.MemberTableDto;
import jeju.service.HashService;
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
		List<Map<String, String>> inquiryBoardlist = userPageDao.selectOfInquiryAnswerResultByUsercode(usercode);
		
		//request 에 담을 값들
		model.addAttribute("freeBoardlist", freeBoardlist);
		model.addAttribute("reviewBoardlist", reviewBoardlist);
		model.addAttribute("inquiryBoardlist", inquiryBoardlist);
		
		return "mypage/active_history";
	}
	
	
	
	@GetMapping("/mypage/mycourse")
	public String myTripCourse(Model model, HttpSession session) {
		
		// 현재 로그인한 유저코드 얻기
		int usercode = (int)session.getAttribute("usercode");
		System.out.println(usercode);
		
		
		List<Map<String, String>> tourLikesList = userPageDao.selectOfTourLikesByNum(usercode);
		List<Map<String, String>> courseLikesList = userPageDao.selectOfCourseLikesByNum(usercode);
		
		model.addAttribute("tourLikesList", tourLikesList);
		model.addAttribute("courseLikesList", courseLikesList);
		
		return "mypage/mytrip_course";
	}
	
	@PostMapping("/member/changeinfo")
	public String changeinfo(Model model, HttpSession session) {
		int usercode = (int)session.getAttribute("usercode");
		
		MemberTableDto memberList = userPageDao.getData(usercode);
		
		model.addAttribute("memberList", memberList);
		
		return "member/changeinfoform";
	}
	
	@PostMapping("/member/changeinfo/change")
	public String changeinfo(@ModelAttribute MemberTableDto dto, @RequestParam String nickname,
			@RequestParam String email, @RequestParam int usercode, HttpSession session) {
		dto.setNickname(nickname);
		dto.setEmail(email);
		dto.setUsercode(usercode);
		
		userPageDao.userInfoUpdate(dto);
		
		session.setAttribute("nickname", nickname);
		session.setAttribute("myemail", email);
		
		return "redirect:/mypage/user";
	}
}
