package jeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public void deleteFreebyReviewcode(int freeboardcode)
	{
		session.delete(nameSpace + "deleteFreebyReviewcode", freeboardcode);
	}
    public void deleteReviewbyReviewcode(int reviewcode) {
    	session.delete(nameSpace + "deleteReviewbyReviewcode", reviewcode);
    }
    public void deleteMemberbyID(String id) {
    	session.delete(nameSpace + "deleteMemberbyID", id);
    }
	
	
}
