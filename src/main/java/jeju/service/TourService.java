package jeju.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import jeju.dao.TourDao;
import jeju.dto.TourDto;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TourService {
	
	private TourDao tourDao;
	
	public List<TourDto> getSearchedListByQueries(String searchingName, List<String> categories){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		queryMap.put("searchingName", searchingName);
		queryMap.put("categories", categories);
		System.out.println(categories);
		
		System.out.println(queryMap);
		
		return tourDao.getSearchedTourByQueries(queryMap);
	}
}
