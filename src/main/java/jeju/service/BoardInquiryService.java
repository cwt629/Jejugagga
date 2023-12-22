package jeju.service;

import jeju.boardfree_utils.BoardInquiryPagingCriteria;
import jeju.dao.inquiryBoardDao;
import jeju.dto.BoardFreeDto;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BoardInquiryService {
		@Autowired
		private inquiryBoardDao boardInquiryDao;

		private String nameSpace = "jeju.dao.BoardinquiryAnswerDto.";

		private SqlSession session;

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

	public void updateReadCount(BoardInquiryDto dto) {
			boardInquiryDao.updateReadCount(dto);
	}

	public void insertBoardInquiryDto(BoardInquiryDto dto) {

		boardInquiryDao.insertInquiry(dto);
	}

	public inquiryBoardDao getData(int num) {

		return boardInquiryDao.getData(num);
	}

	public void updateinquiryBoard(BoardInquiryDto dto) {
		session.update(nameSpace + )
	}

	public int getTotalCount() {

			return boardInquiryDao.get();
	}

	public void delete(int num) {

		boardInquiryDao.deleteInquiry(num);
	}

	public BoardFreeDto detailBoardFreePage(int questioncode) {
			return boardInquiryDao.detail(questioncode);
	}

	public void updateViewCount(int questioncode) {
		boardFreeDao.updateViewCount(freeboardcode);
	}

	public int searchTotalCount(String searchType, String searchWord) throws Exception {
		return boardFreeDao.searchTotalCount(searchType, searchWord);
	}

}