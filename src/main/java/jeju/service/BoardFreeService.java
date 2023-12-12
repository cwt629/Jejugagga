package jeju.service;

import jeju.common.PagingCriteria;
import jeju.dao.BoardFreeDao;
import jeju.dto.BoardFreeDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardFreeService {
	
	private BoardFreeDao boardFreeDao;

	public List<BoardFreeDto> getList(PagingCriteria criteria) {
		return boardFreeDao.getList(criteria);
	}
}
