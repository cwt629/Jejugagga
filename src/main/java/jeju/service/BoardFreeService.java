package jeju.service;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dao.BoardFreeDao;
import jeju.dto.BoardFreeDto;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardFreeService {
	@Autowired
	private BoardFreeDao boardFreeDao;

	public List<BoardFreeDto> getList(BoardFreePagingCriteria criteria) {
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

		boardFreeDao.insertBoardFree(dto);
	}

	public BoardFreeDto getData(int num) {

		return boardFreeDao.getData(num);
	}

	public void updateBoardFree(BoardFreeDto dto) {
		boardFreeDao.updateBoardFree(dto);
	}

	public int getTotalCount() {
		return boardFreeDao.getTotalCount();
	}

	public void deleteBoardFree(int num) {

		boardFreeDao.deleteBoardFree(num);
	}
}

