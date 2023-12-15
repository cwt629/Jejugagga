package jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;

@Controller
public class AdminController {
	@Autowired
	MemberTableDao memberTableDao;
	
	@GetMapping("/mypage/admin")
	public String signup(Model model, HttpSession session ) {
		if(session.getAttribute("loginok")== null || session.getAttribute("loginok").equals("yes") ) 
			return "redirect:/main";
		////비로그인이나 일반유저는 메인으로 보내버림
		
		List<MemberTableDto> memberlist = memberTableDao.selectAllmemBydesc();
		model.addAttribute("memberlist", memberlist);
		return "mypage/adminpage";
	}
	
}
