package jeju.dao;

import jeju.boardfree_utils.BoardInquiryPagingCriteria;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class inquiryBoard {
	@Autowired
	private SqlSession session;

	private String nameSpace = "jeju.dao.inquiryboard.dao.";

	public void insertInquiry(BoardInquiryDto dto) {
		session.insert(nameSpace + "insertInquiry", dto);
	}

	public List<BoardInquiryDto> getList(int pageStart, int perPageNum) {
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("pageStart", pageStart);
		paramMap.put("perPageNum", perPageNum);
		return session.selectList(nameSpace + "selectPagingOfBoardFreeCriteria", paramMap);
	}

	public void updateInquiry(BoardInquiryDto dto) {
		session.update(nameSpace + "updateInquiry", dto);
	}

	public void deleteInquiry(int questioncode) {
		session.delete(nameSpace + "deleteInquiry", questioncode);
	}

	public List<BoardInquiryDto> selectAllInquiries() {
		return session.selectList(nameSpace + "selectAllInquiries");
	}

	public BoardInquiryDto selectInquiryByCode(int questioncode) {
		return session.selectOne(nameSpace + "selectInquiryByCode", questioncode);
	}

	public List<BoardInquiryDto> selectUserInquiries(int usercode) {
		return session.selectList(nameSpace + "selectUserInquiries", usercode);
	}

	public List<BoardFreeDto> getList(BoardInquiryPagingCriteria criteria) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("pageStart", criteria.getPageStart());
		paramMap.put("perPageNum", criteria.getPerPageNum());
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("searchWord", criteria.getSearchWord());

			// 기본적으로 title 검색을 수행
			return session.selectList(nameSpace + "getSearchListByTitle", paramMap);
		}


	public int searchTotalCount(String searchType, String searchWord) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchType", searchType);
		paramMap.put("searchWord", searchWord);

		return session.selectOne(nameSpace + "searchTotalCount", paramMap);
	}

}

