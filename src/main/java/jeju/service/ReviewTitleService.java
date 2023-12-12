package jeju.service;

import jeju.dao.ReviewTitleDao;
import jeju.dto.BoardReviewDto;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReviewTitleService {
    private final ReviewTitleDao reviewTitleDao;

    public ReviewTitleService(ReviewTitleDao reviewTitleDao) {
        this.reviewTitleDao = reviewTitleDao;
    }

    public List<BoardReviewDto> getAllTitles() {
        return reviewTitleDao.selectAllTitles(); // 메소드 이름을 일치시킴
    }
}
