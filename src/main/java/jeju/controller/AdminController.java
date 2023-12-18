package jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dao.BoardFreeDao;
import jeju.dao.MemberTableDao;
import jeju.dao.ReviewBoardDao;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardReviewDto;
import jeju.dto.MemberTableDto;

@Controller
public class AdminController {
	@Autowired
	MemberTableDao memberTableDao;
	
	@Autowired
	BoardFreeDao boardFreedao;
	
	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@GetMapping("/mypage/admin")
	public String admin(Model model, HttpSession session ) {
		if(session.getAttribute("loginok")== null || session.getAttribute("loginok").equals("yes") ) 
			return "redirect:/main";
		////비로그인이나 일반유저는 메인으로 보내버림
		
		List<MemberTableDto> memberlist10 = memberTableDao.selectAllmem10Bydesc();
		List<BoardFreeDto> freeboardlist = boardFreedao.selectAllfreeboardlist10Bydesc();
		List<BoardReviewDto> reviewboardlist = reviewBoardDao.selectReview10Bydesc();
		model.addAttribute("memberlist10", memberlist10);
		model.addAttribute("freeboardlist", freeboardlist);
		model.addAttribute("reviewboardlist", reviewboardlist);
		return "mypage/adminpage";
	}
	
	@GetMapping("/mypage/reviewboard/delete")
	@ResponseBody public void deletereviewboard(@RequestParam int reviewcode)
	{
		reviewBoardDao.deleteReviewbyReviewcode(reviewcode);
	}
	
}
