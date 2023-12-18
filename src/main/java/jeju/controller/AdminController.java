package jeju.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dao.AdminDao;
import jeju.dao.BoardFreeDao;
import jeju.dao.MemberTableDao;
import jeju.dao.ReviewBoardDao;
import jeju.dto.MemberTableDto;

@Controller
public class AdminController {
	@Autowired
	MemberTableDao memberTableDao;
	
	@Autowired
	BoardFreeDao boardFreedao;
	
	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@Autowired
	AdminDao admindao;
	
	@GetMapping("/mypage/admin")
	public String admin(Model model, HttpSession session ) {
		if(session.getAttribute("loginok")== null || session.getAttribute("loginok").equals("yes") ) ////비로그인이나 일반유저는 메인으로 보내버림
			return "redirect:/main";
		
		
		List<MemberTableDto> memberlist10 = memberTableDao.selectAllmem10Bydesc();
		List<Map<String, Object>> freeBoardandNickname = admindao.selectFreeboardAndNickname();
		List<Map<String, Object>> reviewBoardandNickname = admindao.selectReviewboardAndNickname();
		List<Map<String, Object>> inquiryisanswer = admindao.selectInquiryisanswer();
		model.addAttribute("memberlist10", memberlist10);
		model.addAttribute("freeBoardandNickname", freeBoardandNickname);
		model.addAttribute("reviewBoardandNickname", reviewBoardandNickname);
		model.addAttribute("inquiryisanswer", inquiryisanswer);
		return "mypage/adminpage";
	}
	
	@GetMapping("/mypage/member/delete")
	@ResponseBody public void deleteMember(@RequestParam String id)
	{
		admindao.deleteMemberbyID(id);
	}
	
	@GetMapping("/mypage/freeboard/delete")
	@ResponseBody public void deletefreeboard(@RequestParam int freeboardcode)
	{
		admindao.deleteFreebyReviewcode(freeboardcode);
	}
	
	@GetMapping("/mypage/reviewboard/delete")
	@ResponseBody public void deletereviewboard(@RequestParam int reviewcode)
	{
		admindao.deleteReviewbyReviewcode(reviewcode);
	}
	
	
}
