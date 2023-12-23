package jeju.controller;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.service.BoardFreeService;
import jeju.service.MemberTableService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FreeBoardController {

    private final BoardFreeService boardFreeService;
    private final NcpObjectStorageService storageService;
    private final MemberTableService memberTableService;

    @GetMapping("/community/free/list")
    public String search(Model model,
                         @RequestParam(name = "searchType", required = false) String searchType,
                         @RequestParam(name = "searchWord", required = false) String searchWord,
                         @RequestParam(defaultValue = "1") int currentPage,
                         @RequestParam(defaultValue = "5") int perPageNum) throws Exception {

        // 검색 로직 처리
        BoardFreePagingCriteria criteria = new BoardFreePagingCriteria();
        criteria.setSearchType(searchType);
        criteria.setSearchWord(searchWord);

        // 검색 결과에 따른 총 게시물 수 구하기
        int totalRowCount = boardFreeService.searchTotalCount(searchType, searchWord); // 검색된 게시물 총 갯수 조회

        // 페이징 처리
        criteria.setPage(currentPage);
        criteria.setPerPageNum(perPageNum);


        List<BoardFreeDto> result = boardFreeService.getList(criteria);

        // 창호나 주변 원찬이한테 한번 슬쩍 물어보기(점심 이후)
//        List<BoardFreeDto> result = boardFreeService.getBoardListWithUserNickname(searchWord);

        // 여기서 usercode를 사용하여 닉네임을 적용시킨다.

        for (BoardFreeDto dto: result) {
            int usercode = dto.getUsercode();
            String nickname = memberTableService.getData(usercode).getNickname();
            dto.setWritersNickname(nickname);
        }

        // 총 페이지 수 계산
        int totalPage = (int) Math.ceil((double) totalRowCount / perPageNum);
        model.addAttribute("totalPage", totalPage);

        // 현재 페이지와 시작 페이지 추가
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", criteria.getPageStart());
        // 검색 결과만을 모델에 추가
        model.addAttribute("list", result);
        model.addAttribute("searchType", searchType);
        model.addAttribute("searchWord", searchWord);
        model.addAttribute("totalRowCount", totalRowCount); // 검색 결과에 따른 총 게시물 수 추가

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
    public String update(@ModelAttribute BoardFreeDto boardFreeDto, Model model,
                         @RequestParam int currentPage,
                         HttpServletRequest request,
                         HttpSession session) {
        // 이미지 업로드 및 URL 획득

        // 이미지 URL을 게시글 정보에 설정

        // 게시글 업데이트 수행
        boardFreeService.updateBoardFree(boardFreeDto);

        return "redirect:/community/free/list?currentPage=" + currentPage;
    }

    @PostMapping("/community/free/delete")
    public String deleteBoard(@ModelAttribute BoardFreeDto boardFreeDto, @RequestParam int freeboardcode) {
        //int num = boardFreeDto.getFreeboardcode();
        boardFreeService.deleteBoardFree(freeboardcode);
        return "redirect:/community/free/list";
    }

//    @GetMapping("/community/free/deletee")
//    public String deleteBoard(@RequestParam int num,@RequestParam int currentPage) {
//        boardService.deleteBoard(num);
//        return "redirect:./list?currentPage="+currentPage;
//    }

    @GetMapping("/community/free/detail")
    public String detail(@RequestParam int usercode, @RequestParam int freeboardcode, Model model) {
        BoardFreeDto boardFreeDto = boardFreeService.detailBoardFreePage(freeboardcode);
        model.addAttribute("boardFreeDto", boardFreeDto);
        model.addAttribute("freeboardcode", freeboardcode);

        boardFreeService.updateViewCount(freeboardcode);
        return "community/free/freeboarddetail";
    }
}