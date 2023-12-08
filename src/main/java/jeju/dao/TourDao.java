package jeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.TourDto;

@Repository
public class TourDao {
	
	@Autowired
	private SqlSession session;
	private String nameSpace="jeju.dao.TourDao.";
	
	//전체갯수
	public int getTotalCount()
	{
		return session.selectOne(nameSpace+"totalCountOfTour");
	}
	
	//리스트
	public List<TourDto> getAllTour(int start, int perpage)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return session.selectList(nameSpace+"selectPagingOfTour",map);
	}
	
	
	
	//내용
	public TourDto getData(int tourcode)
	{
		return session.selectOne(nameSpace+"selectOneTour", tourcode);
	}
	
	// 검색어와 카테고리에 대해 검색하기(by 장원태)
	public List<TourDto> getSearchedTourByQueries(Map<String, Object> queryMap)
	{
		return session.selectList(nameSpace + "searchTourByQueries", queryMap);
	}
	
}
