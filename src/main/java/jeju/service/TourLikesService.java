package jeju.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import jeju.dao.CourseLikesDao;
import jeju.dao.TourLikesDao;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TourLikesService {
	
	private TourLikesDao tourLikesDao;
	
	public boolean isLikedByUser(int usercode, int tourcode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("coursecode", tourcode);
		return tourLikesDao.checkLike(map) > 0; // 좋아요 정보가 있으면 true, 없으면 false
	}
	
	public int getLikesCount(int tourcode)
	{
		return tourLikesDao.getLikesCount(tourcode);
	}
	
	public void addLike(int usercode, int tourcode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("tourcode", tourcode);
		
		tourLikesDao.addLike(map);
	}
	
	public void removeLike(int usercode, int tourcode)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usercode", usercode);
		map.put("tourcode", tourcode);
		
		tourLikesDao.removeLike(map);
	}
}
