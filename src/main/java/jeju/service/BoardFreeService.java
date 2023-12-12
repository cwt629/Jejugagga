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
		// criteria에 페이징 정보를 설정한다
		int start = criteria.getPageStart();
		int perPageNum = criteria.getPerPageNum();

		// DAO에 페이징 정보를 전달하여 페이징된 데이터를 받아온다..
		return boardFreeDao.getList(start, perPageNum);
	}

	public void updateReadCount(int num) {
	  boardFreeDao.updateReadCount(num);
	}

	public void insertBoardFree(BoardFreeDto dto) {
		int num = dto.getFreeboardcode();

		boardFreeDao.insertBoardFree(dto);
	}

	public BoardFreeDto getData(int num) {
		return boardFreeDao.getData(num);
	}

	public void updateBoardFree(BoardFreeDto dto) {
		boardFreeDao.updateBoardFree(dto);
	}

}

