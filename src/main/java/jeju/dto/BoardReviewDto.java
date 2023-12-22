package jeju.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardReviewDto {
	private int reviewcode;
	private int tourcode;
	private int usercode;
	private String title;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp registereddate;
}
