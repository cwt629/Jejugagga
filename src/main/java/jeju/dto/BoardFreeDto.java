package jeju.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFreeDto {
	private int freeboardcode;
	private int usercode;
	private String title;
	private String content;
	private int viewcount;
	private String photo;
	private Timestamp registereddate;
	private Timestamp modifieddate;
}
