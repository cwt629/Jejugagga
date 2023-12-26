package jeju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeju.dao.AdminDao;
import jeju.dao.inquiryBoardDao;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.service.BoardInquiryService;

@Controller
public class InquiryBoardController {

	@Autowired
	private BoardInquiryService boardInquiryService;
	
	@Autowired
	private inquiryBoardDao biDao;
	
	@Autowired
	AdminDao admindao;


	@GetMapping("/community/inquiry/list")
	public String list(Model model) {
		List<Map<String, Object>> inquiryList = boardInquiryService.selectInquiryisanswer();
		model.addAttribute("inquiryList", inquiryList);
		return "community/inquiry/inquiryboardlist";
	}


	@PostMapping("/community/inquiry/write")
	public String write() {
		// 글쓰기 페이지의 뷰 이름을 반환합니다.
		// 'freewrite'는 글쓰기 페이지의 뷰 이름이며 실제 뷰 파일의 경로를 나타냅니다.
		return "community/inquiry/inquiryboardwrite";
	}
	
	@GetMapping("/community/inquiry/detail")
	public String inquiryboarddetail(Model model, @RequestParam int questioncode) {
		BoardInquiryDto biDto = boardInquiryService.selectInquiryByCode(questioncode);
		BoardInquiryAnswerDto inquiryanswer = boardInquiryService.selectAnswersForQuestion(questioncode);
		
		model.addAttribute("biDto", biDto);
		model.addAttribute("answer", inquiryanswer);
		return "community/inquiry/inquiryboarddetail";
	}
	
	@PostMapping("/community/inquiry/insert")
	public String inquiryBoardWrite(@RequestParam HashMap<String, Object> reqMap) {
		//System.out.println(" ====================== " + reqMap);
		
		BoardInquiryDto biDto = new BoardInquiryDto();
		
		biDto.setContent(reqMap.get("content").toString());
		biDto.setUsercode(Integer.parseInt(reqMap.get("usercode").toString()));
		biDto.setTitle(reqMap.get("title").toString());
		
		biDao.insertInquiry(biDto);
		
		return "redirect:./list";
	}
	
}
