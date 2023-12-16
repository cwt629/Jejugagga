package jeju.dao;

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
	
	private String nameSpace="jeju.dao.BoardFreeDao.";

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

	public BoardFreeDto detailBoardFreePage(int freeboardcode) {
		return session.selectOne(nameSpace + "detailBoardFreePage", freeboardcode);
	}

	public void updateViewCount(int freeboardcode) {
		session.update(nameSpace + "updateViewCountOfBoardFree", freeboardcode);
	}
}
