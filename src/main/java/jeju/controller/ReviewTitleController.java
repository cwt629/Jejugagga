package jeju.controller;

import jeju.dto.BoardReviewDto;
import jeju.service.ReviewTitleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ReviewTitleController {

    private final ReviewTitleService reviewTitleService;

    @Autowired
    public ReviewTitleController(ReviewTitleService reviewTitleService) {
        this.reviewTitleService = reviewTitleService;
    }

    @GetMapping("/titleDropdown")
    public String tourDropdown(Model model) {
        List<BoardReviewDto> titles = reviewTitleService.selectAllTitles();
        model.addAttribute("titles", titles);
        return "community/review/write";
    }

    @GetMapping("/searchTitles")
    @ResponseBody
    public List<BoardReviewDto> searchTitles(@RequestParam(name = "q",required = false) String query) {
        // 검색 서비스를 사용하여 title 검색
        return reviewTitleService.searchTitles(query);
    }

}

