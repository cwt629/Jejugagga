package jeju.dao;

import java.util.List;
import java.util.Map;

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
	
	public List<CourseDto> selectAllCourses() {
		return session.selectList(nameSpace + "selectAllCourses");
	}
	
	public int getTotalCount() {
		return session.selectOne(nameSpace + "getTotalCount");
	}
	
	public List<CourseDto> selectCoursesInPage(Map<String, Integer> map) {
		return session.selectList(nameSpace + "selectAllCoursesInPage", map);
	}
	
	public CourseDto selectOneCourse(int coursecode) {
		return session.selectOne(nameSpace + "selectOneCourse", coursecode);
	}
	
	public void incrementReadcount(int coursecode) {
		session.update(nameSpace + "incrementReadcount", coursecode);
	}
}
