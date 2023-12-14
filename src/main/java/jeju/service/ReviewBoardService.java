package jeju.service;

import jeju.dao.ReviewBoardDao;
import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReviewBoardService {
    private final ReviewBoardDao reviewBoardDao;

    @Autowired
    public ReviewBoardService(ReviewBoardDao reviewBoardDao) {
        this.reviewBoardDao = reviewBoardDao;
    }

    public void saveReview(BoardReviewDto boardReviewDto) {
        reviewBoardDao.insertReview(boardReviewDto);
    }

    @Transactional
    public void submitReviewPhotos(BoardReviewPhotoDto boardReviewPhotoDto) {
        Integer tourcode = reviewBoardDao.selectTourcodeByReviewcode(boardReviewPhotoDto.getReviewcode());
        if (tourcode != null) {
            boardReviewPhotoDto.setTourcode(tourcode);
        } else {
            throw new IllegalStateException("No tourcode found for the given reviewcode.");
        }

        reviewBoardDao.insertReviewPhoto(boardReviewPhotoDto);
    }

    public Integer getTourcodeByReviewcode(int reviewcode) {
        return reviewBoardDao.selectTourcodeByReviewcode(reviewcode);
    }

    public List<BoardReviewDto> getAllReviews() {
        return reviewBoardDao.selectAllReviews();
    }

    public String getPhotoByReviewcode(int reviewcode) {
        return reviewBoardDao.selectPhotoByReviewcode(reviewcode);
    }

    public String getNicknameByUsercode(int usercode) {
        return reviewBoardDao.selectNicknameByUsercode(usercode);
    }
}
