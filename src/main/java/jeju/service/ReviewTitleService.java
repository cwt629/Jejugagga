package jeju.service;

import jeju.dao.ReviewTitleDao;
import jeju.dto.BoardReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReviewTitleService {
    private final ReviewTitleDao reviewTitleDao;

    @Autowired
    public ReviewTitleService(ReviewTitleDao reviewTitleDao) {
        this.reviewTitleDao = reviewTitleDao;
    }

    public List<BoardReviewDto> selectAllTitles() {
        return reviewTitleDao.selectAllTitles();
    }

    public List<BoardReviewDto> searchTitles(String keyword) {
        return reviewTitleDao.searchTitles(keyword);
    }
}
