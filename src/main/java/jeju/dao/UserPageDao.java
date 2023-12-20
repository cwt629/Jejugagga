package jeju.dao;

import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import jeju.dto.BoardReviewDto;
import jeju.dto.MemberTableDto;

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
	private String nameSpace2 = "jeju.dao.MemberTableDao.";
	
	public MemberTableDto getData(int usercode)
	{
		return session.selectOne(nameSpace2 + "selectDataByNum", usercode);
	}

	public List<BoardFreeDto> selectOfFreeBoardByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfFreeBoardByUsercode", usercode);
	}

	public List<BoardReviewDto> selectOfReviewBoardByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfReviewBoardByUsercode", usercode);
	}

	public List<Map<String, String>> selectOfInquiryAnswerResultByUsercode(int usercode) {
		return session.selectList(nameSpace + "selectOfInquiryAnswerResultByUsercode", usercode);
	}
	
}
