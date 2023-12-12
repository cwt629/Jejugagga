package jeju.service;

import java.util.List;

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
}
