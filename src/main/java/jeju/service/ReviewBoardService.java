package jeju.service;

import jeju.dao.ReviewBoardDao;
import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import jeju.dto.ReviewPageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.ibatis.session.SqlSession;

import java.nio.file.AccessDeniedException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public String getLatestPhotoByReviewcode(int reviewcode) {
        return reviewBoardDao.selectLatestPhotoByReviewcode(reviewcode);
    }


    public String getNicknameByUsercode(int usercode) {
        return reviewBoardDao.selectNicknameByUsercode(usercode);
    }

    public void saveReviewPhoto(BoardReviewPhotoDto boardReviewPhotoDto) {
        reviewBoardDao.insertReviewPhoto(boardReviewPhotoDto);
    }

    //tourcode에 해당하는 리뷰만 받기(by 김나혜)
    public List<BoardReviewDto> getReviewListOfTour(int tourcode) {
        return reviewBoardDao.selectReviewListOfTour(tourcode);
    }

    public void deleteReview(int reviewId) {
        reviewBoardDao.deleteReview(reviewId);
    }

    private static final int PAGE_SIZE = 8;

    public Map<String, Object> getReviewsPage(int currentPage) {
        int offset = (currentPage - 1) * PAGE_SIZE;
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", PAGE_SIZE);

        List<ReviewPageDto> reviews = reviewBoardDao.selectPagedReviews(params);
        int totalReviews = reviewBoardDao.selectReviewCount();
        int totalPages = (int) Math.ceil((double) totalReviews / PAGE_SIZE);

        Map<String, Object> pageData = new HashMap<>();
        pageData.put("reviews", reviews);
        pageData.put("currentPage", currentPage);
        pageData.put("totalPages", totalPages);

        return pageData;
    }
}
