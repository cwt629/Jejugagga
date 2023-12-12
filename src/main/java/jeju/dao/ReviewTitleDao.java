package jeju.dao;

import jeju.dto.BoardReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewTitleDao {

    private final SqlSession sqlSession;

    @Autowired
    public ReviewTitleDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<BoardReviewDto> selectAllTitles() {
        return sqlSession.selectList("ReviewTitleDao.selectAllTitles");
    }

    public List<BoardReviewDto> searchTitles(String keyword) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        return sqlSession.selectList("BoardTitleMapper.searchTitles", params);
    }
}


