package jeju.dao;

import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.dto.BoardReviewDto;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserPageDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.BoardFreeDao.";

	public List<BoardFreeDto> selectOfFreeBoardByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfFreeBoardByUsercode", usercode);
	}

	public List<BoardReviewDto> selectOfReviewBoardByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfReviewBoardByUsercode", usercode);
	}

	public List<BoardInquiryDto> selectOfInquiryBoardByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfInquiryBoardByUsercode", usercode);
	}
	
}
