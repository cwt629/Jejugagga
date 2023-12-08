package jeju.dao;

import jeju.dto.BoardFreeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class boardFreeDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.boardFreeDao.";

	public int getTotalCount() {
		return session.selectOne(nameSpace + "totalCountOfBoard");
	}

	public List<BoardFreeDto> getList(Map<String, Integer> map) {
		return session.selectList(nameSpace + "selectPaginOfBoard", map);
	}

	public int getMaxNum() {
		return session.selectOne(nameSpace + "selectMaxOfBoard");

	}

}
