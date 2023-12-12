package jeju.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardFreeCommentDto {
	private int freecommentcode;
	private int freeboardcode;
	private int usercode;
	private String content;
	private int relevel;
	private int regroup;
	private int restep;

	private boolean isdeleted;
	private Timestamp registereddate;
}
