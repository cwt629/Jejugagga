package jeju.dao;

import java.util.HashMap;
import java.util.List;

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
	public List<TourDto> getAllTour()
	{
		return session.selectList(nameSpace+"selectAllTour");
	}
	
	//내용
	public TourDto getData(int tourcode)
	{
		return session.selectOne(nameSpace+"selectOneTour", tourcode);
	}
	
	
	
	
}
