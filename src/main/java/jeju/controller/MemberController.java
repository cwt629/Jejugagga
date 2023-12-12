package jeju.controller;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.service.HashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MemberController {
	@Autowired
	MemberTableDao dao;

	@GetMapping("/member/login")
	public String login(@RequestParam(defaultValue = "1") int num , Model model) {
		model.addAttribute("num",num);
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
	public String check(@RequestParam String id,@RequestParam String password, HttpSession session, @RequestParam boolean saveidvalue) 
	{
		// 패스워드 해싱
		password = HashService.hashPassword(password);

		boolean bLogin=dao.isLoginCheck(id, password);
		if(bLogin)
		{
			// 세션의 저장 기한 설정
			session.setMaxInactiveInterval(60*60*6);
			// 세션에 정보 저장
			session.setAttribute("loginok","yes");
			session.setAttribute("saveid",saveidvalue?"yes":"no");
			session.setAttribute("id",id);

			// 받은 아이디에 대한 닉네임 받아오기
			String nickname=dao.getData(id).getNickname();
			session.setAttribute("nickname", nickname);
			// 받은 아이디에 대한 유저코드 받아오기
			int usercode=dao.getData(id).getUsercode();
			session.setAttribute("usercode", usercode);
			// 받은 아이디에 대한 사진 URL 받아오기
			String myphoto=dao.getData(id).getPhoto();
			session.setAttribute("myphoto", myphoto);
			// 받은 아이디에 대한 이메일 받아오기
			String myemail = dao.getData(id).getEmail();
			session.setAttribute("myemail", myemail);

		}else {
			return 	"redirect:../login?num=2";

		}

		return 	"redirect:/main";
	}


	@GetMapping("/member/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return 	"redirect:/main";
	}

	@PostMapping("/member/signup/submit")
	public String signin(@ModelAttribute MemberTableDto dto)
	{
		// 비밀번호 해싱
		HashService.hashAndSetPassword(dto, dto.getPassword());

		dao.insertMember(dto);

		return "redirect:/main";
	}

	@GetMapping("/member/idcheck")
	@ResponseBody public Map<String, Integer> getIdCount(@RequestParam String id)
	{
		int count=dao.searchIdCount(id);
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("count", count);
		return map;
	}

	@PostMapping("/member/login/findpass/check")
	public String findpass(MemberTableDto dto, Model model, @RequestParam String id,
			@RequestParam String name, @RequestParam Date birth, HttpSession session)
	{
		dto.setId(id);
		dto.setName(name);
		dto.setBirth(birth);
		int search = dao.pwdCheck(dto);
		String mail = dao.selectGetMail(dto);
		if(search==1)
		{
			String random = UUID.randomUUID().toString().replace("-", "");//"-"를 제거함
			String tempcode = random.substring(0,5);
			model.addAttribute("tempcode", tempcode);
			model.addAttribute("id", dto.getId()); //비번 변경에 쓰일 ID 넘겨줌
			model.addAttribute("email", mail); //이메일
			return "member/findpassresult";
		}
		else {
			model.addAttribute("tempcode",null);
			return "member/findpassresult";
		}
	}

	@PostMapping("/member/changepass")
	public String tosstochangeform(Model model, @RequestParam String id) {
		model.addAttribute("id", id);
		return "member/changepassform";
	}

	@PostMapping("/member/changepass/change")
	public String changepass(@ModelAttribute MemberTableDto dto, @RequestParam String id,
			@RequestParam String password) {
		String pass = HashService.hashPassword(password);
		dto.setId(id);
		dto.setPassword(pass);
		dao.pwdUpdate(dto);
		return "redirect:/member/login";
	}



}
