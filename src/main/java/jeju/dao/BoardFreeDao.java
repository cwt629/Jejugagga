package jeju.dao;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dto.BoardFreeDto;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardFreeDao {
	@Autowired
	private SqlSession session;

	private String nameSpace = "jeju.dao.BoardFreeDao.";

	public int getTotalCount() {
		return session.selectOne(nameSpace + "totalCountOfBoardFree");
	}

	public List<BoardFreeDto> getList(int pageStart, int perPageNum) {
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("pageStart", pageStart);
		paramMap.put("perPageNum", perPageNum);
		return session.selectList(nameSpace + "selectPagingOfBoardFreeCriteria", paramMap);
	}

	public int getMaxNum() {
		return session.selectOne(nameSpace + "selectMaxNumOfBoardFree");

	}

	public void insertBoardFree(BoardFreeDto dto) {
		session.insert(nameSpace + "insertBoardFree", dto);
	}

	public void updateReadCount(int num) {
		session.update(nameSpace + "updateReadCountOfBoardFree", num);
	}

	public BoardFreeDto getData(int num) {
		return session.selectOne(nameSpace + "selectDataByNum", num);
	}

	public void updateBoardFree(BoardFreeDto dto) {
		session.update(nameSpace + "updateBoardFree", dto);
	}

	public void deleteBoardFree(int num) {
		session.delete(nameSpace + "deleteBoardFree", num);
	}

	public List<BoardFreeDto> selectAllfreeboardlist10Bydesc() {
		return session.selectList(nameSpace + "selectAllfreeboardlist10Bydesc");
	}

	public BoardFreeDto detailBoardFreePage(int freeboardcode) {
		return session.selectOne(nameSpace + "detailBoardFreePage", freeboardcode);
	}

	public void updateViewCount(int freeboardcode) {
		session.update(nameSpace + "updateViewCountOfBoardFree", freeboardcode);
	}

	public int searchCount(String searchType, String searchWord) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchType", searchType);
		paramMap.put("searchWord", searchWord);

		return session.selectOne(nameSpace + "searchCount", paramMap);
	}

	public List<BoardFreeDto> getSearchList(BoardFreePagingCriteria criteria) {
		return session.selectList(nameSpace + "getSearchList", criteria);
	}

	public List<BoardFreeDto> getList(BoardFreePagingCriteria criteria) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("pageStart", criteria.getPageStart());
		paramMap.put("perPageNum", criteria.getPerPageNum());
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("searchWord", criteria.getSearchWord());

		if ("title".equals(criteria.getSearchType())) {
			return session.selectList(nameSpace + "getSearchListByTitle", paramMap);
		} else if ("content".equals(criteria.getSearchType())) {
			return session.selectList(nameSpace + "getSearchListByContent", paramMap);
		} else if ("usercode".equals(criteria.getSearchType())) {
			return session.selectList(nameSpace + "getSearchListByUserCode", paramMap);
		} else {
			// 기본적으로 title 검색을 수행
			return session.selectList(nameSpace + "getSearchListByTitle", paramMap);
		}

//		return session.selectList(nameSpace + "getSearchList", paramMap);
	}

	public int searchTotalCount(String searchType, String searchWord) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchType", searchType);
		paramMap.put("searchWord", searchWord);

		return session.selectOne(nameSpace + "searchTotalCount", paramMap);
	}

}
