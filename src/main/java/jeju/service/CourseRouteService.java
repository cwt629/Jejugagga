package jeju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<CourseRouteDto> selectOneRoute(int coursecode) {
		return courseRouteDao.selectOneRoute(coursecode);
	}
	
	public void deleteOneSpot(CourseRouteDto dto) {
		courseRouteDao.deleteOneSpot(dto);
	}
	
	public void updateSingleOrder(CourseRouteDto dto, int newOrder) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("coursecode", dto.getCoursecode());
		map.put("tourcode", dto.getTourcode());
		map.put("routeorder", dto.getRouteorder());
		map.put("neworder", newOrder);
		
		courseRouteDao.updateSingleOrder(map);
	}
}
