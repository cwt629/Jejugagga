package jeju.dao;

import jeju.common.PagingCriteria;
import jeju.dto.BoardFreeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardFreeDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.BoardFreeDao.";

	public int getTotalCount() {
		return session.selectOne(nameSpace + "totalCountOfBoardFree");
	}

	public List<BoardFreeDto> getList(PagingCriteria criteria) {
		return session.selectList(nameSpace + "selectPagingOfBoardFreeCriteria", criteria);
	}

	public int getMaxNum() {
		return session.selectOne(nameSpace + "selectMaxOfBoardFree");

	}

}
