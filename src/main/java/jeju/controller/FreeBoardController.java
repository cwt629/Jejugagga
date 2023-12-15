package jeju.controller;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.service.BoardFreeService;
import jeju.storage.NcpObjectStorageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FreeBoardController {

    private final BoardFreeService boardFreeService;
    private final NcpObjectStorageService storageService;

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
                       @RequestParam("uploadFile") MultipartFile file) {
        // 버킷 이름과 폴더 이름을 설정합니다.
        String bucketName = "jejugagga-cwt";
        String bucketFolder = "freeBoard";

        // 네이버 클라우드 스토리지에 이미지를 업로드하고 URL을 받습니다.
        String imageUrl = storageService.reviewUploadFile(bucketName, bucketFolder, file);

        // 이미지 정보를 데이터베이스에 저장합니다.
        boardFreeDto.setPhoto(imageUrl);
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
