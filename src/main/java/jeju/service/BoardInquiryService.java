package jeju.service;

import jeju.boardfree_utils.BoardInquiryPagingCriteria;
import jeju.dao.inquiryBoard;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardInquiryService {
		@Autowired
		private inquiryBoard boardInquiryDao;

		public List<BoardInquiryDto> selectAllInquiries() {
			return boardInquiryDao.selectAllInquiries();
		}

		public BoardInquiryDto selectInquiryByCode(int questioncode) {
			return boardInquiryDao.selectInquiryByCode(questioncode);
		}

		public List<BoardInquiryAnswerDto> selectAnswersForQuestion(int questioncode) {
			return boardInquiryDao.selectAnswersForQuestion(questioncode);
		}

	public List<BoardFreeDto> getList(BoardInquiryPagingCriteria criteria) {
		// criteria에 페이징 정보를 설정한다
		int start = criteria.getPageStart();
		int perPageNum = criteria.getPerPageNum();
		String searchType = criteria.getSearchType();
		String searchWord = criteria.getSearchWord();

		return boardInquiryDao.getList(criteria);
	}

	public void updateReadCount(int num) {
		boardInquiryDao.updateReadCount(num);
	}

	public void insertBoardFree(BoardFreeDto dto) {

		boardInquiryDao.insertBoardFree(dto);
	}

	public bo getData(int num) {

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

}