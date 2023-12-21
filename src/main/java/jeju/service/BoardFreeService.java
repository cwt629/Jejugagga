package jeju.service;

import jeju.boardfree_utils.BoardFreePagingCriteria;
import jeju.dao.BoardFreeDao;
import jeju.dto.BoardFreeDto;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class BoardFreeService {
	@Autowired
	private BoardFreeDao boardFreeDao;

	public List<BoardFreeDto> getList(BoardFreePagingCriteria criteria) {
		// criteria에 페이징 정보를 설정한다

		return boardFreeDao.getList(criteria);
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

	public BoardFreeDto detailBoardFreePage(int freeboardcode) {
		return boardFreeDao.detailBoardFreePage(freeboardcode);
	}

	public void updateViewCount(int freeboardcode) {
		boardFreeDao.updateViewCount(freeboardcode);
	}

	public int searchTotalCount(String searchType, String searchWord) throws Exception {
		return boardFreeDao.searchTotalCount(searchType, searchWord);
	}

	public List<BoardFreeDto> getBoardListWithUserNickname(String searchWord) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);

		return boardFreeDao.getBoardListWithUserNickname(paramMap);
	}
}