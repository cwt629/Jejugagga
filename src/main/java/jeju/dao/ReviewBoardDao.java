package jeju.dao;

import jeju.dto.BoardReviewDto;
import jeju.dto.BoardReviewPhotoDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

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

    public String selectPhotoByReviewcode(int reviewcode) {
        return sqlSession.selectOne("ReviewBoardDao.selectPhotoByReviewcode", reviewcode);
    }
}
