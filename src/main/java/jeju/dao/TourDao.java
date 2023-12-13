package jeju.dao;

import java.util.ArrayList;
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
	public int getTourTotalCount(String word, String sigungucode, List<String> contenttype)
	{
		//word에 검색단어가 안들어 있을 경우
		word = word == null || word.length() == 0 ? "" : word;
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("searchword", word);
		map.put("sigungucode", sigungucode);
		map.put("contenttype", contenttype);
		
		return session.selectOne(nameSpace+"totalCountOfTour", map);
	}
	
	//리스트
	public List<TourDto> getTourList(String word, int start,  List<String> contenttype, String sigungucode)
	{
		//word에 검색단어가 안들어 있을 경우
		word=word==null || word.length()==0 ? "" :word;
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("searchword", word);
		map.put("start", start);
		map.put("contenttype", (contenttype == null || contenttype.size() == 0) ? null : contenttype);
		map.put("sigungucode", sigungucode);
		
		//System.out.println(" ================ contenttype : " + contenttype);
		//System.out.println(" ================ getAllTour : " + map);
		
		return session.selectList(nameSpace+"selectListOfTour", map);
	}
	
	//내용
	public TourDto getTourData(int tourcode)
	{
		return session.selectOne(nameSpace+"selectOneOfTour", tourcode);
	}
	
	// 검색어와 카테고리에 대해 검색하기(by 장원태)
	public List<TourDto> getSearchedTourByQueries(Map<String, Object> queryMap)
	{
		return session.selectList(nameSpace + "searchTourByQueries", queryMap);
	}
	
}
