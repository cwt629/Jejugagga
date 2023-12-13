package jeju.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.CourseLikesDto;

@Repository
public class CourseLikesDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.CourseLikesDao.";

	public int checkLike(Map<String, Integer> map)
	{
		return session.selectOne(nameSpace + "checklike", map);
	}
	
	public int getLikesCount(int coursecode)
	{
		return session.selectOne(nameSpace + "countLikes", coursecode);
	}
}
