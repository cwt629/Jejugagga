package jeju.controller;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.service.HashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MemberController {
	@Autowired
	MemberTableDao dao;
	
	@Autowired
	JavaMailSender mailSender;

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
			//멤버 등급 식별
			String membertype = dao.getData(id).getType();
			// 세션의 저장 기한 설정
			session.setMaxInactiveInterval(60*60*6);
			// 세션에 정보 저장
			session.setAttribute("loginok",(membertype.equals("admin"))?"admin":"yes"); //admin이면 loginok를 admin이라는 이름으로 세션을 줌
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
		String random = UUID.randomUUID().toString().replace("-", "");//"-"를 제거함
		String tempcode = random.substring(0,5);
		//mail 관련
        StringBuilder sb = new StringBuilder();
		String setFrom = "kd0947@naver.com";//발신자 이메일
        String tomail = mail;//수신자 이메일
        String title = "[제주가까] 비밀번호 변경 인증 이메일입니다.";
        sb.append(String.format("안녕하세요 %s님\n", dto.getId()));
        sb.append(String.format("제주가까 비밀번호 찾기(변경) 인증번호는 %s입니다.", tempcode));
        String content = sb.toString();
	
		if(search==1)
		{
			 try {
	                MimeMessage msg = mailSender.createMimeMessage();
	                MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "utf-8");
	                
	                msgHelper.setFrom(setFrom);
	                msgHelper.setTo(tomail);
	                msgHelper.setSubject(title);
	                msgHelper.setText(content);
	                
	                //메일 전송
	                mailSender.send(msg);
	                
	            }catch (Exception e) {
	                // TODO: handle exception
	                System.out.println(e.getMessage());
	            }
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
