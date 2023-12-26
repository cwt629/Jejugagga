package jeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.CourseDto;
import jeju.dto.MemberTableDto;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession session;
	private String nameSpace="jeju.dao.AdminDao.";

	

	public List<Map<String, Object>> selectFreeboardAndNickname() {
		return session.selectList(nameSpace + "selectFreeboardAndNickname");
	}
	public List<Map<String, Object>> selectReviewboardAndNickname() {
		return session.selectList(nameSpace + "selectReviewboardAndNickname");
	}
	public List<Map<String, Object>> selectInquiryisanswer() {
		return session.selectList(nameSpace + "selectInquiryisanswer");
	}
	public List<Map<String, Object>> selectcourseAndNickname() {
		return session.selectList(nameSpace + "selectcourseAndNickname");
	}
	public void deleteFreebyFreeboardcode(int freeboardcode)
	{
		session.delete(nameSpace + "deleteFreebyFreeboardcode", freeboardcode);
	}
    public void deleteReviewbyReviewcode(int reviewcode) {
    	session.delete(nameSpace + "deleteReviewbyReviewcode", reviewcode);
    }
    public void deleteMemberbyID(String id) {
    	session.delete(nameSpace + "deleteMemberbyID", id);
    }
    public void deleteCoursebyCoursecode(int coursecode) {
    	session.delete(nameSpace + "deleteCoursebyCoursecode", coursecode);
    }
    public void inquiryanswerinsert(BoardInquiryAnswerDto dto)
	{
		session.insert(nameSpace+"inquiryanswerinsert",dto);
	}
    public BoardInquiryAnswerDto getBoardInquiryAnswerbyQuestioncode(int questioncode)
	{
		return session.selectOne(nameSpace + "getBoardInquiryAnswerbyQuestioncode", questioncode);
	}
	
	
}
