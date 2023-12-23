package jeju.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeju.dao.AdminDao;
import jeju.dao.BoardFreeDao;
import jeju.dao.MemberTableDao;
import jeju.dao.ReviewBoardDao;
import jeju.dao.UserPageDao;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
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
	
	@Autowired
	AdminDao admindao;
	
	@Autowired
	UserPageDao userPageDao;
	
	@GetMapping("/admin/adminpage")
	public String admin(Model model, HttpSession session ) {
		if(session.getAttribute("loginok")== null || session.getAttribute("loginok").equals("yes") ) ////비로그인이나 일반유저는 메인으로 보내버림
			return "redirect:/main";
		
		
		List<MemberTableDto> memberlist10 = memberTableDao.selectAllmem10Bydesc();
		List<Map<String, Object>> freeBoardandNickname = admindao.selectFreeboardAndNickname();
		List<Map<String, Object>> reviewBoardandNickname = admindao.selectReviewboardAndNickname();
		List<Map<String, Object>> inquiryisanswer = admindao.selectInquiryisanswer();
		List<Map<String, Object>> courseAndNickname = admindao.selectcourseAndNickname();
		model.addAttribute("memberlist10", memberlist10);
		model.addAttribute("freeBoardandNickname", freeBoardandNickname);
		model.addAttribute("reviewBoardandNickname", reviewBoardandNickname);
		model.addAttribute("inquiryisanswer", inquiryisanswer);
		model.addAttribute("courseAndNickname", courseAndNickname);
		return "admin/adminpage";
	}
	
	@GetMapping("/admin/member/delete")
	@ResponseBody public void deleteMember(@RequestParam String id)
	{
		admindao.deleteMemberbyID(id);
	}
	
	@GetMapping("/admin/freeboard/delete")
	@ResponseBody public void deletefreeboard(@RequestParam int freeboardcode)
	{
		admindao.deleteFreebyFreeboardcode(freeboardcode);
	}
	
	@GetMapping("/admin/reviewboard/delete")
	@ResponseBody public void deletereviewboard(@RequestParam int reviewcode)
	{
		admindao.deleteReviewbyReviewcode(reviewcode);
	}
	
	@GetMapping("/admin/course/delete")
	@ResponseBody public void deleteCoursebyCoursecode(@RequestParam int coursecode)
	{
		admindao.deleteCoursebyCoursecode(coursecode);
	}
	
	@GetMapping("/admin/membermanage")
	public String membermanage(Model model)
	{
		List<MemberTableDto> memberlist = memberTableDao.selectAllmem10Bydesc();
		model.addAttribute("memberlist", memberlist);
		return "admin/membermanage";
	}
	
	@ResponseBody
	@PostMapping("admin/member/information")
	public MemberTableDto memberinformation(@RequestParam String id)
	{
		MemberTableDto dto = memberTableDao.getData(id);
		return dto;
	}
	
	@ResponseBody
	@PostMapping("admin/member/writefree")
	public List<BoardFreeDto> memberwritefree(@RequestParam int usercode)
	{
		List<BoardFreeDto> memberfreeBoardlist = userPageDao.selectOfFreeBoardByUsercode(usercode);
		return memberfreeBoardlist;
	}
	
	@ResponseBody
	@PostMapping("admin/member/writereview")
	public List<BoardReviewDto> memberwritereview(@RequestParam int usercode)
	{
		List<BoardReviewDto> memberreviewlist = userPageDao.selectOfReviewBoardByUsercode(usercode);
		return memberreviewlist;
	}
	
	@PostMapping("/admin/inquiryanswer")
	public String inquiryanswer(Model model, @RequestParam int questioncode, @RequestParam String title, @RequestParam String content )
	{
		model.addAttribute("questioncode", questioncode);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		return "admin/inquiryboardanswerform";
	}
	
	@PostMapping("/admin/inquiryanswer/insert")
	public String inquiryanswerinsert(Model model, BoardInquiryAnswerDto dto, 
			@RequestParam int questioncode, @RequestParam String title, @RequestParam String content, @RequestParam int usercode)
	{
		dto.setQuestioncode(questioncode);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setUsercode(usercode);
		admindao.inquiryanswerinsert(dto);
		model.addAttribute("questioncode", questioncode);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		return "redirect:../adminpage";
	}
	
	@PostMapping("/admin/inquirydetail")
	public String inquiryanswerdetail(Model model, BoardInquiryAnswerDto dto, 
			@RequestParam int questioncode, @RequestParam String title, @RequestParam String content)
	{
		dto = admindao.getBoardInquiryAnswerbyQuestioncode(questioncode);
		model.addAttribute("dto", dto);
		model.addAttribute("questioncode", questioncode);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		return "admin/inquiryboarddetail";
	}
}
