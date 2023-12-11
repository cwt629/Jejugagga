package jeju.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeju.dto.CourseDto;
import jeju.dto.TourDto;

@Repository
public class CourseDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="jeju.dao.CourseDao.";
	
	public void insertCourse(CourseDto dto) {
		session.insert(nameSpace + "insertCourse", dto);
	}
}
