package jeju.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.CourseRouteDto;

@Repository
public class CourseRouteDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.CourseRouteDao.";

	public void insertCourseRoute(CourseRouteDto dto) {
		session.insert(nameSpace + "insertCourseRoute", dto);
	}
	
	public List<CourseRouteDto> selectOneRoute(int coursecode) {
		return session.selectList(nameSpace + "selectOneRoute", coursecode);
	}
	
	public void deleteOneSpot(CourseRouteDto dto) {
		session.delete(nameSpace + "deleteOneSpot", dto);
	}
	
	public void updateSingleOrder(Map<String, Integer> map) {
		session.update(nameSpace + "updateSingleOrder", map);
	}
}
