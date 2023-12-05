package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardReviewDto {
	private int reviewcode;
	private int tourcode;
	private int usercode;
	private String title;
	private String content;
	private Timestamp registereddate;
}
