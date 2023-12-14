package jeju.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import jeju.dao.CourseLikesDao;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CourseLikesService {
	
	private CourseLikesDao courseLikesDao;
	
	public boolean isLikedByUser(int usercode, int coursecode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("coursecode", coursecode);
		return courseLikesDao.checkLike(map) > 0; // 좋아요 정보가 있으면 true, 없으면 false
	}
	
	public int getLikesCount(int coursecode)
	{
		return courseLikesDao.getLikesCount(coursecode);
	}
	
	public void addLike(int usercode, int coursecode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("coursecode", coursecode);
		
		courseLikesDao.addLike(map);
	}
	
	public void removeLike(int usercode, int coursecode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("coursecode", coursecode);
		
		courseLikesDao.removeLike(map);
	}
}
