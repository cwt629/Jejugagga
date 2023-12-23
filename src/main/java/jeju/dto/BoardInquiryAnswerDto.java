package jeju.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardInquiryAnswerDto {
	private int answercode;
	private int questioncode;
	private int usercode;
	private Timestamp registereddate;
	private String title;
	private String content;

}
