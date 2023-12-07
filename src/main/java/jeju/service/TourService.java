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
	
	
}
