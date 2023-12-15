package jeju.controller;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.service.BoardFreeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class FreeBoardController {
	@Autowired
	private  BoardFreeService boardFreeService;

	@GetMapping("/community/free/list")
	public String list(Model model,
					   @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "5") int perPageNum)  {

		BoardFreePagingCriteria criteria = new BoardFreePagingCriteria();
		criteria.setPage(currentPage);
		criteria.setPerPageNum(perPageNum);
		List<BoardFreeDto> result = boardFreeService.getList(criteria);

		// 페이징 정보를 모델에 추가
		int totalCount = boardFreeService.getTotalCount();
		int totalPage = (double) totalCount / criteria.getPerPageNum() > 0 ? (int) Math.ceil((double) totalCount / criteria.getPerPageNum()) : 1;


		model.addAttribute("list", result);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage); // totalPage를 정확하게 계산하여 추가
		model.addAttribute("startPage", criteria.getPageStart()); // 시작페이지 정보를 추가
		model.addAttribute("currentPage", currentPage); // 현재 페이지 정보 추가

		return "community/free/freelist";
	}

	@GetMapping("/community/free/write")
	public String write() {
		// 글쓰기 페이지의 뷰 이름을 반환합니다.
		// 'freewrite'는 글쓰기 페이지의 뷰 이름이며 실제 뷰 파일의 경로를 나타냅니다.
		return "community/free/freewrite";
	}

	@PostMapping("/community/free/save")
	public String save(@ModelAttribute BoardFreeDto boardFreeDto ,
					   @RequestParam int currentPage,
					   @RequestParam("photo") MultipartFile file,
					   HttpServletRequest request,
					   HttpSession session
					   ) {
		// 파일 업로드 폴더 경로 설정
		String path = request.getSession().getServletContext().getRealPath("/res/photo/board_free");
		// 파일 이름 설정 (여기서는 UUID 사용)
		String fileName = UUID.randomUUID().toString();

		// 파일 저장 경로 설정
		try {
		file.transferTo(new File(path+"/"+fileName));
		} catch (IOException e) {
			e.printStackTrace(); // 혹은 다른 오류 처리 로직을 추가하세요.
		}
		// 파일 저장
		boardFreeDto.setPhoto(file);

		boardFreeService.insertBoardFree(boardFreeDto);
		return "redirect:/community/free/list";
	}

	@PostMapping("/community/free/update")
	public String update(@ModelAttribute BoardFreeDto boardFreeDto) {
		boardFreeService.updateBoardFree(boardFreeDto);
		return "redirect:/community/free/list";
	}

	@PostMapping("/community/free/delete")
	public String delete(@ModelAttribute BoardFreeDto boardFreeDto) {
		int num= boardFreeDto.getFreeboardcode();
		boardFreeService.deleteBoardFree(num);
		return "redirect:/community/free/list";
	}


}
