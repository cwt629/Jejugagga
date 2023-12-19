package jeju.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.CourseLikesDto;

@Repository
public class TourLikesDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.TourLikesDao.";

	public int checkLike(Map<String, Integer> map)
	{
		return session.selectOne(nameSpace + "checklike", map);
	}
	
	public int getLikesCount(int tourcode)
	{
		return session.selectOne(nameSpace + "countLikes", tourcode);
	}
	
	public void addLike(Map<String, Integer> map)
	{
		session.insert(nameSpace + "addLike", map);
	}
	
	public void removeLike(Map<String, Integer> map)
	{
		session.delete(nameSpace + "removeLike", map);
	}
}
