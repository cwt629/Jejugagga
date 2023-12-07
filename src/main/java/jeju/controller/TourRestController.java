package jeju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jeju.dao.TourDao;
import jeju.dto.TourDto;

@RestController
public class TourRestController {
	
	@Autowired
	private TourDao tourDao;
	
	
	@GetMapping("/tour/view")
	public List<TourDto> getAllTour(
			@RequestParam(defaultValue = "0") int start,
            @RequestParam(defaultValue = "8") int perpage
			)
	{
		return tourDao.getAllTour(start, perpage);
	}
}

