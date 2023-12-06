package jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jeju.dao.TourDao;
import jeju.dto.TourDto;

@RestController
public class TourRestController {
	
	@Autowired
	private TourDao tourDao;
	
	
	@GetMapping("/tour/view")
	public List<TourDto> getAllTour()
	{
		return tourDao.getAllTour();
	}
}

