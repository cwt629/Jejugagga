package jeju.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.service.HashService;

@Controller
public class MemberController {
	@Autowired
	MemberTableDao dao;

	@GetMapping("/member/login")
	public String login() {
		return "member/loginform";
	}
	
	@GetMapping("/member/signup")
	public String signup() {
		return "member/signuppage";
	}
	
	@GetMapping("/member/login/findpass")
	public String findpass() {
		return "member/findpassform";
	}
	@PostMapping("/member/login/check")
	public String check(@RequestParam String id,@RequestParam String password, HttpSession session) 
	{
		Map<String, Object> map=new HashMap<String, Object>();
		// 비밀번호 해싱 적용
		password = HashService.hashPassword(password);
        
		boolean bLogin=dao.isLoginCheck(id, password);
		if(bLogin)
		{
			//ㅅ세션 유지시간
			session.setMaxInactiveInterval(60*60*6);
			//로그인 성공시 세션에 저장할 내용들
			session.setAttribute("loginok","yes");
			session.setAttribute("id",id);
			
			//아이디에 해당하는 넥니엠(별명) 얻기
			String nickname=dao.getData(id).getNickname();
			session.setAttribute("nickname", nickname);
			//아이디에 해당하는 이름 얻기
			int usercode=dao.getData(id).getUsercode();
			session.setAttribute("usercode", usercode);
			//아이디에 해당하는 사진 얻기
			String myphoto=dao.getData(id).getPhoto();
			session.setAttribute("myphoto", myphoto);
		
			
			map.put("success", true);
		}else {
			map.put("success", false); //로그인 실패시	
		}
		return 	"redirect:../../main";
	}
	
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return 	"redirect:../main";
	}
	
	@PostMapping("/member/signup/submit")
	public String signin(@ModelAttribute MemberTableDto dto)
	{
		 // 비밀번호 해싱 적용
        HashService.hashAndSetPassword(dto, dto.getPassword());

        dao.insertMember(dto);
		
		return "redirect:../../main";
	}
	
}
