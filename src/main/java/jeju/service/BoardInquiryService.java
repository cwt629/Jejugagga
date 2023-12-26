package jeju.service;

import jeju.dao.inquiryBoardDao;
import jeju.dto.BoardInquiryAnswerDto;
import jeju.dto.BoardInquiryDto;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class BoardInquiryService {
	private final inquiryBoardDao boardInquiryDao;

	public List<BoardInquiryDto> selectAllInquiries() {
		return boardInquiryDao.selectAllInquiries();
	}

	public BoardInquiryDto selectInquiryByCode(int questioncode) {
		return boardInquiryDao.selectInquiryByCode(questioncode);
	}

	public List<Map<String, Object>> selectInquiryisanswer() {
		return boardInquiryDao.selectInquiryisanswer();
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

	public int getTotalCount() {
		return boardInquiryDao.getTotalCount();
	}

	public void delete(int num) {
		boardInquiryDao.deleteInquiry(num);
	}

	public BoardInquiryDto detailBoardFreePage(int questioncode) {
		return boardInquiryDao.detail(questioncode);
	}
	
	public BoardInquiryAnswerDto selectAnswersForQuestion(int questioncode) {
		return boardInquiryDao.selectAnswersForQuestion(questioncode);
	}


}