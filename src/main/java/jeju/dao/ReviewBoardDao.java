package jeju.dao;

import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import jeju.dto.ReviewPageDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewBoardDao {
    private final SqlSession sqlSession;

    @Autowired
    public ReviewBoardDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void insertReview(BoardReviewDto boardReviewDto) {
        sqlSession.insert("ReviewBoardDao.insertReview", boardReviewDto);
    }

    public void insertReviewPhoto(BoardReviewPhotoDto boardReviewPhotoDto) {
        sqlSession.insert("ReviewBoardDao.insertReviewPhoto", boardReviewPhotoDto);
    }

    public Integer selectTourcodeByReviewcode(int reviewcode) {
        return sqlSession.selectOne("ReviewBoardDao.selectTourcodeByReviewcode", reviewcode);
    }

    public String selectNicknameByUsercode(int usercode) {
        return sqlSession.selectOne("ReviewBoardDao.selectNicknameByUsercode", usercode);
    }

    public List<BoardReviewDto> selectAllReviews() {
        return sqlSession.selectList("ReviewBoardDao.selectAllReviews");
    }

    public String selectLatestPhotoByReviewcode(int reviewcode) {
        return sqlSession.selectOne("ReviewBoardDao.selectLatestPhotoByReviewcode", reviewcode);
    }
    
    public List<BoardReviewDto> selectReview10Bydesc() {
    	return sqlSession.selectList("selectReview10Bydesc");
    }
    
    public void deleteReviewbyReviewcode(int reviewcode) {
    	sqlSession.delete("deleteReviewbyReviewcode", reviewcode);
    }
    
    //tourcode에 해당하는 리뷰만 받기(by 김나혜)
    public List<BoardReviewDto> selectReviewListOfTour(int tourcode) {
        return sqlSession.selectList("ReviewBoardDao.selectReviewListOfTour", tourcode);
    }

    public void deleteReview(int reviewId) {
        sqlSession.delete("ReviewBoardDao.deleteReview", reviewId);
    }

    public List<ReviewPageDto> selectPagedReviews(Map<String, Object> params) {
        return sqlSession.selectList("ReviewBoardDao.selectPagedReviews", params);
    }

    public int selectReviewCount() {
        return sqlSession.selectOne("ReviewBoardDao.selectReviewCount");
    }

}
