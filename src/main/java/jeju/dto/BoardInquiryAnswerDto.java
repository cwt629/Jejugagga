package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardInquiryAnswerDto {
	private int answercode;
	private int questioncode;
	private int usercode;
	private Timestamp registereddate;
	private String title;
	private String content;
}
