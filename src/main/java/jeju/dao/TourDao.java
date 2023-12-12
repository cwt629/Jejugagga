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
	public int getTotalCount(String word)
	{
		//word에 검색단어가 안들어 있을 경우 null값을 보내야 where문이 실행안된다
		word=word==null || word.length()==0?null:word;
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("searchword", word);
		
		return session.selectOne(nameSpace+"totalCountOfTour",word);
	}
	
	//리스트
	public List<TourDto> getAllTour(String word, int start)
	{
		//word에 검색단어가 안들어 있을 경우 null값을 보내야 where문이 실행안된다
		word=word==null || word.length()==0?null:word;
		
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("searchword", word);
		map.put("start", start);
		
		return session.selectList(nameSpace+"selectPagingOfTour", map);
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
