package jeju.controller;

import jeju.dao.MemberTableDao;
import jeju.dto.MemberTableDto;
import jeju.service.HashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
		// ��й�ȣ �ؽ� ����
		password = HashService.hashPassword(password);
        
		boolean bLogin=dao.isLoginCheck(id, password);
		if(bLogin)
		{
			//������ �����ð�
			session.setMaxInactiveInterval(60*60*6);
			//�α��� ������ ���ǿ� ������ �����
			session.setAttribute("loginok","yes");
			session.setAttribute("id",id);
			
			//���̵� �ش��ϴ� �شϿ�(����) ���
			String nickname=dao.getData(id).getNickname();
			session.setAttribute("nickname", nickname);
			//���̵� �ش��ϴ� �̸� ���
			int usercode=dao.getData(id).getUsercode();
			session.setAttribute("usercode", usercode);
			//���̵� �ش��ϴ� ���� ���
			String myphoto=dao.getData(id).getPhoto();
			session.setAttribute("myphoto", myphoto);
		
			
			map.put("success", true);
		}else {
			map.put("success", false); //�α��� ���н�	
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
		 // ��й�ȣ �ؽ� ����
        HashService.hashAndSetPassword(dto, dto.getPassword());

        dao.insertMember(dto);
		
		return "redirect/main";
	}
	
}
