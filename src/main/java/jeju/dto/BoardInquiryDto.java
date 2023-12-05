package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardInquiryDto {
	private int questioncode;
	private int usercode;
	private Timestamp registereddate;
	private String title;
	private String content;
	private boolean isprivate;
}
