package jeju.dao;

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
}
