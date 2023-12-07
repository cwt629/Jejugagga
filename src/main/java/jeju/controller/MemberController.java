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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String check(@RequestParam String id,@RequestParam String password, HttpSession session, @RequestParam boolean saveidvalue) 
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
			session.setAttribute("saveid",saveidvalue?"yes":"no");
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
		
		return "redirect:../../main";
	}
	
	@GetMapping("/member/idcheck")
	@ResponseBody public Map<String, Integer> getIdCount(@RequestParam String id)
	{
		int count=dao.searchIdCount(id);
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("count", count);
		return map;
	}
	
}
