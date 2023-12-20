package jeju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import jeju.dao.CourseDao;
import jeju.dto.CourseDto;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CourseService {
	
	private CourseDao courseDao;
	
	public void insertCourse(CourseDto dto)
	{
		courseDao.insertCourse(dto);
	}
	
	public List<CourseDto> selectAllCourses()
	{
		return courseDao.selectAllCourses();
	}
	
	public int getTotalCount()
	{
		return courseDao.getTotalCount();
	}
	
	public List<CourseDto> selectCoursesInPage(int coursePerPage, int startIndex)
	{
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("coursePerPage", coursePerPage);
		map.put("startIndex", startIndex);
		
		return courseDao.selectCoursesInPage(map);
	}
	
	public CourseDto selectOneCourse(int coursecode)
	{
		return courseDao.selectOneCourse(coursecode);
	}
	
	public void incrementReadcount(int coursecode)
	{
		courseDao.incrementReadcount(coursecode);
	}
	
	public void deleteCourse(int coursecode)
	{
		courseDao.deleteCourse(coursecode);
	}
	
	public int getSearchedCount(String query, int count, String numstd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("query", query);
		map.put("count", count);
		map.put("numstd", numstd);
		
		return courseDao.getSearchedCount(map);
	}
	
	public List<CourseDto> selectSearchedCoursesInPage(String query, int count, String numstd, String sortstd, int coursePerPage, int startIndex) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("query", query);
		map.put("count", count);
		map.put("numstd", numstd);
		map.put("sortstd", sortstd);
		map.put("coursePerPage", coursePerPage);
		map.put("startIndex", startIndex);
		
		return courseDao.selectSearchedCoursesInPage(map);
	}
	
	public void updateCourse(CourseDto dto) {
		courseDao.updateCourse(dto);
	}
}
