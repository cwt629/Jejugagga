package jeju.service;

import org.springframework.stereotype.Service;

import jeju.dao.CourseRouteDao;
import jeju.dto.CourseRouteDto;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CourseRouteService {
	
	private CourseRouteDao courseRouteDao;
	
	public void insertCourseRoute(CourseRouteDto dto) {
		courseRouteDao.insertCourseRoute(dto);
	}
}
